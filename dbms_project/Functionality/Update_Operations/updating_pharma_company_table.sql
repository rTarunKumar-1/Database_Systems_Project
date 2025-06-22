SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT col CHAR PROMPT 'Enter column name to update: '
ACCEPT bname CHAR PROMPT 'Enter Company Name: '
ACCEPT new_val CHAR PROMPT 'Enter new value: '

BEGIN
  updatePharmaCompany('&col', '&bname', '&new_val');
END;
/
