-- Clinic Management System Database

-- Table: Patients
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    address TEXT NOT NULL
);

-- Table: Departments
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL
);

-- Table: Doctors
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    license_number VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(20) NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) 
        REFERENCES Departments(department_id)
);

-- Table: Specializations
CREATE TABLE Specializations (
    specialization_id INT AUTO_INCREMENT PRIMARY KEY,
    specialization_name VARCHAR(100) UNIQUE NOT NULL
);

-- Junction Table: Doctor Specializations (M-M Relationship)
CREATE TABLE DoctorSpecialization (
    doctor_id INT NOT NULL,
    specialization_id INT NOT NULL,
    PRIMARY KEY (doctor_id, specialization_id),
    FOREIGN KEY (doctor_id) 
        REFERENCES Doctors(doctor_id),
    FOREIGN KEY (specialization_id) 
        REFERENCES Specializations(specialization_id)
);

-- Table: Appointments
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Canceled') 
        NOT NULL DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) 
        REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) 
        REFERENCES Doctors(doctor_id)
);

-- Table: Medical Records
CREATE TABLE MedicalRecords (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL UNIQUE,
    diagnosis TEXT NOT NULL,
    prescription TEXT,
    FOREIGN KEY (appointment_id) 
        REFERENCES Appointments(appointment_id)
);

-- Table: ClinicStaff (1-1 Relationship Extension Example)
CREATE TABLE ClinicStaff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    user_role ENUM('Nurse', 'Receptionist', 'Admin') 
        NOT NULL,
    doctor_id INT UNIQUE,  -- 1-1 with Doctors
    FOREIGN KEY (doctor_id) 
        REFERENCES Doctors(doctor_id)
);