-----------------------------------------------------
-- task7_views.sql | PostgreSQL 17
-- Demonstrating Views on Medical Appointment DB
-----------------------------------------------------

-- 1. Create view: Doctor with Specialization & Hospital
CREATE OR REPLACE VIEW DoctorDetails AS
SELECT d.DoctorID, d.Name AS DoctorName, s.Name AS Specialization, h.Name AS Hospital
FROM Doctors d
JOIN Specializations s ON d.SpecializationID = s.SpecializationID
JOIN Hospitals h ON d.HospitalID = h.HospitalID;

-- View usage
SELECT * FROM DoctorDetails;

-- 2. Create view: Appointment Summary with Patient and Doctor
CREATE OR REPLACE VIEW AppointmentSummary AS
SELECT 
    a.AppointmentID, 
    p.Name AS Patient, 
    d.Name AS Doctor, 
    a.AppointmentDate, 
    s.SlotTime
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
JOIN TimeSlots s ON a.SlotID = s.SlotID;

-- View usage
SELECT * FROM AppointmentSummary WHERE AppointmentDate = CURRENT_DATE;

-- 3. Create view: Patients with No Appointments
CREATE OR REPLACE VIEW InactivePatients AS
SELECT *
FROM Patients
WHERE PatientID NOT IN (
    SELECT DISTINCT PatientID FROM Appointments
);

-- View usage
SELECT * FROM InactivePatients;

-- 4. DROP a view
-- DROP VIEW IF EXISTS InactivePatients;

-- 5. WITH CHECK OPTION example (Not supported in all DBs)
-- CREATE VIEW ActiveDoctors AS
-- SELECT * FROM Doctors WHERE IsActive = TRUE
-- WITH CHECK OPTION;

