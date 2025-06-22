CREATE OR REPLACE PROCEDURE get_prescription_by_date (
    p_patient_id IN NUMBER,
    p_date IN DATE
)
AS
BEGIN
    -- Check if patient exists
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
    DBMS_OUTPUT.PUT_LINE('========== PRESCRIPTION DETAILS ==========');
    DBMS_OUTPUT.PUT_LINE('Patient ID: ' || p_patient_id);
    DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(p_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('=========================================');
    
    -- Retrieve and display prescription details
    DECLARE
        CURSOR c_prescriptions IS
            SELECT 
                p.DOCTOR_AID,
                d.NAME AS DOCTOR_NAME,
                d.SPECIALIZATION,
                p.DATE_PRSC
            FROM 
                PRESCRIPTION p
                JOIN DOCTOR d ON p.DOCTOR_AID = d.DOCTOR_AID
            WHERE 
                p.PATIENT_AID = p_patient_id
                AND TRUNC(p.DATE_PRSC) = TRUNC(p_date)
            ORDER BY 
                p.DATE_PRSC;
                
        v_prescription_count NUMBER := 0;
        v_medication_total NUMBER := 0;
    BEGIN
        FOR r_prescription IN c_prescriptions LOOP
            v_prescription_count := v_prescription_count + 1;
            
            DBMS_OUTPUT.PUT_LINE('Prescription ' || v_prescription_count || ':');
            DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
            DBMS_OUTPUT.PUT_LINE('Doctor ID:    ' || r_prescription.DOCTOR_AID);
            DBMS_OUTPUT.PUT_LINE('Doctor Name:  ' || r_prescription.DOCTOR_NAME);
            DBMS_OUTPUT.PUT_LINE('Specialization: ' || r_prescription.SPECIALIZATION);
            DBMS_OUTPUT.PUT_LINE('Prescription Date: ' || TO_CHAR(r_prescription.DATE_PRSC, 'DD-MON-YYYY'));
            
            -- Get medication details
            DECLARE
                CURSOR c_medications IS
                    SELECT 
                        pd.TRADE_NAME,
                        pd.COMPANY_NAME,
                        pd.QUANTITY,
                        dr.FORMULA
                    FROM 
                        PRESCRIPTION_DETAILS pd
                        JOIN DRUGS dr ON pd.COMPANY_NAME = dr.COMPANY_NAME 
                                     AND pd.TRADE_NAME = dr.TRADE_NAME
                    WHERE 
                        pd.DOCTOR_AID = r_prescription.DOCTOR_AID
                        AND pd.PATIENT_AID = p_patient_id;
                        
                v_med_count NUMBER := 0;
            BEGIN
                DBMS_OUTPUT.PUT_LINE('Medications Prescribed:');
                
                FOR r_medication IN c_medications LOOP
                    v_med_count := v_med_count + 1;
                    v_medication_total := v_medication_total + 1;
                    
                    DBMS_OUTPUT.PUT_LINE('  ' || v_med_count || '. ' || r_medication.TRADE_NAME);
                    DBMS_OUTPUT.PUT_LINE('     Manufacturer: ' || r_medication.COMPANY_NAME);
                    DBMS_OUTPUT.PUT_LINE('     Formula:      ' || r_medication.FORMULA);
                    DBMS_OUTPUT.PUT_LINE('     Quantity:     ' || r_medication.QUANTITY);
                END LOOP;
                
                IF v_med_count = 0 THEN
                    DBMS_OUTPUT.PUT_LINE('  No medications recorded for this prescription');
                END IF;
            END;
            
            DBMS_OUTPUT.PUT_LINE('=========================================');
        END LOOP;
        
        IF v_prescription_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('No prescriptions found for this patient on the specified date.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('SUMMARY:');
            --DBMS_OUTPUT.PUT_LINE('Total Prescriptions: ' || v_prescription_count);
            DBMS_OUTPUT.PUT_LINE('Total Medications:   ' || v_medication_total);
        END IF;
    END;

END get_prescription_by_date;
/
