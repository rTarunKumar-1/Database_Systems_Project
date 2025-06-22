SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT col CHAR PROMPT 'Enter column name to update: '
ACCEPT doc_id NUMBER PROMPT 'Enter Doctor ID: '
ACCEPT pat_id NUMBER PROMPT 'Enter Patient ID: '
ACCEPT comp_name CHAR PROMPT 'Enter Company Name: '
ACCEPT trade_name CHAR PROMPT 'Enter Trade Name: '
ACCEPT new_val CHAR PROMPT 'Enter new value: '

BEGIN
  updatePrescriptionDetail('&col', &doc_id, &pat_id, '&comp_name', '&trade_name', '&new_val');
END;
/
