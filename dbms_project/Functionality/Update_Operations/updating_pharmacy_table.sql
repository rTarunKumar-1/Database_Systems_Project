SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT col CHAR PROMPT 'Enter column name to update: '
ACCEPT bname CHAR PROMPT 'Enter Pharmacy Name: '
ACCEPT new_val CHAR PROMPT 'Enter new value: '

BEGIN
  updatePharma('&col', '&bname', '&new_val');
END;
/
