import os
from datetime import datetime

import mysql.connector
from flask import Flask, flash, redirect, render_template, request, session, url_for
from mysql.connector import IntegrityError
from werkzeug.security import check_password_hash, generate_password_hash
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

app = Flask(__name__)
app.secret_key = os.environ.get('FLASK_SECRET_KEY', 'appointment_secret_2026')

DB_CONFIG = {
    'host': os.environ.get('MYSQL_HOST', 'localhost'),
    'user': os.environ.get('MYSQL_USER', 'root'),
    'password': os.environ.get('MYSQL_PASSWORD', ''),
    'database': os.environ.get('MYSQL_DATABASE', 'appointment_db'),
}

SERVICE_DESCRIPTIONS = {
    'DOC': 'Doctor consultations with specialists, health issues and clinic visits.',
    'HOME': 'Home service scheduling for repairs, maintenance and cleaning.',
    'LAW': 'Legal consultations, court appointments and case follow-up sessions.',
    'UNI': 'University and office meetings for admissions, documents and inquiries.',
}


def get_db_connection():
    try:
        return mysql.connector.connect(**DB_CONFIG)
    except mysql.connector.Error as err:
        print(f"Database connection error: {err}")
        print("Please ensure MySQL is running and the database exists.")
        print("Run 'python setup_db.py' to create the database.")
        raise


def generate_entity_id(prefix, count):
    return f"{prefix}-{datetime.now().year}-{count:05d}"


@app.context_processor
def inject_user():
    return {
        'logged_in': session.get('loggedin', False),
        'current_user': session.get('name'),
        'current_role': session.get('role'),
    }


@app.route('/')
def home():
    return render_template('home.html')


@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        name = request.form.get('name', '').strip()
        email = request.form.get('email', '').strip().lower()
        phone = request.form.get('phone', '').strip()
        password = request.form.get('password', '').strip()

        if not name or not email or not password:
            flash('Please complete all required fields.', 'warning')
            return redirect(url_for('register'))

        password_hash = generate_password_hash(password)
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute('SELECT COUNT(*) FROM users')
        count = cursor.fetchone()[0] + 1
        user_id = generate_entity_id('USR', count)

        try:
            cursor.execute(
                'INSERT INTO users (user_id, name, email, phone, password, role) VALUES (%s, %s, %s, %s, %s, %s)',
                (user_id, name, email, phone, password_hash, 'user'),
            )
            conn.commit()
            flash('Registration complete. Please login.', 'success')
            return redirect(url_for('login'))
        except IntegrityError:
            flash('An account with this email already exists.', 'danger')
        finally:
            cursor.close()
            conn.close()

    return render_template('register.html')


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form.get('email', '').strip().lower()
        password = request.form.get('password', '').strip()
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute('SELECT * FROM users WHERE email = %s', (email,))
        user = cursor.fetchone()
        cursor.close()
        conn.close()

        if user and check_password_hash(user['password'], password):
            session['loggedin'] = True
            session['id'] = user['id']
            session['user_id'] = user['user_id']
            session['name'] = user['name']
            session['role'] = user['role']
            return redirect(url_for('dashboard'))

        flash('Invalid login credentials.', 'danger')

    return render_template('login.html')


@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('home'))


@app.route('/dashboard')
def dashboard():
    if not session.get('loggedin') or session.get('role') != 'user':
        return redirect(url_for('login'))

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(
        'SELECT a.id, a.appointment_id, a.appointment_date, a.appointment_time, a.status, t.type_name '
        'FROM appointments a '
        'JOIN appointment_types t ON a.type_id = t.id '
        'WHERE a.user_id = %s '
        'ORDER BY a.appointment_date DESC, a.appointment_time DESC',
        (session['id'],),
    )
    appointments = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('dashboard.html', appointments=appointments)


@app.route('/book', methods=['GET'])
def book():
    if not session.get('loggedin') or session.get('role') != 'user':
        return redirect(url_for('login'))

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM appointment_types ORDER BY id')
    types = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('book.html', types=types, descriptions=SERVICE_DESCRIPTIONS)


@app.route('/book/<type_code>', methods=['GET', 'POST'])
def book_type(type_code):
    if not session.get('loggedin') or session.get('role') != 'user':
        return redirect(url_for('login'))

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM appointment_types WHERE type_code = %s', (type_code,))
    type_info = cursor.fetchone()

    if not type_info:
        cursor.close()
        conn.close()
        flash('Invalid appointment category selected.', 'danger')
        return redirect(url_for('book'))

    if request.method == 'POST':
        date = request.form.get('date')
        time = request.form.get('time')

        if not date or not time:
            flash('Please select both date and time.', 'warning')
            return render_template('book_type.html', type_info=type_info, descriptions=SERVICE_DESCRIPTIONS)

        cursor.execute('SELECT COUNT(*) FROM appointments')
        count = cursor.fetchone()[0] + 1
        appointment_id = generate_entity_id('APT', count)
        cursor.execute(
            'INSERT INTO appointments (appointment_id, user_id, type_id, appointment_date, appointment_time) VALUES (%s, %s, %s, %s, %s)',
            (appointment_id, session['id'], type_info['id'], date, time),
        )
        appointment_row_id = cursor.lastrowid

        if type_code == 'DOC':
            cursor.execute(
                'INSERT INTO doctor_appointments (appointment_id, doctor_name, specialization, clinic_name, symptoms) VALUES (%s, %s, %s, %s, %s)',
                (
                    appointment_row_id,
                    request.form.get('doctor_name', '').strip(),
                    request.form.get('specialization', '').strip(),
                    request.form.get('clinic_name', '').strip(),
                    request.form.get('symptoms', '').strip(),
                ),
            )
        elif type_code == 'HOME':
            cursor.execute(
                'INSERT INTO home_service_appointments (appointment_id, service_type, provider_name, address, special_instructions, estimated_duration) VALUES (%s, %s, %s, %s, %s, %s)',
                (
                    appointment_row_id,
                    request.form.get('service_type', '').strip(),
                    request.form.get('provider_name', '').strip(),
                    request.form.get('address', '').strip(),
                    request.form.get('special_instructions', '').strip(),
                    request.form.get('estimated_duration') or None,
                ),
            )
        elif type_code == 'LAW':
            cursor.execute(
                'INSERT INTO lawyer_court_appointments (appointment_id, lawyer_name, case_type, court_name, hearing_date, case_ref_number) VALUES (%s, %s, %s, %s, %s, %s)',
                (
                    appointment_row_id,
                    request.form.get('lawyer_name', '').strip(),
                    request.form.get('case_type', '').strip(),
                    request.form.get('court_name', '').strip(),
                    request.form.get('hearing_date') or None,
                    request.form.get('case_ref_number', '').strip(),
                ),
            )
        elif type_code == 'UNI':
            cursor.execute(
                'INSERT INTO university_office_appointments (appointment_id, institution_name, department, contact_person, purpose, location, required_documents) VALUES (%s, %s, %s, %s, %s, %s, %s)',
                (
                    appointment_row_id,
                    request.form.get('institution_name', '').strip(),
                    request.form.get('department', '').strip(),
                    request.form.get('contact_person', '').strip(),
                    request.form.get('purpose', '').strip(),
                    request.form.get('location', '').strip(),
                    request.form.get('required_documents', '').strip(),
                ),
            )

        conn.commit()
        cursor.close()
        conn.close()

        flash('Your appointment has been booked successfully.', 'success')
        return redirect(url_for('dashboard'))

    cursor.close()
    conn.close()
    return render_template('book_type.html', type_info=type_info, descriptions=SERVICE_DESCRIPTIONS)


@app.route('/admin/login', methods=['GET', 'POST'])
def admin_login():
    if request.method == 'POST':
        email = request.form.get('email', '').strip().lower()
        password = request.form.get('password', '').strip()

        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute('SELECT * FROM admins WHERE email = %s', (email,))
        admin = cursor.fetchone()
        cursor.close()
        conn.close()

        if admin and check_password_hash(admin['password'], password):
            session['loggedin'] = True
            session['id'] = admin['id']
            session['admin_id'] = admin['admin_id']
            session['name'] = admin['name']
            session['role'] = 'admin'
            return redirect(url_for('admin_dashboard'))

        flash('Invalid admin credentials.', 'danger')

    return render_template('admin_login.html')


@app.route('/admin')
def admin_root():
    return redirect(url_for('admin_login'))


@app.route('/admin/register', methods=['GET', 'POST'])
def admin_register():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT COUNT(*) FROM admins')
    admin_count = cursor.fetchone()[0]
    cursor.close()
    conn.close()

    if admin_count > 0:
        flash('Admin registration is disabled after the first account is created.', 'warning')
        return redirect(url_for('admin_login'))

    if request.method == 'POST':
        name = request.form.get('name', '').strip()
        email = request.form.get('email', '').strip().lower()
        password = request.form.get('password', '').strip()

        if not name or not email or not password:
            flash('Please fill in all admin fields.', 'warning')
            return redirect(url_for('admin_register'))

        password_hash = generate_password_hash(password)
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute('SELECT COUNT(*) FROM admins')
        count = cursor.fetchone()[0] + 1
        admin_id = generate_entity_id('ADM', count)

        try:
            cursor.execute(
                'INSERT INTO admins (admin_id, name, email, password) VALUES (%s, %s, %s, %s)',
                (admin_id, name, email, password_hash),
            )
            conn.commit()
            flash('Admin account created. Please login.', 'success')
            return redirect(url_for('admin_login'))
        except IntegrityError:
            flash('An admin account with this email already exists.', 'danger')
        finally:
            cursor.close()
            conn.close()

    return render_template('admin_register.html')


@app.route('/admin/dashboard')
def admin_dashboard():
    if not session.get('loggedin') or session.get('role') != 'admin':
        return redirect(url_for('admin_login'))

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(
        'SELECT a.id, a.appointment_id, u.name AS user_name, u.email AS user_email, t.type_name, a.appointment_date, a.appointment_time, a.status '
        'FROM appointments a '
        'JOIN users u ON a.user_id = u.id '
        'JOIN appointment_types t ON a.type_id = t.id '
        'ORDER BY a.appointment_date DESC, a.appointment_time DESC',
    )
    appointments = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('admin_dashboard.html', appointments=appointments)


@app.route('/admin/appointment/<int:apt_id>/update', methods=['POST'])
def update_appointment(apt_id):
    if not session.get('loggedin') or session.get('role') != 'admin':
        return redirect(url_for('admin_login'))

    status = request.form.get('status', 'pending')
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('UPDATE appointments SET status = %s, admin_id = %s WHERE id = %s', (status, session['id'], apt_id))
    conn.commit()
    cursor.close()
    conn.close()
    flash('Appointment status updated.', 'success')
    return redirect(url_for('admin_dashboard'))


if __name__ == '__main__':
    app.run(debug=True)
