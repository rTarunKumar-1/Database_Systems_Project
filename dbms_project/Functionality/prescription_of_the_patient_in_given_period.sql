SET VERIFY OFF
ACCEPT v_patient_id NUMBER PROMPT 'Please enter the Patient ID: '
ACCEPT v_start_date CHAR PROMPT 'Please enter the starting Date (DD-MON-YYYY): '
ACCEPT v_end_date CHAR PROMPT 'Please enter the ending Date (DD-MON-YYYY): '

DECLARE
    v_patient_id NUMBER := &v_patient_id;  -- Test with patient John (ID 201)
    v_start_date DATE := TO_DATE(&v_start_date, 'DD-MON-YYYY');
    v_end_date DATE := TO_DATE(&v_end_date, 'DD-MON-YYYY');
    -- v_errbuf VARCHAR2(4000);
    -- v_retcode NUMBER;
BEGIN
    -- Execute the procedure
    get_basic_prescription_report(
        p_patient_id => v_patient_id,
        p_start_date => v_start_date,
        p_end_date => v_end_date
        -- p_errbuf => v_errbuf
        -- p_retcode => v_retcode
    );
    
    -- Check for errors
    -- IF v_retcode <> 0 THEN
    --     DBMS_OUTPUT.PUT_LINE('Error: ' || v_errbuf);
    -- END IF;
END;
/