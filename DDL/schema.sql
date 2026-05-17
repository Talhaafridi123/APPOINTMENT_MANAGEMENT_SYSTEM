-- ============================================================
-- Appointment Management System — Complete Database Schema
-- Fully Normalized (1NF → 2NF → 3NF) with Full Constraints
-- Muhammad Talha & Usman Syed | IMS Peshawar | May 2026
-- ============================================================

DROP DATABASE IF EXISTS appointment_db;
CREATE DATABASE IF NOT EXISTS appointment_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE appointment_db;

-- ─────────────────────────────────────────────────────────────
-- TABLE 1: users
-- Stores all registered users of the system.
-- 3NF: All attributes depend only on id (PK).
-- Separated from admins to avoid role-based partial dependency.
-- ─────────────────────────────────────────────────────────────
CREATE TABLE users (
    id          INT            AUTO_INCREMENT,
    user_id     VARCHAR(20)    NOT NULL,
    name        VARCHAR(100)   NOT NULL,
    email       VARCHAR(100)   NOT NULL,
    phone       VARCHAR(20),
    password    VARCHAR(255)   NOT NULL,
    role        ENUM('user', 'admin') NOT NULL DEFAULT 'user',
    created_at  TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_users        PRIMARY KEY (id),
    CONSTRAINT uq_users_uid    UNIQUE (user_id),
    CONSTRAINT uq_users_email  UNIQUE (email),
    CONSTRAINT chk_users_email CHECK (email LIKE '%@%.%'),
    CONSTRAINT chk_users_name  CHECK (CHAR_LENGTH(name) >= 2)
);

-- ─────────────────────────────────────────────────────────────
-- TABLE 2: admins
-- Stores admin accounts separately from users.
-- 3NF: admin_id format only applies to admins — separating
-- avoids nullable admin-specific columns in users table.
-- ─────────────────────────────────────────────────────────────
CREATE TABLE admins (
    id          INT            AUTO_INCREMENT,
    admin_id    VARCHAR(20)    NOT NULL,
    name        VARCHAR(100)   NOT NULL,
    email       VARCHAR(100)   NOT NULL,
    password    VARCHAR(255)   NOT NULL,
    created_at  TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_admins       PRIMARY KEY (id),
    CONSTRAINT uq_admins_aid   UNIQUE (admin_id),
    CONSTRAINT uq_admins_email UNIQUE (email),
    CONSTRAINT chk_admins_email CHECK (email LIKE '%@%.%')
);

-- ─────────────────────────────────────────────────────────────
-- TABLE 3: appointment_types
-- Lookup table for appointment categories.
-- 3NF: Extracted from appointments to eliminate repeating
-- type strings (1NF violation) and transitive dependency
-- id → type_code → type_name (3NF violation).
-- ─────────────────────────────────────────────────────────────
CREATE TABLE appointment_types (
    id          INT            AUTO_INCREMENT,
    type_code   VARCHAR(10)    NOT NULL,
    type_name   VARCHAR(100)   NOT NULL,
    description TEXT,
    is_active   TINYINT(1)     NOT NULL DEFAULT 1,

    CONSTRAINT pk_apt_types     PRIMARY KEY (id),
    CONSTRAINT uq_apt_type_code UNIQUE (type_code),
    CONSTRAINT chk_apt_active   CHECK (is_active IN (0, 1))
);

-- Seed Data
INSERT INTO appointment_types (type_code, type_name, description) VALUES
('DOC',  'Doctor Appointment', 'Medical consultation with doctors and specialists.'),
('HOME', 'Home Service',       'Home maintenance and repair service scheduling.'),
('LAW',  'Lawyer/Court',       'Legal consultations and court hearing appointments.'),
('UNI',  'University/Office',  'Academic and government office meeting appointments.');

-- ─────────────────────────────────────────────────────────────
-- TABLE 4: appointments (Central Fact Table)
-- 3NF: All attributes depend only on id (PK).
-- type-specific details moved to child tables to eliminate
-- NULL-heavy columns (1NF) and partial dependencies (2NF).
-- ─────────────────────────────────────────────────────────────
CREATE TABLE appointments (
    id               INT            AUTO_INCREMENT,
    appointment_id   VARCHAR(20)    NOT NULL,
    user_id          INT            NOT NULL,
    admin_id         INT            NULL,
    type_id          INT            NOT NULL,
    appointment_date DATE           NOT NULL,
    appointment_time TIME           NOT NULL,
    purpose          VARCHAR(200),
    status           ENUM('pending', 'confirmed', 'cancelled', 'completed')
                                    NOT NULL DEFAULT 'pending',
    notes            TEXT,
    created_at       TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP
                                    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT pk_appointments  PRIMARY KEY (id),
    CONSTRAINT uq_apt_id        UNIQUE (appointment_id),
    CONSTRAINT fk_apt_user      FOREIGN KEY (user_id)  REFERENCES users(id)
                                ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_apt_admin     FOREIGN KEY (admin_id) REFERENCES admins(id)
                                ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_apt_type      FOREIGN KEY (type_id)  REFERENCES appointment_types(id)
                                ON DELETE RESTRICT ON UPDATE CASCADE
);

-- ─────────────────────────────────────────────────────────────
-- TABLE 5: doctor_appointments
-- Child table for DOC type appointments.
-- 3NF: doctor_name, specialization, clinic_name, symptoms
-- all depend only on id (PK). Separated to avoid NULL columns
-- in appointments when type is not DOC (2NF compliance).
-- ─────────────────────────────────────────────────────────────
CREATE TABLE doctor_appointments (
    id                  INT          AUTO_INCREMENT,
    appointment_id      INT          NOT NULL,
    doctor_name         VARCHAR(100) NOT NULL,
    specialization      VARCHAR(100),
    clinic_name         VARCHAR(100),
    patient_age         INT,
    symptoms            TEXT,
    prescription_notes  TEXT,

    CONSTRAINT pk_doc_apt          PRIMARY KEY (id),
    CONSTRAINT uq_doc_apt_id       UNIQUE (appointment_id),
    CONSTRAINT fk_doc_apt          FOREIGN KEY (appointment_id)
                                   REFERENCES appointments(id)
                                   ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_doc_patient_age CHECK (patient_age BETWEEN 0 AND 120)
);

-- ─────────────────────────────────────────────────────────────
-- TABLE 6: home_service_appointments
-- Child table for HOME type appointments.
-- 3NF: service_type is NOT dependent on provider_name
-- (no transitive dependency). Separated for 2NF compliance.
-- ─────────────────────────────────────────────────────────────
CREATE TABLE home_service_appointments (
    id                   INT          AUTO_INCREMENT,
    appointment_id       INT          NOT NULL,
    service_type         VARCHAR(100) NOT NULL,
    provider_name        VARCHAR(100),
    address              TEXT         NOT NULL,
    city                 VARCHAR(80),
    special_instructions TEXT,
    estimated_duration   INT,

    CONSTRAINT pk_home_apt       PRIMARY KEY (id),
    CONSTRAINT uq_home_apt_id    UNIQUE (appointment_id),
    CONSTRAINT fk_home_apt       FOREIGN KEY (appointment_id)
                                 REFERENCES appointments(id)
                                 ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_home_duration CHECK (estimated_duration > 0)
);

-- ─────────────────────────────────────────────────────────────
-- TABLE 7: lawyer_court_appointments
-- Child table for LAW type appointments.
-- 3NF: case_ref_number is NOT dependent on court_name.
-- lawyer_name depends only on id (PK). Separated for 2NF.
-- ─────────────────────────────────────────────────────────────
CREATE TABLE lawyer_court_appointments (
    id               INT          AUTO_INCREMENT,
    appointment_id   INT          NOT NULL,
    lawyer_name      VARCHAR(100) NOT NULL,
    case_type        VARCHAR(100),
    court_name       VARCHAR(100),
    hearing_date     DATE,
    case_ref_number  VARCHAR(50),
    case_description TEXT,

    CONSTRAINT pk_law_apt    PRIMARY KEY (id),
    CONSTRAINT uq_law_apt_id UNIQUE (appointment_id),
    CONSTRAINT fk_law_apt    FOREIGN KEY (appointment_id)
                             REFERENCES appointments(id)
                             ON DELETE CASCADE ON UPDATE CASCADE
);

-- ─────────────────────────────────────────────────────────────
-- TABLE 8: university_office_appointments
-- Child table for UNI type appointments.
-- 3NF: location depends on id (PK), NOT on department.
-- required_documents varies per booking — no transitive dep.
-- Separated to avoid partial dependency for UNI type.
-- ─────────────────────────────────────────────────────────────
CREATE TABLE university_office_appointments (
    id                INT          AUTO_INCREMENT,
    appointment_id    INT          NOT NULL,
    institution_name  VARCHAR(100) NOT NULL,
    department        VARCHAR(100),
    contact_person    VARCHAR(100),
    purpose           VARCHAR(200),
    location          VARCHAR(100),
    required_documents TEXT,

    CONSTRAINT pk_uni_apt    PRIMARY KEY (id),
    CONSTRAINT uq_uni_apt_id UNIQUE (appointment_id),
    CONSTRAINT fk_uni_apt    FOREIGN KEY (appointment_id)
                             REFERENCES appointments(id)
                             ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================================
-- END OF SCHEMA
-- Total Tables : 8
-- Character Set: utf8mb4
-- Constraints  : PK, FK, UNIQUE, NOT NULL, CHECK, DEFAULT
-- ON DELETE    : RESTRICT / SET NULL / CASCADE
-- Normalization: 1NF → 2NF → 3NF
-- ============================================================
