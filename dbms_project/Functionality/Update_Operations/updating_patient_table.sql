SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT col CHAR PROMPT 'Enter column name to update: '
ACCEPT id NUMBER PROMPT 'Enter Patient ID: '
ACCEPT new_val CHAR PROMPT 'Enter new value: '

BEGIN
  updatePatient('&col', '&name', '&new_val');
END;
/
