# Scholarship Management System

A database project for managing scholarships, student applications, and awards.

## Project Description

This project creates a MySQL database to help educational institutions manage scholarship applications and awards. It handles basic information about students, scholarship providers, applications, and payments.

### Features

- Track student information
- Manage scholarship opportunities
- Process scholarship applications
- Record awards and payments

## Database Structure

The database consists of 8 main tables:

1. **students** - Stores student information
2. **organizations** - Contains details about scholarship providers
3. **scholarships** - Records available scholarships
4. **status_types** - Lookup table for application statuses
5. **applications** - Tracks student applications for scholarships
6. **awards** - Records of scholarships awarded to students
7. **documents** - Stores student document information
8. **payments** - Tracks scholarship payments

## Entity Relationship Diagram

Scholarship Database ERD(scholarship_erd.png)

## Setup Instructions

### Requirements
- MySQL Server
- MySQL client or MySQL Workbench

### Installation

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/scholarship-database.git
   ```

2. Connect to your MySQL server:
   ```
   mysql -u username -p
   ```

3. Import the database schema:
   ```
   source scholarship_db.sql
   ```

4. Verify installation:
   ```
   SHOW DATABASES;
   USE scholarship_db;
   SHOW TABLES;
   ```

## Features

The database supports these key operations:
- Adding and updating student information
- Creating new scholarships
- Processing applications
- Recording awards and payments
- Tracking application statuses
