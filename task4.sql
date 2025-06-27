-------------------------------------------------------
-- task4_aggregate.sql | PostgreSQL 17
-- Aggregate Functions + GROUP BY on Appointment DB
-------------------------------------------------------

/* 1. Count how many patients are registered */
SELECT COUNT(*) AS total_patients FROM Patients;

/* 2. Count how many appointments each doctor has */
SELECT d.Name AS Doctor, COUNT(a.AppointmentID) AS AppointmentCount
FROM   Appointments a
JOIN   Doctors d ON a.DoctorID = d.DoctorID
GROUP BY d.Name
ORDER BY AppointmentCount DESC;

/* 3. Average appointments per specialization */
SELECT s.Name AS Specialization, COUNT(a.AppointmentID) AS TotalAppointments, 
       ROUND(AVG(a.DoctorID), 0) AS DummyAvg
FROM   Appointments a
JOIN   Doctors d ON a.DoctorID = d.DoctorID
JOIN   Specializations s ON d.SpecializationID = s.SpecializationID
GROUP BY s.Name;

/* 4. Number of doctors per hospital */
SELECT h.Name AS Hospital, COUNT(d.DoctorID) AS TotalDoctors
FROM   Doctors d
JOIN   Hospitals h ON d.HospitalID = h.HospitalID
GROUP BY h.Name;

/* 5. Find specializations with more than 1 doctor */
SELECT s.Name AS Specialization, COUNT(d.DoctorID) AS DoctorCount
FROM   Doctors d
JOIN   Specializations s ON d.SpecializationID = s.SpecializationID
GROUP BY s.Name
HAVING COUNT(d.DoctorID) > 1;

/* 6. Total appointments per date */
SELECT AppointmentDate, COUNT(*) AS TotalAppointments
FROM   Appointments
GROUP BY AppointmentDate
ORDER BY AppointmentDate;

/* 7. DISTINCT doctor count */
SELECT COUNT(DISTINCT DoctorID) AS UniqueDoctors FROM Appointments;

/* 8. Round example: average number of appointments per day */
SELECT ROUND(AVG(daily.total), 2) AS AvgAppointmentsPerDay
FROM (
    SELECT AppointmentDate, COUNT(*) AS total
    FROM Appointments
    GROUP BY AppointmentDate
) daily;

/* 9. Appointments grouped by time slot */
SELECT s.SlotTime, COUNT(a.AppointmentID) AS Appointments
FROM   Appointments a
JOIN   TimeSlots s ON a.SlotID = s.SlotID
GROUP BY s.SlotTime;

/* 10. COUNT vs COUNT(column) demo */
SELECT 
    COUNT(*) AS TotalRows,
    COUNT(Phone) AS NonNullPhones
FROM Patients;
