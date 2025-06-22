SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEEDBACK OFF
SET ECHO OFF

PROMPT
PROMPT ======================================
PROMPT     Select a table to operate on     
PROMPT ======================================
PROMPT 0. EXIT
PROMPT 1. DOCTOR
PROMPT 2. PATIENT
PROMPT 3. PHARMACY
PROMPT 4. PHARMACY_COMPANY
PROMPT 5. DRUGS
PROMPT 6. PRESCRIPTION
PROMPT 7. PRESCRIPTION_DETAILS
PROMPT 8. SELLS
PROMPT 9. CONTRACT
PROMPT ======================================

ACCEPT v_choice CHAR PROMPT 'Enter your choice (0-9): '

COLUMN rerun NEW_VALUE rerun_script
SELECT CASE WHEN &v_choice = 0 THEN 'main' ELSE 'continue' END AS rerun FROM DUAL;
@&rerun_script

ACCEPT v_action CHAR PROMPT 'Do you want to INSERT, DELETE or UPDATE? (I/D/U): '

-- Build the script name dynamically
COLUMN script_to_run NEW_VALUE script_to_run
SELECT 
    CASE 
      WHEN '&v_choice' = '0' THEN 'exit.sql'
      WHEN '&v_choice' = '1' AND UPPER('&v_action') = 'I' THEN 'Functionality/Insert_Operations/inserting_in_doctor_table.sql'
      WHEN '&v_choice' = '1' AND UPPER('&v_action') = 'U' THEN 'Functionality/Update_Operations/updating_doctor_table.sql'
      WHEN '&v_choice' = '1' AND UPPER('&v_action') = 'D' THEN 'Functionality/Delete_Operations/deleting_from_doctor_table.sql'
      WHEN '&v_choice' = '2' AND UPPER('&v_action') = 'I' THEN 'Functionality/Insert_Operations/inserting_in_patient_table.sql'
      WHEN '&v_choice' = '2' AND UPPER('&v_action') = 'U' THEN 'Functionality/Update_Operations/updating_patient_table.sql'
      WHEN '&v_choice' = '2' AND UPPER('&v_action') = 'D' THEN 'Functionality/Delete_Operations/deleting_from_patient_table.sql'
      WHEN '&v_choice' = '3' AND UPPER('&v_action') = 'I' THEN 'Functionality/Insert_Operations/inserting_in_pharmacy_table.sql'
      WHEN '&v_choice' = '3' AND UPPER('&v_action') = 'U' THEN 'Functionality/Update_Operations/updating_pharmacy_table.sql'
      WHEN '&v_choice' = '3' AND UPPER('&v_action') = 'D' THEN 'Functionality/Delete_Operations/deleting_from_pharmacy_table.sql'
      WHEN '&v_choice' = '4' AND UPPER('&v_action') = 'I' THEN 'Functionality/Insert_Operations/inserting_in_pharma_company_table.sql'
      WHEN '&v_choice' = '4' AND UPPER('&v_action') = 'U' THEN 'Functionality/Update_Operations/updating_pharma_company_table.sql'
      WHEN '&v_choice' = '4' AND UPPER('&v_action') = 'D' THEN 'Functionality/Delete_Operations/deleting_from_pharma_company_table.sql'
      WHEN '&v_choice' = '5' AND UPPER('&v_action') = 'I' THEN 'Functionality/Insert_Operations/inserting_in_drugs_table.sql'
      WHEN '&v_choice' = '5' AND UPPER('&v_action') = 'U' THEN 'Functionality/Update_Operations/updating_drugs_table.sql'
      WHEN '&v_choice' = '5' AND UPPER('&v_action') = 'D' THEN 'Functionality/Delete_Operations/deleting_from_drugs_table.sql'
      WHEN '&v_choice' = '6' AND UPPER('&v_action') = 'I' THEN 'Functionality/Insert_Operations/inserting_in_prescription_table.sql'
      WHEN '&v_choice' = '6' AND UPPER('&v_action') = 'U' THEN 'Functionality/Update_Operations/updating_prescription_table.sql'
      WHEN '&v_choice' = '6' AND UPPER('&v_action') = 'D' THEN 'Functionality/Delete_Operations/deleting_from_prescription_table.sql'
      WHEN '&v_choice' = '7' AND UPPER('&v_action') = 'I' THEN 'Functionality/Insert_Operations/inserting_in_prescription_details_table.sql'
      WHEN '&v_choice' = '7' AND UPPER('&v_action') = 'U' THEN 'Functionality/Update_Operations/updating_prescription_details_table.sql'
      WHEN '&v_choice' = '7' AND UPPER('&v_action') = 'D' THEN 'Functionality/Delete_Operations/deleting_from_prescription_details_table.sql'
      WHEN '&v_choice' = '8' AND UPPER('&v_action') = 'I' THEN 'Functionality/Insert_Operations/inserting_in_sells_table.sql'
      WHEN '&v_choice' = '8' AND UPPER('&v_action') = 'U' THEN 'Functionality/Update_Operations/updating_sells_table.sql'
      WHEN '&v_choice' = '8' AND UPPER('&v_action') = 'D' THEN 'Functionality/Delete_Operations/deleting_from_sells_table.sql'
      WHEN '&v_choice' = '9' AND UPPER('&v_action') = 'I' THEN 'Functionality/Insert_Operations/inserting_in_contract_table.sql'
      WHEN '&v_choice' = '9' AND UPPER('&v_action') = 'U' THEN 'Functionality/Update_Operations/updating_contract_table.sql'
      WHEN '&v_choice' = '9' AND UPPER('&v_action') = 'D' THEN 'Functionality/Delete_Operations/deleting_from_contract_table.sql'
      ELSE 'invalid_input.sql'
    END AS script_to_run
FROM DUAL;

@&script_to_run


COLUMN rerun NEW_VALUE rerun_script
SELECT CASE WHEN &v_choice != 0 THEN 'Functionality/Insert_Delete_Update' ELSE 'continue' END AS rerun FROM DUAL;
@&rerun_script