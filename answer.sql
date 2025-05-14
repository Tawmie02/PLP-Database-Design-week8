-- Scholarship Management System Database

-- Drop database if exists
DROP DATABASE IF EXISTS scholarship_db;

-- Create database
CREATE DATABASE scholarship_db;

-- Use database
USE scholarship_db;

-- Create Students table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    date_of_birth DATE,
    enrollment_date DATE,
    gpa DECIMAL(3,2),
    major VARCHAR(100)
);

-- Create Organizations table
CREATE TABLE organizations (
    org_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Create Scholarships table
CREATE TABLE scholarships (
    scholarship_id INT AUTO_INCREMENT PRIMARY KEY,
    org_id INT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    amount DECIMAL(10,2) NOT NULL,
    deadline DATE,
    FOREIGN KEY (org_id) REFERENCES organizations(org_id)
);

-- Create Application Status lookup table
CREATE TABLE status_types (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

-- Insert status values
INSERT INTO status_types (status_name) VALUES
('Submitted'),
('Under Review'),
('Awarded'),
('Rejected');

-- Create Applications table
CREATE TABLE applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    scholarship_id INT NOT NULL,
    status_id INT NOT NULL,
    application_date DATE NOT NULL,
    notes TEXT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (scholarship_id) REFERENCES scholarships(scholarship_id),
    FOREIGN KEY (status_id) REFERENCES status_types(status_id)
);

-- Create Awards table
CREATE TABLE awards (
    award_id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT NOT NULL,
    award_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (application_id) REFERENCES applications(application_id)
);

-- Create Documents table
CREATE TABLE documents (
    document_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    document_type VARCHAR(50) NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    upload_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Create Payments table
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    award_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50),
    FOREIGN KEY (award_id) REFERENCES awards(award_id)
);
