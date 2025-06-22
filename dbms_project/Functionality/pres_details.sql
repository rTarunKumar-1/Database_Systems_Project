CREATE OR REPLACE PROCEDURE get_basic_prescription_report (
    p_patient_id IN NUMBER,
    p_start_date IN DATE,
    p_end_date IN DATE

)
AS
BEGIN

    DECLARE
        v_patient_exists NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_patient_exists
        FROM PATIENT
        WHERE PATIENT_AID = p_patient_id;
        
        IF v_patient_exists = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Patient ID ' || p_patient_id || ' not found.');
            RETURN;
        END IF;
    END;
    
    -- Output report header
    DBMS_OUTPUT.PUT_LINE('========== BASIC PRESCRIPTION REPORT ==========');
    DBMS_OUTPUT.PUT_LINE('Patient ID: ' || p_patient_id);
    DBMS_OUTPUT.PUT_LINE('Report Period: ' || TO_CHAR(p_start_date, 'DD-MON-YYYY') || 
                       ' to ' || TO_CHAR(p_end_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('==============================================');
    
    -- Retrieve and display prescription details
    DECLARE
        CURSOR c_prescriptions IS
            SELECT 
                DOCTOR_AID,
                PATIENT_AID,
                DATE_PRSC
            FROM 
                PRESCRIPTION
            WHERE 
                PATIENT_AID = p_patient_id
                AND DATE_PRSC BETWEEN p_start_date AND p_end_date
            ORDER BY 
                DATE_PRSC;
                
        v_prescription_count NUMBER := 0;
    BEGIN
        FOR r_prescription IN c_prescriptions LOOP
            v_prescription_count := v_prescription_count + 1;
            
            DBMS_OUTPUT.PUT_LINE('Prescription #' || v_prescription_count);
            DBMS_OUTPUT.PUT_LINE('Doctor ID: ' || r_prescription.DOCTOR_AID);
            DBMS_OUTPUT.PUT_LINE('Patient ID: ' || r_prescription.PATIENT_AID);
            DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(r_prescription.DATE_PRSC, 'DD-MON-YYYY'));
            DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
        END LOOP;
        
        IF v_prescription_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('No prescriptions found for this patient in the specified date range.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('==============================================');
            DBMS_OUTPUT.PUT_LINE('TOTAL PRESCRIPTIONS: ' || v_prescription_count);
        END IF;
    END;

END get_basic_prescription_report;
/