SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT doc_id NUMBER PROMPT 'Enter Doctor ID: '
ACCEPT pat_id NUMBER PROMPT 'Enter Patient ID: '
ACCEPT comp_name CHAR PROMPT 'Enter Company Name: '
ACCEPT trade_name CHAR PROMPT 'Enter Trade Name: '

BEGIN
  deletePrescriptionDetail(&doc_id, &pat_id, '&comp_name', '&trade_name');
END;
/
