CREATE TABLE Patients (
    patient_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    dob DATE,
    gender VARCHAR2(10),
    phone VARCHAR2(15)
)
/


CREATE TABLE Doctors (
    doctor_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    specialization VARCHAR2(100),
    phone VARCHAR2(15)
)
/

CREATE TABLE Appointments (
    appointment_id NUMBER PRIMARY KEY,
    patient_id NUMBER,
    doctor_id NUMBER,
    appointment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
)
/


--Patient Table 

INSERT INTO Patients VALUES ('1231','Sherlock Holmes', TO_DATE('1985-05-15', 'YYYY-MM-DD'), 'Male', '2334551299')
/
INSERT INTO Patients VALUES ('1232','George Stuwert', TO_DATE('1990-08-22', 'YYYY-MM-DD'), 'Male', '9876543210')
/
INSERT INTO Patients VALUES (1233, 'Apeksha Pavithri', TO_DATE('2001-01-13', 'YYYY-MM-DD'), 'Female', '0764773018')
/
INSERT INTO Patients VALUES ('1234','Dilshan Gamage', TO_DATE('2000-05-16', 'YYYY-MM-DD'), 'Male', '0770450468')
/
INSERT INTO Patients VALUES ('1235','Mohomad Naseem', TO_DATE('1998-12-22', 'YYYY-MM-DD'), 'Male', '0785645333')
/

--Doctor Table 
INSERT INTO Doctors VALUES ('2231', 'Dr. John Watson', 'Cardiology', '3332441290')/
INSERT INTO Doctors VALUES ('2232', 'Dr.Dayananda', 'Dermatology', '0112315597')/
INSERT INTO Doctors VALUES ('2233', 'Dr.Ruwan', 'Dermatology', '0776870913')/
INSERT INTO Doctors VALUES ('2234', 'Dr.Saheer', 'Neurology', '0118885523')/
INSERT INTO Doctors VALUES ('2235', 'Dr.Kesara', 'Psychiatry', '0775554322')/


--Appointments Table
INSERT INTO Appointments VALUES ('3231', '1231', '2231', TO_DATE('2025-05-20', 'YYYY-MM-DD'))/

INSERT INTO Appointments VALUES ('3232', '1235', '2231', TO_DATE('2025-05-21', 'YYYY-MM-DD'))/

INSERT INTO Appointments VALUES ('3233', '1232', '2233', TO_DATE('2025-05-23', 'YYYY-MM-DD'))/

INSERT INTO Appointments VALUES ('3234', '1234', '2234', TO_DATE('2025-06-05', 'YYYY-MM-DD'))/

INSERT INTO Appointments VALUES ('3235', '1235', '2235', TO_DATE('2025-06-20', 'YYYY-MM-DD'))/