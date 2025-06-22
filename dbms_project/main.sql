SET ECHO OFF
SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF
SET HEADING OFF
SET ECHO OFF



BEGIN
DBMS_OUTPUT.PUT_LINE('1: Add/Insert/Delete');
DBMS_OUTPUT.PUT_LINE('2: Print prescriptions of a patient in a given period.');
DBMS_OUTPUT.PUT_LINE('3: Print details of a prescription for given patient for a given date.');
DBMS_OUTPUT.PUT_LINE('4: Get the details of drugs produced by a pharmaceutical company.');
DBMS_OUTPUT.PUT_LINE('5: Print the stock position of a pharmacy.');
DBMS_OUTPUT.PUT_LINE('6: Print the contact details of a pharmacy-pharmaceutical company.');
DBMS_OUTPUT.PUT_LINE('7: Print the list of patients for a given doctor.');
DBMS_OUTPUT.PUT_LINE('8: Print all tables.');
END;
/

ACCEPT v_option NUMBER PROMPT 'Enter an option (0 to exit): '
COLUMN script_to_run NEW_VALUE script_to_run
SELECT CASE &v_option
        WHEN 0 THEN 'EXIT'
        WHEN 1 THEN 'Functionality/Insert_Delete_Update'
        WHEN 2 THEN 'Functionality/prescription_of_the_patient_in_given_period'
        WHEN 3 THEN 'Functionality/prescription_details_for_patient_on_given_date'
        WHEN 4 THEN 'Functionality/drugs_produced_by_pharma_company'
        WHEN 5 THEN 'Functionality/stock_position_of_pharmacy'
        WHEN 6 THEN 'Functionality/contact_details_between_pharmacy_and_pharma_company'
        WHEN 7 THEN 'Functionality/patients_consulted_by_given_doctor'
        WHEN 8 THEN 'Functionality/print_all'
        ELSE 'INVALID_INPUT'
END AS script_to_run
FROM DUAL;
@&script_to_run

-- Exit or rerun
COLUMN rerun NEW_VALUE rerun_script
SELECT CASE WHEN &v_option != 0 THEN 'main' ELSE 'EXIT' END AS rerun FROM DUAL;
@&rerun_script
EXIT;