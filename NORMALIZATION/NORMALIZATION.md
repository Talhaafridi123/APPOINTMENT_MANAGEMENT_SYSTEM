# Database Normalization Report — Appointment Management System

**Database Name:** appointment_management_system  
**Version:** 1.0  
**Prepared By:** Muhammad Talha  
**Institute:** IMS Peshawar  
**Submission Date:** May 2026

---

# Introduction

Normalization is a database design technique used to organize data efficiently. It helps reduce duplicate data, improves consistency, and prevents insertion, deletion, and update anomalies.

For this Appointment Management System, normalization has been applied up to Third Normal Form (3NF). Each table has been analyzed individually to verify whether it satisfies 1NF, 2NF, and 3NF requirements.

---

# 1. USERS TABLE

## First Normal Form (1NF)
The USERS table satisfies 1NF because each column stores only one value for every record. There are no repeating attributes or multiple values stored in a single column. UserID uniquely identifies every user.

## Second Normal Form (2NF)
The table is also in 2NF because the primary key consists of a single column (UserID). Since there is no composite primary key, partial dependency cannot occur. Every non-key attribute depends fully on UserID.

## Third Normal Form (3NF)
The USERS table satisfies 3NF because no non-key attribute depends on another non-key attribute. Attributes such as Name, Email, Phone, Password, and Role depend only on UserID.

### Modification Applied
No structural modification was required.

---

# 2. ADMINS TABLE

## First Normal Form (1NF)
All values stored in the ADMINS table are atomic. Each row represents one admin record only.

## Second Normal Form (2NF)
The table contains a single-column primary key (AdminID), therefore partial dependency does not exist.

## Third Normal Form (3NF)
AdminName, Email, and Password are directly dependent on AdminID only. No transitive dependency exists.

### Modification Applied
No changes were necessary.

---

# 3. APPOINTMENT_TYPES TABLE

## First Normal Form (1NF)
Every column contains single-valued data. TypeID uniquely identifies each appointment type.

## Second Normal Form (2NF)
Since the table uses a single primary key (TypeID), all attributes are fully dependent on it.

## Third Normal Form (3NF)
TypeName and Description depend only on TypeID. No non-key attribute determines another non-key attribute.

### Modification Applied
Appointment category information was separated into this table to reduce repeated type data in appointments.

---

# 4. APPOINTMENTS TABLE

## First Normal Form (1NF)
The APPOINTMENTS table contains atomic values only. Each appointment record stores one date, one time, and one status.

## Second Normal Form (2NF)
AppointmentID is a single-column primary key, so partial dependency is not possible.

## Third Normal Form (3NF)
All attributes including AppointmentDate, AppointmentTime, Purpose, Notes, and Status depend directly on AppointmentID.

### Modification Applied
Type-specific appointment details were removed from this table and distributed into specialized appointment tables.

---

# 5. DOCTOR_APPOINTMENTS TABLE

## First Normal Form (1NF)
All attributes are atomic. One doctor appointment record stores one doctor name, one clinic name, and one specialization.

## Second Normal Form (2NF)
The table satisfies 2NF because DoctorAppointmentID is a single primary key.

## Third Normal Form (3NF)
DoctorName, Specialization, Symptoms, and ClinicName depend directly on DoctorAppointmentID only.

### Modification Applied
Doctor-specific information was isolated from the main appointments table to avoid unnecessary NULL values.

---

# 6. HOME_SERVICE_APPOINTMENTS TABLE

## First Normal Form (1NF)
Every column contains a single value. Address and city information are stored separately.

## Second Normal Form (2NF)
HomeServiceID is the single primary key, therefore partial dependency cannot exist.

## Third Normal Form (3NF)
ProviderName, ServiceType, Address, City, and EstimatedDuration depend only on HomeServiceID.

### Modification Applied
Home service details were separated from the central appointments table.

---

# 7. LAWYER_COURT_APPOINTMENTS TABLE

## First Normal Form (1NF)
All attributes are atomic and each row stores a single lawyer appointment record.

## Second Normal Form (2NF)
The table uses a single-column primary key, removing the possibility of partial dependency.

## Third Normal Form (3NF)
LawyerName, CourtName, CaseType, and ReferenceNumber depend only on LawyerAppointmentID.

### Modification Applied
Lawyer and court related information was moved into a dedicated table.

---

# 8. UNIVERSITY_OFFICE_APPOINTMENTS TABLE

## First Normal Form (1NF)
All columns contain atomic values without repeating groups.

## Second Normal Form (2NF)
UniversityAppointmentID acts as a single primary key, so partial dependency does not occur.

## Third Normal Form (3NF)
InstitutionName, Department, Location, Purpose, and RequiredDocuments depend directly on UniversityAppointmentID.

### Modification Applied
University and office appointment attributes were separated to maintain cleaner structure.

---

# Final Summary

The Appointment Management System database successfully satisfies:

- First Normal Form (1NF)
- Second Normal Form (2NF)
- Third Normal Form (3NF)

The normalization process improved the database structure by:

- Reducing redundancy
- Removing unnecessary NULL values
- Improving data consistency
- Ensuring proper dependency management
- Making the database easier to maintain and expand

---

# Foreign Key Relationships

| Parent Table | Child Table | Foreign Key |
|---|---|---|
| USERS | APPOINTMENTS | user_id → USERS(UserID) |
| ADMINS | APPOINTMENTS | admin_id → ADMINS(AdminID) |
| APPOINTMENT_TYPES | APPOINTMENTS | type_id → APPOINTMENT_TYPES(TypeID) |
| APPOINTMENTS | DOCTOR_APPOINTMENTS | appointment_id → APPOINTMENTS(AppointmentID) |
| APPOINTMENTS | HOME_SERVICE_APPOINTMENTS | appointment_id → APPOINTMENTS(AppointmentID) |
| APPOINTMENTS | LAWYER_COURT_APPOINTMENTS | appointment_id → APPOINTMENTS(AppointmentID) |
| APPOINTMENTS | UNIVERSITY_OFFICE_APPOINTMENTS | appointment_id → APPOINTMENTS(AppointmentID) |

---

*Appointment Management System — Database Lab Project — IMS Peshawar — 2026*