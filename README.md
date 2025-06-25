# 🏥 MediCare – Hospital Management Database System

A comprehensive database project built using **PostgreSQL** to manage hospital operations such as patient records, appointments, billing, prescriptions, test reports, doctor shifts, and insurance claims. This project was developed as part of the **Database Management System (IT214)** course at DAIICT.

---

## 📌 Features

- 25+ normalized tables with well-defined primary, foreign keys, and constraints
- All relations designed to be in **BCNF (Boyce–Codd Normal Form)**
- Role-specific functionalities for:
  - Patients
  - Doctors
  - Hospital Staff
  - Administrators
- Queries designed to support real-time scenarios and performance reporting

---

## 🧑‍⚕️ Application Users

- **Patients** can register, manage appointments, view test results, and billing history.
- **Doctors** manage appointments, access patient history, and prescribe medication.
- **Staff** handle check-ins, doctor scheduling, billing, and room allocation.
- **Administrators** manage users, resources, and generate hospital reports.

---

## 📋 Relational Schema

The project includes fully normalized relations (BCNF) such as:

- Admin, Doctor, Staff, Patient, Appointments  
- Patient_Report, Lab_Test, Lab_Report  
- Medicine, Medicine_Patient  
- Room, Bed, Allocate  
- Bill, Patient_Insurance  
- Ambulance, Ambulance_Service, Drives  
- Driver, Department

---

## 📂 Project Structure

```bash
📁 MediCare-DBMS-Project
├── 📄 Description.pdf          # Use cases and functional details
├── 📄 Relational_Schema.pdf    # Schema and normalization proofs
├── 📄 ddl_script.sql           # SQL code to create schema and tables
├── 📁 queries/                 # Sample queries for each user role
└── 📁 reports/                 # Output screenshots, analytics (optional)
