# 🏥 Medical Appointment Booking System (SQL + ER Diagram)

This project represents a simple **Medical Appointment Booking System** built using SQL. It helps simulate how hospitals, doctors, patients, and appointments are organized in a relational database.

---

## 📁 Project Contents

- ✅ SQL script to create tables (`medical_appointment_schema.sql`)
- ✅ Insert queries for sample data
- ✅ ER Diagram screenshot
- ✅ Built and tested using **PostgreSQL** with **pgAdmin 4**
- ✅ ER model designed using [dbdiagram.io](https://dbdiagram.io)

---

## 📌 Database Tables

| Table Name       | Description                              |
|------------------|------------------------------------------|
| `Hospitals`      | Stores hospital names and locations      |
| `Specializations`| Stores doctor specialties                |
| `Doctors`        | Stores doctor profiles & foreign keys    |
| `Patients`       | Stores patient information               |
| `TimeSlots`      | Defines available time slots             |
| `Appointments`   | Links patients, doctors, slots & dates   |

---

## 🗂️ Schema Snapshot (ER Diagram)

![ER Diagram](https://github.com/Ankitatiwary21/medical-appointment-sql/blob/main/Screenshot_20250623_080456.png)

---

## 🧪 Sample Query: View Appointments

```sql
SELECT 
  a.AppointmentID, 
  p.Name AS Patient, 
  d.Name AS Doctor, 
  s.SlotTime, 
  a.AppointmentDate
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
JOIN TimeSlots s ON a.SlotID = s.SlotID;
