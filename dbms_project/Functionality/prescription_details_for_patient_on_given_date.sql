set verify off;
ACCEPT v_patient_id NUMBER PROMPT 'Please enter the Patient ID: '
ACCEPT v_date CHAR PROMPT 'Please enter the Prescription Date (DD-MON-YYYY): '

DECLARE
    v_patient_id NUMBER := &v_patient_id;  
    v_date DATE := TO_DATE(&v_date, 'DD-MON-YYYY');

BEGIN
    -- Execute the procedure
    get_prescription_by_date(
        p_patient_id => v_patient_id,
        p_date => v_date
    );

END;
/