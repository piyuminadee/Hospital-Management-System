CREATE OR REPLACE PACKAGE HOSPITAL_PKG AS
FUNCTION FUN_CHECK_DOC_AVAILABILITY(p_doc_id IN NUMBER, p_date IN DATE) RETURN BOOLEAN;
PROCEDURE PROC_ADD_PATIENTS(p_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE, p_gender IN VARCHAR2, p_phone IN VARCHAR2);
END HOSPITAL_PKG;


CREATE OR REPLACE PACKAGE BODY HOSPITAL_PKG AS
FUNCTION FUN_CHECK_DOC_AVAILABILITY(p_doc_id IN NUMBER, p_date IN DATE) RETURN BOOLEAN IS
num_of_app NUMBER := 0;
CURSOR c_appointments IS
      SELECT COUNT(*) FROM Appointments  
      WHERE doctor_id = p_doc_id AND appointment_date = p_date;
BEGIN 
OPEN  c_appointments;
FETCH c_appointments INTO num_of_app; 
CLOSE c_appointments;
IF num_of_app > 5 THEN
  RETURN FALSE;
ELSE 
  RETURN TRUE;
END IF;
END FUN_CHECK_DOC_AVAILABILITY;
--PRIVATE FUNCTION
FUNCTION validate_phone(p_phone IN VARCHAR2) RETURN BOOLEAN IS
BEGIN
IF LENGTH(p_phone) = 10 AND REGEXP_LIKE(p_phone, '^[0-9]+$') THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
END validate_phone;
PROCEDURE PROC_ADD_PATIENTS(p_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE, p_gender IN VARCHAR2, p_phone IN VARCHAR2) IS
Invalied_phone EXCEPTION;
BEGIN
 IF NOT  validate_phone(p_phone) THEN 
     RAISE Invalied_phone;
 END IF;
INSERT INTO Patients VALUES (p_id ,p_name, p_dob, p_gender, p_phone);
DBMS_OUTPUT.PUT_LINE('Patient added successfully.');
EXCEPTION
   WHEN  Invalied_phone THEN
           DBMS_OUTPUT.PUT_LINE ('Error: Invalied phone number.');
 WHEN OTHERS THEN
           DBMS_OUTPUT.PUT_LINE ('Error :' || SQLERRM);
END PROC_ADD_PATIENTS;
END HOSPITAL_PKG;
/