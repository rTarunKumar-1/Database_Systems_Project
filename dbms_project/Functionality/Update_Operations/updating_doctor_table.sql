SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT col CHAR PROMPT 'Enter column name to update: '
ACCEPT id NUMBER PROMPT 'Enter Doctor ID: '
ACCEPT new_val CHAR PROMPT 'Enter new value: '

BEGIN
  updateDoctor('&col', &id, '&new_val');
END;
/
