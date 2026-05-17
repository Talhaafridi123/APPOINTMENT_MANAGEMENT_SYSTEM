"""
Milestone 3 — Synthetic Data Generator
Appointment Management System
Muhammad Talha & Usman Syed | IMS Peshawar
"""
import csv, random, os
from datetime import datetime, timedelta, date
from faker import Faker

fake = Faker()
random.seed(42)
Faker.seed(42)

OUT = "/home/claude/milestones/csv_data"
os.makedirs(OUT, exist_ok=True)

# ─────────────────────────────────────────────
# 1. USERS
# ─────────────────────────────────────────────
users = []
for i in range(1, 31):
    users.append({
        "id": i,
        "user_id": f"USR-2025-{i:05d}",
        "name": fake.name(),
        "email": fake.unique.email(),
        "phone": f"03{random.randint(10,49)}{random.randint(1000000,9999999)}",
        "password": fake.sha256(),
        "role": "user",
        "created_at": fake.date_time_between(start_date="-6m", end_date="now").strftime("%Y-%m-%d %H:%M:%S"),
    })

with open(f"{OUT}/users.csv", "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=users[0].keys())
    w.writeheader(); w.writerows(users)
print(f"✓ users.csv — {len(users)} rows")

# ─────────────────────────────────────────────
# 2. ADMINS
# ─────────────────────────────────────────────
admins = []
admin_names = ["Ali Hassan", "Sara Qureshi", "Bilal Ahmed"]
for i, name in enumerate(admin_names, 1):
    admins.append({
        "id": i,
        "admin_id": f"ADM-2025-{i:05d}",
        "name": name,
        "email": f"{name.split()[0].lower()}.admin@ims.edu.pk",
        "password": fake.sha256(),
        "created_at": fake.date_time_between(start_date="-8m", end_date="-6m").strftime("%Y-%m-%d %H:%M:%S"),
    })

with open(f"{OUT}/admins.csv", "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=admins[0].keys())
    w.writeheader(); w.writerows(admins)
print(f"✓ admins.csv — {len(admins)} rows")

# ─────────────────────────────────────────────
# 3. APPOINTMENT_TYPES
# ─────────────────────────────────────────────
apt_types = [
    {"id":1,"type_code":"DOC","type_name":"Doctor Appointment","description":"Medical consultation with doctors and specialists.","is_active":1},
    {"id":2,"type_code":"HOME","type_name":"Home Service","description":"Home maintenance and repair service scheduling.","is_active":1},
    {"id":3,"type_code":"LAW","type_name":"Lawyer/Court","description":"Legal consultations and court hearing appointments.","is_active":1},
    {"id":4,"type_code":"UNI","type_name":"University/Office","description":"Academic and government office meeting appointments.","is_active":1},
]

with open(f"{OUT}/appointment_types.csv", "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=apt_types[0].keys())
    w.writeheader(); w.writerows(apt_types)
print(f"✓ appointment_types.csv — {len(apt_types)} rows")

# ─────────────────────────────────────────────
# 4. APPOINTMENTS (50 rows)
# ─────────────────────────────────────────────
statuses = ["pending","confirmed","cancelled","completed"]
appointments = []
type_counts = {1:0, 2:0, 3:0, 4:0}

for i in range(1, 51):
    type_id = random.choice([1,2,3,4])
    type_counts[type_id] += 1
    appt_date = fake.date_between(start_date="-3m", end_date="+2m")
    appt_time = f"{random.randint(8,17):02d}:{random.choice(['00','15','30','45'])}:00"
    appointments.append({
        "id": i,
        "appointment_id": f"APT-2025-{i:05d}",
        "user_id": random.randint(1, 30),
        "admin_id": random.choice([1,2,3]) if random.random() > 0.3 else "",
        "type_id": type_id,
        "appointment_date": appt_date.strftime("%Y-%m-%d"),
        "appointment_time": appt_time,
        "purpose": random.choice(["Routine checkup","Follow-up","Consultation","Emergency","Query","Review"]),
        "status": random.choice(statuses),
        "notes": fake.sentence() if random.random() > 0.5 else "",
        "created_at": fake.date_time_between(start_date="-4m", end_date="now").strftime("%Y-%m-%d %H:%M:%S"),
        "updated_at": fake.date_time_between(start_date="-2m", end_date="now").strftime("%Y-%m-%d %H:%M:%S"),
    })

with open(f"{OUT}/appointments.csv", "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=appointments[0].keys())
    w.writeheader(); w.writerows(appointments)
print(f"✓ appointments.csv — {len(appointments)} rows | by type: {type_counts}")

# Filter by type
doc_ids  = [a["id"] for a in appointments if a["type_id"]==1]
home_ids = [a["id"] for a in appointments if a["type_id"]==2]
law_ids  = [a["id"] for a in appointments if a["type_id"]==3]
uni_ids  = [a["id"] for a in appointments if a["type_id"]==4]

# ─────────────────────────────────────────────
# 5. DOCTOR_APPOINTMENTS
# ─────────────────────────────────────────────
specs = ["General Physician","Cardiology","ENT","Orthopedics","Dermatology","Pediatrics","Neurology"]
clinics = ["Medicare Clinic","Shifa Hospital","KTH Peshawar","Lady Reading Hospital","City Care Center"]
doc_rows = []
for i, apt_id in enumerate(doc_ids, 1):
    doc_rows.append({
        "id": i,
        "appointment_id": apt_id,
        "doctor_name": fake.name_male(),
        "specialization": random.choice(specs),
        "clinic_hospital": random.choice(clinics),
        "patient_age": random.randint(5, 75),
        "symptoms": random.choice(["Fever and cough","Chest pain","Back pain","Skin rash","Headache","Joint pain","Routine checkup",""]),
        "prescription_notes": random.choice(["Paracetamol 500mg","Rest advised","Follow-up in 2 weeks","Blood test required","Ultrasound required",""]),
    })

with open(f"{OUT}/doctor_appointments.csv", "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=doc_rows[0].keys())
    w.writeheader(); w.writerows(doc_rows)
print(f"✓ doctor_appointments.csv — {len(doc_rows)} rows")

# ─────────────────────────────────────────────
# 6. HOME_SERVICE_APPOINTMENTS
# ─────────────────────────────────────────────
service_types = ["Plumbing","Electrician","AC Repair","Cleaning","Painting","Carpentry","Pest Control"]
home_rows = []
for i, apt_id in enumerate(home_ids, 1):
    home_rows.append({
        "id": i,
        "appointment_id": apt_id,
        "service_type": random.choice(service_types),
        "service_provider": fake.company(),
        "address": fake.street_address(),
        "city": random.choice(["Peshawar","Islamabad","Lahore","Rawalpindi","Mardan"]),
        "scheduled_duration": random.choice([30,60,90,120,180]),
        "special_instructions": random.choice(["Bring own tools","Call before arriving","Gate code: 1234","No pets in house",""]),
    })

with open(f"{OUT}/home_service_appointments.csv", "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=home_rows[0].keys())
    w.writeheader(); w.writerows(home_rows)
print(f"✓ home_service_appointments.csv — {len(home_rows)} rows")

# ─────────────────────────────────────────────
# 7. LAWYER_COURT_APPOINTMENTS
# ─────────────────────────────────────────────
case_types = ["Civil","Criminal","Family","Corporate","Property","Labour"]
courts = ["Peshawar High Court","District Court Peshawar","Civil Court Mardan","Supreme Court Branch","Sessions Court"]
law_rows = []
for i, apt_id in enumerate(law_ids, 1):
    hdate = fake.date_between(start_date="-1m", end_date="+3m")
    law_rows.append({
        "id": i,
        "appointment_id": apt_id,
        "lawyer_name": f"Adv. {fake.name()}",
        "case_type": random.choice(case_types),
        "court_name": random.choice(courts),
        "hearing_date": hdate.strftime("%Y-%m-%d"),
        "case_number": f"CASE-{random.randint(1000,9999)}/{datetime.now().year}",
        "case_description": fake.sentence(),
    })

with open(f"{OUT}/lawyer_court_appointments.csv", "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=law_rows[0].keys())
    w.writeheader(); w.writerows(law_rows)
print(f"✓ lawyer_court_appointments.csv — {len(law_rows)} rows")

# ─────────────────────────────────────────────
# 8. UNIVERSITY_OFFICE_APPOINTMENTS
# ─────────────────────────────────────────────
institutions = ["Institute of Management Sciences","University of Peshawar","CECOS University","Islamia College","Qurtuba University"]
departments = ["Admissions","Finance","Examination","IT Department","HR Department","Registrar Office"]
purposes = ["Admission Query","Fee Clearance","NOC Request","Transcript Request","Degree Verification","Meeting with HOD"]
uni_rows = []
for i, apt_id in enumerate(uni_ids, 1):
    uni_rows.append({
        "id": i,
        "appointment_id": apt_id,
        "institution_name": random.choice(institutions),
        "department": random.choice(departments),
        "contact_person": fake.name(),
        "meeting_purpose": random.choice(purposes),
        "room_or_office": f"Room {random.randint(100,499)}",
        "documents_required": random.choice(["CNIC, Fee receipt","Original degree, CNIC","Application form","Transcript, photo","None",""]),
    })

with open(f"{OUT}/university_office_appointments.csv", "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=uni_rows[0].keys())
    w.writeheader(); w.writerows(uni_rows)
print(f"✓ university_office_appointments.csv — {len(uni_rows)} rows")

print("\n✅ All 8 CSV files generated successfully in /home/claude/milestones/csv_data/")
