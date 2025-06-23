-- Insert into Hospitals
INSERT INTO Hospitals (Name, Location) VALUES
('City Care Hospital', 'Hyderabad'),
('GreenLife Clinic', 'Bangalore');

-- Insert into Specializations
INSERT INTO Specializations (Name) VALUES
('Cardiologist'),
('Dermatologist'),
('Pediatrician');

-- Insert into Doctors
INSERT INTO Doctors (Name, Email, SpecializationID, HospitalID) VALUES
('Dr. Meena Rao', 'meena@example.com', 1, 1),
('Dr. Aryan Singh', 'aryan@example.com', 2, 2),
('Dr. Sneha Das', 'sneha@example.com', 3, 1);

-- Insert into Patients
INSERT INTO Patients (Name, Email, Phone) VALUES
('Anita Sharma', 'anita@gmail.com', '9876543210'),
('Rahul Verma', 'rahul@gmail.com', '9123456789');

-- Insert into TimeSlots
INSERT INTO TimeSlots (SlotTime) VALUES
('10:00 AM - 10:30 AM'),
('11:00 AM - 11:30 AM'),
('12:00 PM - 12:30 PM');

-- Insert into Appointments
INSERT INTO Appointments (PatientID, DoctorID, SlotID, AppointmentDate) VALUES
(1, 1, 1, '2025-06-24'),
(2, 2, 3, '2025-06-25');

SELECT * FROM Appointments;
