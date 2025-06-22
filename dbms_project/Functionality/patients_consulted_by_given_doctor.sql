SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT doctor_id NUMBER PROMPT 'Please enter the Doctor ID: '

DECLARE
  -- you can base your local types off the table definitions:
  v_patient_id   prescription.patient_aid%TYPE;
  v_patient_name patient.name%TYPE;

  -- initialize your PL/SQL var with the substitution-variable
  v_doc_id       NUMBER := &doctor_id;

  -- simple cursor for all patients of that doctor
  CURSOR cur_docdetails IS
    SELECT p.patient_aid
      FROM prescription p
     WHERE p.doctor_aid = v_doc_id;    
BEGIN
  OPEN cur_docdetails;
  LOOP
    FETCH cur_docdetails INTO v_patient_id;
    EXIT WHEN cur_docdetails%NOTFOUND;   

    -- now look up the patient’s name
    SELECT name
      INTO v_patient_name
      FROM patient
     WHERE patient_aid = v_patient_id;

    DBMS_OUTPUT.PUT_LINE(
      'Patient Name: '  || RPAD(v_patient_name,20)
    || '  Patient ID: ' || v_patient_id
    );
  END LOOP;
  CLOSE cur_docdetails;
END;
/
