-------------------------------------------------------
-- task6_subqueries.sql | PostgreSQL
-- Subqueries & Nested Query Examples
-------------------------------------------------------

-- 1. Scalar subquery: Get doctor with most appointments
SELECT Name 
FROM Doctors
WHERE DoctorID = (
  SELECT DoctorID
  FROM Appointments
  GROUP BY DoctorID
  ORDER BY COUNT(*) DESC
  LIMIT 1
);

-- 2. Subquery in WHERE using IN: Patients with appointments
SELECT Name 
FROM Patients
WHERE PatientID IN (
  SELECT DISTINCT PatientID
  FROM Appointments
);

-- 3. Subquery in WHERE using EXISTS: Doctors with appointments
SELECT d.Name 
FROM Doctors d
WHERE EXISTS (
  SELECT 1 
  FROM Appointments a 
  WHERE a.DoctorID = d.DoctorID
);

-- 4. Correlated subquery: Show patients who have more than 1 appointment
SELECT Name 
FROM Patients p
WHERE (
  SELECT COUNT(*) 
  FROM Appointments a 
  WHERE a.PatientID = p.PatientID
) > 1;

-- 5. Subquery in FROM clause (derived table): Appointment counts by doctor
SELECT d.Name, appt.Total
FROM Doctors d
JOIN (
  SELECT DoctorID, COUNT(*) AS Total
  FROM Appointments
  GROUP BY DoctorID
) appt ON d.DoctorID = appt.DoctorID;

-- 6. Patients who never had any appointment
SELECT Name 
FROM Patients
WHERE PatientID NOT IN (
  SELECT PatientID FROM Appointments
);

-- 7. Doctors who belong to specializations with more than 1 doctor
SELECT Name 
FROM Doctors 
WHERE SpecializationID IN (
  SELECT SpecializationID 
  FROM Doctors 
  GROUP BY SpecializationID 
  HAVING COUNT(*) > 1
);

-- 8. SlotTime for most used slot (based on count)
SELECT SlotTime 
FROM TimeSlots
WHERE SlotID = (
  SELECT SlotID 
  FROM Appointments 
  GROUP BY SlotID 
  ORDER BY COUNT(*) DESC 
  LIMIT 1
);
