SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT doc_id NUMBER PROMPT 'Enter Doctor ID: '
ACCEPT pat_id NUMBER PROMPT 'Enter Patient ID: '

BEGIN
  deletePrescription(&doc_id, &pat_id);
END;
/
