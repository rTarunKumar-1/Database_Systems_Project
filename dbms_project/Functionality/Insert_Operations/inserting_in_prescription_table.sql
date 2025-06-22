SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT doc_id NUMBER PROMPT 'Enter Doctor ID: '
ACCEPT pat_id NUMBER PROMPT 'Enter Patient ID: '
ACCEPT prsc_date CHAR PROMPT 'Enter Prescription Date (DD-MON-YY): '

BEGIN
  addPrescription(&doc_id, &pat_id, TO_DATE('&prsc_date','DD-MON-YY'));
END;
/
