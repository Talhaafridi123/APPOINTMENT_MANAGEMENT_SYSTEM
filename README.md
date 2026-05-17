# Appointment Management System

A complete web application for booking and managing appointments across multiple service categories.

## Features

- User registration and login
- Appointment bookings for:
  - Doctor
  - Home Service
  - Lawyer/Court
  - University/Office
- Admin login and appointment status management
- Secure password storage using hashed passwords
- MySQL-backed relational database
- Responsive, professional Flask/Jinja frontend

## Prerequisites

- Python 3.8+
- MySQL Server installed and running
- MySQL Connector/Python (`pip install mysql-connector-python`)

## Setup

1. **Install MySQL Server** (if not already installed):
   - Download from https://dev.mysql.com/downloads/mysql/
   - Install and start the MySQL service
   - Note the root password (default is empty for development)

2. **Create the database**:
   ```bash
   mysql -u root -p < schema.sql
   ```
   (Enter your MySQL root password when prompted)

3. **Install Python dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Run the Flask application**:
   ```bash
   python app.py
   ```

5. **Access the application**:
   - Main site: `http://localhost:5000/`
   - Admin login: `http://localhost:5000/admin/login`
   - First admin registration: `http://localhost:5000/admin/register`

## Database Configuration

The app uses these default MySQL settings (configurable via environment variables):

- Host: `MYSQL_HOST=localhost`
- User: `MYSQL_USER=root`
- Password: `MYSQL_PASSWORD=` (empty)
- Database: `MYSQL_DATABASE=appointment_db`

Set environment variables if your MySQL setup differs:
```bash
export MYSQL_HOST=your_host
export MYSQL_USER=your_user
export MYSQL_PASSWORD=your_password
export MYSQL_DATABASE=your_database
```

## First Admin Setup

1. Visit `http://localhost:5000/admin/register` to create the first admin account
2. After creation, use `http://localhost:5000/admin/login` for admin login
3. Admin registration is disabled after the first admin is created

## Project Structure

- `app.py` — Flask application with all routes and logic
- `schema.sql` — MySQL database schema and initial data
- `templates/` — Jinja2 HTML templates
- `static/style.css` — CSS styling
- `requirements.txt` — Python dependencies
- `setup_db.py` — Python script to create database programmatically

## Usage

### For Users:
1. Register an account
2. Login and book appointments by category
3. View appointment history and status

### For Admins:
1. Login to admin panel
2. View all appointments
3. Update appointment statuses (pending → confirmed → completed)

## Security Notes

- Passwords are hashed using Werkzeug's `generate_password_hash`
- Session management for user authentication
- Input validation and SQL injection prevention via parameterized queries
