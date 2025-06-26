--------------------------------------------------
-- task3_select.sql | PostgreSQL 17
-- Basic SELECT demo on Medical Appointment DB
--------------------------------------------------

/* 1. Return everything from Patients              */
SELECT * FROM Patients;

/* 2. Return only Patient names & phones           */
SELECT Name, Phone FROM Patients;

/* 3. Filter: all doctors who are Dermatologists   */
SELECT d.DoctorID, d.Name
FROM   Doctors d
JOIN   Specializations s ON d.SpecializationID = s.SpecializationID
WHERE  s.Name = 'Dermatologist';

/* 4. Filter with AND & OR:                        */
-- Patients whose phone starts with 9 AND live in Hyderabad OR Bangalore hospital
SELECT p.PatientID, p.Name, h.Location
FROM   Patients      p
JOIN   Appointments  a ON p.PatientID = a.PatientID
JOIN   Doctors       d ON a.DoctorID  = d.DoctorID
JOIN   Hospitals     h ON d.HospitalID = h.HospitalID
WHERE  p.Phone LIKE '9%' 
  AND (h.Location = 'Hyderabad' OR h.Location = 'Bangalore')
GROUP  BY p.PatientID, p.Name, h.Location;

/* 5. LIKE %value% : doctors with 'Dr. A' in name  */
SELECT * FROM Doctors
WHERE  Name LIKE 'Dr. A%';

/* 6. BETWEEN: appointments in last 7 days         */
SELECT * 
FROM   Appointments
WHERE  AppointmentDate BETWEEN CURRENT_DATE - INTERVAL '7 days'
                          AND     CURRENT_DATE;

/* 7. ORDER BY ascending (default)                 */
SELECT SlotID, SlotTime 
FROM   TimeSlots
ORDER  BY SlotID;              -- ASC is implicit

/* 8. ORDER BY descending                          */
SELECT SlotID, SlotTime 
FROM   TimeSlots
ORDER  BY SlotID DESC;

/* 9. LIMIT output rows (first 3 appointments)     */
SELECT * FROM Appointments
ORDER  BY AppointmentDate
LIMIT 3;   -- or FETCH FIRST 3 ROWS ONLY

/* 10. DISTINCT doctors’ specializations           */
SELECT DISTINCT SpecializationID 
FROM   Doctors;
