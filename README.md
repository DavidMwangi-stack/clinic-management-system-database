# Clinic Management System Database

## 📖 Description  
A complete **MySQL-based database system** for managing clinic operations, including patient appointments, doctor schedules, medical records, and staff roles. Designed for real-world usability with normalization (2NF/3NF), constraints, and relationships to ensure data integrity and efficiency.

## ✨ Key Features  
- **Patient Management**: Track patient demographics, contact info, and medical history.  
- **Appointment Scheduling**: Manage appointments with status tracking (Scheduled/Completed/Canceled).  
- **Doctor & Department Coordination**: Assign doctors to departments and track specializations.  
- **Medical Records**: Store diagnoses and prescriptions linked to appointments.  
- **Staff Roles**: Handle clinic staff roles (Nurse, Receptionist, Admin) with 1-1 doctor-staff mapping.  

## 🛠️ Database Schema Overview  
![Schema Diagram](schema.png) 

| Table                 | Purpose                                  |  
|-----------------------|------------------------------------------|  
| `Patients`            | Stores patient details and contact info  |  
| `Departments`         | Clinic departments (e.g., Cardiology)    |  
| `Doctors`             | Doctor profiles and department assignments |  
| `Specializations`     | Medical specializations (e.g., Pediatrics)|  
| `DoctorSpecialization`| Maps doctors to their specializations (M-M)|  
| `Appointments`        | Manages patient-doctor bookings          |  
| `MedicalRecords`      | Links diagnoses/prescriptions to appointments |  
| `ClinicStaff`         | Manages staff roles and doctor-staff relationships |  

---

## 🚀 How to Set Up  

### Prerequisites  
- MySQL Server installed (v8.0+ recommended)  
- MySQL client (e.g., MySQL Workbench, Command Line)  

### Steps to Import the Database  
1. **Download the SQL File**: Save `clinic_system.sql` from this project.  
2. **Start MySQL Server**: Ensure the MySQL service is running.  
3. **Create the Database**:  
   ```sql  
   CREATE DATABASE clinic_db;  
   USE clinic_db;

   mysql -u [username] -p clinic_db < clinic_system.sql

   SHOW TABLES;  -- Should list all 8 tables  
DESCRIBE Patients;  -- Check table structure  
