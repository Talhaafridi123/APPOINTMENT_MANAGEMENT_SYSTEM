-- ============================================================
-- Milestone 5 — Validation Queries
-- Appointment Management System
-- Muhammad Talha & Usman Syed | IMS Peshawar | May 2026
-- ============================================================

USE appointment_db;

-- ─────────────────────────────────────────
-- 1. ROW COUNT VALIDATION (all 8 tables)
-- ─────────────────────────────────────────
SELECT 'users'                          AS table_name, COUNT(*) AS row_count FROM users
UNION ALL
SELECT 'admins',                                        COUNT(*) FROM admins
UNION ALL
SELECT 'appointment_types',                             COUNT(*) FROM appointment_types
UNION ALL
SELECT 'appointments',                                  COUNT(*) FROM appointments
UNION ALL
SELECT 'doctor_appointments',                           COUNT(*) FROM doctor_appointments
UNION ALL
SELECT 'home_service_appointments',                     COUNT(*) FROM home_service_appointments
UNION ALL
SELECT 'lawyer_court_appointments',                     COUNT(*) FROM lawyer_court_appointments
UNION ALL
SELECT 'university_office_appointments',                COUNT(*) FROM university_office_appointments;

-- ─────────────────────────────────────────
-- 2. NULL CHECK — Critical NOT NULL Fields
-- ─────────────────────────────────────────
SELECT 'users with NULL name/email'     AS check_name, COUNT(*) AS violations
  FROM users WHERE name IS NULL OR email IS NULL
UNION ALL
SELECT 'appointments with NULL date',   COUNT(*)
  FROM appointments WHERE appointment_date IS NULL OR appointment_time IS NULL
UNION ALL
SELECT 'doctor_apts with NULL doctor',  COUNT(*)
  FROM doctor_appointments WHERE doctor_name IS NULL
UNION ALL
SELECT 'home_apts with NULL address',   COUNT(*)
  FROM home_service_appointments WHERE address IS NULL
UNION ALL
SELECT 'law_apts with NULL lawyer',     COUNT(*)
  FROM lawyer_court_appointments WHERE lawyer_name IS NULL
UNION ALL
SELECT 'uni_apts with NULL institution',COUNT(*)
  FROM university_office_appointments WHERE institution_name IS NULL;

-- ─────────────────────────────────────────
-- 3. FOREIGN KEY INTEGRITY CHECK
-- ─────────────────────────────────────────
-- Appointments with invalid user_id
SELECT 'Orphan appointments (no user)'  AS fk_check, COUNT(*) AS violations
  FROM appointments a LEFT JOIN users u ON a.user_id = u.id
  WHERE u.id IS NULL
UNION ALL
-- Appointments with invalid type_id
SELECT 'Orphan appointments (no type)', COUNT(*)
  FROM appointments a LEFT JOIN appointment_types t ON a.type_id = t.id
  WHERE t.id IS NULL
UNION ALL
-- Doctor appointments with no parent
SELECT 'Orphan doctor_appointments',    COUNT(*)
  FROM doctor_appointments d LEFT JOIN appointments a ON d.appointment_id = a.id
  WHERE a.id IS NULL
UNION ALL
-- Home service appointments with no parent
SELECT 'Orphan home_service_appointments', COUNT(*)
  FROM home_service_appointments h LEFT JOIN appointments a ON h.appointment_id = a.id
  WHERE a.id IS NULL
UNION ALL
-- Lawyer appointments with no parent
SELECT 'Orphan lawyer_court_appointments', COUNT(*)
  FROM lawyer_court_appointments l LEFT JOIN appointments a ON l.appointment_id = a.id
  WHERE a.id IS NULL
UNION ALL
-- University appointments with no parent
SELECT 'Orphan university_office_appointments', COUNT(*)
  FROM university_office_appointments u LEFT JOIN appointments a ON u.appointment_id = a.id
  WHERE a.id IS NULL;

-- ─────────────────────────────────────────
-- 4. DUPLICATE CHECK — Unique Fields
-- ─────────────────────────────────────────
SELECT 'Duplicate user emails'          AS dup_check, COUNT(*) - COUNT(DISTINCT email) AS duplicates FROM users
UNION ALL
SELECT 'Duplicate user_ids',            COUNT(*) - COUNT(DISTINCT user_id) FROM users
UNION ALL
SELECT 'Duplicate admin emails',        COUNT(*) - COUNT(DISTINCT email) FROM admins
UNION ALL
SELECT 'Duplicate appointment_ids',     COUNT(*) - COUNT(DISTINCT appointment_id) FROM appointments;

-- ─────────────────────────────────────────
-- 5. STATUS DISTRIBUTION
-- ─────────────────────────────────────────
SELECT status, COUNT(*) AS total
  FROM appointments
  GROUP BY status
  ORDER BY total DESC;

-- ─────────────────────────────────────────
-- 6. APPOINTMENTS BY TYPE (JOIN VERIFY)
-- ─────────────────────────────────────────
SELECT t.type_code, t.type_name, COUNT(a.id) AS total_appointments
  FROM appointment_types t
  LEFT JOIN appointments a ON t.id = a.type_id
  GROUP BY t.id, t.type_code, t.type_name
  ORDER BY total_appointments DESC;

-- ─────────────────────────────────────────
-- 7. FULL JOIN — User + Appointment + Type
-- ─────────────────────────────────────────
SELECT
    u.user_id,
    u.name           AS user_name,
    a.appointment_id,
    t.type_name      AS appointment_type,
    a.appointment_date,
    a.status
  FROM appointments a
  JOIN users             u ON a.user_id  = u.id
  JOIN appointment_types t ON a.type_id  = t.id
  ORDER BY a.appointment_date DESC
  LIMIT 10;

-- ─────────────────────────────────────────
-- 8. CHECK — Patient age range (DOC table)
-- ─────────────────────────────────────────
SELECT 'Invalid patient ages (out of 0-120)' AS constraint_check, COUNT(*) AS violations
  FROM doctor_appointments
  WHERE patient_age < 0 OR patient_age > 120;

-- ─────────────────────────────────────────
-- 9. LOAD DATA INFILE STATEMENTS (Milestone 5)
-- Run these AFTER tables are created
-- ─────────────────────────────────────────
/*
LOAD DATA INFILE '/path/to/csv_data/users.csv'
INTO TABLE users
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, user_id, name, email, phone, password, role, created_at);

LOAD DATA INFILE '/path/to/csv_data/admins.csv'
INTO TABLE admins
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, admin_id, name, email, password, created_at);

LOAD DATA INFILE '/path/to/csv_data/appointment_types.csv'
INTO TABLE appointment_types
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, type_code, type_name, description, is_active);

LOAD DATA INFILE '/path/to/csv_data/appointments.csv'
INTO TABLE appointments
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, appointment_id, user_id, admin_id, type_id, appointment_date, appointment_time, purpose, status, notes, created_at, updated_at);

LOAD DATA INFILE '/path/to/csv_data/doctor_appointments.csv'
INTO TABLE doctor_appointments
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, appointment_id, doctor_name, specialization, clinic_hospital, patient_age, symptoms, prescription_notes);

LOAD DATA INFILE '/path/to/csv_data/home_service_appointments.csv'
INTO TABLE home_service_appointments
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, appointment_id, service_type, service_provider, address, city, scheduled_duration, special_instructions);

LOAD DATA INFILE '/path/to/csv_data/lawyer_court_appointments.csv'
INTO TABLE lawyer_court_appointments
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, appointment_id, lawyer_name, case_type, court_name, hearing_date, case_number, case_description);

LOAD DATA INFILE '/path/to/csv_data/university_office_appointments.csv'
INTO TABLE university_office_appointments
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, appointment_id, institution_name, department, contact_person, meeting_purpose, room_or_office, documents_required);
*/
