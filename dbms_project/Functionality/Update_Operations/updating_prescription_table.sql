SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT col CHAR PROMPT 'Enter column name to update: '
ACCEPT doc_id NUMBER PROMPT 'Enter Doctor ID: '
ACCEPT pat_id NUMBER PROMPT 'Enter Patient ID: '
ACCEPT new_val CHAR PROMPT 'Enter new value: '

BEGIN
  updatePrescription('&col', &doc_id, &pat_id, '&new_val');
END;
/
