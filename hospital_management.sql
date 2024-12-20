--Hospital Management System Database Design
--Designed By: Samial Mohaimin Efti

-- SQL queries to create the tables, 
-- including PRIMARY KEY and FOREIGN KEY constraints.

CREATE Table Departments(
    DepartmentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL
);

CREATE TABLE Doctors(  
    DoctorID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Specialization VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,

    DepartmentID INT NOT NULL,

    Foreign Key (DepartmentID) REFERENCES Departments(DepartmentID) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
);

CREATE Table Patients(
    PatientID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Phone VARCHAR(15) NOT NULL
);


CREATE TABLE Appointments(
    AppointmentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL,

    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,

    Foreign Key (PatientID) REFERENCES Patients(PatientID) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE,
    Foreign Key (DoctorID) REFERENCES Doctors(DoctorID) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE  
);

-- Adding 5 dummy records for each table

INSERT INTO Departments (Name, Location) VALUES 
('Cardiology', 'Building A, Floor 3'),
('Neurology', 'Building B, Floor 2'),
('Orthopedics', 'Building C, Floor 1'),
('Pediatrics', 'Building D, Floor 4'),
('Emergency', 'Building E, Ground Floor');

INSERT INTO Doctors (Name, Specialization, Phone, DepartmentID) VALUES 
('Dr. John Doe', 'Cardiologist', '123-456-7890', 1),
('Dr. Jane Smith', 'Neurologist', '234-567-8901', 2),
('Dr. William Brown', 'Orthopedic Surgeon', '345-678-9012', 3),
('Dr. Emily White', 'Pediatrician', '456-789-0123', 4),
('Dr. Sarah Green', 'Emergency Medicine', '567-890-1234', 5);

INSERT INTO Patients (Name, Age, Gender, Phone) VALUES 
('Michael Johnson', 45, 'Male', '789-012-3456'),
('Olivia Williams', 37, 'Female', '890-123-4567'),
('Lucas Brown', 28, 'Male', '901-234-5678'),
('Sophia Garcia', 54, 'Female', '012-345-6789'),
('Ethan Davis', 22, 'Male', '123-456-7891');

INSERT INTO Appointments (Date, Time, Status, PatientID, DoctorID) VALUES 
('2024-12-21', '09:00:00', 'Scheduled', 1, 1),
('2024-12-22', '10:30:00', 'Scheduled', 2, 2),
('2024-12-23', '14:00:00', 'Completed', 3, 3),
('2024-12-24', '11:15:00', 'Cancelled', 4, 4),
('2024-12-25', '13:45:00', 'Scheduled', 5, 5);