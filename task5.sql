-------------------------------------------------------
-- task5_joins.sql | PostgreSQL 17
-- Demonstrating SQL JOINs on Medical DB
-------------------------------------------------------

-- 1. INNER JOIN: Appointments with Patient and Doctor names
SELECT 
    a.AppointmentID,
    p.Name AS Patient,
    d.Name AS Doctor,
    a.AppointmentDate
FROM Appointments a
INNER JOIN Patients p ON a.PatientID = p.PatientID
INNER JOIN Doctors d ON a.DoctorID = d.DoctorID;

-- 2. LEFT JOIN: All Patients, even if they don’t have appointments
SELECT 
    p.PatientID,
    p.Name,
    a.AppointmentID,
    a.AppointmentDate
FROM Patients p
LEFT JOIN Appointments a ON p.PatientID = a.PatientID;

-- 3. RIGHT JOIN: All Appointments, show doctor even if not assigned (useful in concept)
SELECT 
    d.Name AS Doctor,
    a.AppointmentID,
    a.AppointmentDate
FROM Appointments a
RIGHT JOIN Doctors d ON a.DoctorID = d.DoctorID;

-- 4. FULL OUTER JOIN: Combine all patients and appointments
SELECT 
    p.Name AS Patient,
    a.AppointmentID,
    a.AppointmentDate
FROM Patients p
FULL OUTER JOIN Appointments a ON p.PatientID = a.PatientID;

-- 5. CROSS JOIN: Every combination of patient and slot (avoid unless needed)
SELECT p.Name, s.SlotTime
FROM Patients p
CROSS JOIN TimeSlots s
LIMIT 10;

-- 6. SELF JOIN: Find doctors in the same hospital
SELECT d1.Name AS Doctor1, d2.Name AS Doctor2, h.Name AS Hospital
FROM Doctors d1
JOIN Doctors d2 ON d1.HospitalID = d2.HospitalID AND d1.DoctorID <> d2.DoctorID
JOIN Hospitals h ON d1.HospitalID = h.HospitalID;

-- 7. JOIN 3+ tables: Appointments with Patient, Doctor, Hospital
SELECT 
    a.AppointmentID,
    p.Name AS Patient,
    d.Name AS Doctor,
    h.Name AS Hospital
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
JOIN Hospitals h ON d.HospitalID = h.HospitalID;
