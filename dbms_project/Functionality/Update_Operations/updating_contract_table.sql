SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT col CHAR PROMPT 'Enter column name to update: '
ACCEPT pharmacy_name CHAR PROMPT 'Enter Pharmacy Name: '
ACCEPT comp_name CHAR PROMPT 'Enter Company Name: '
ACCEPT new_val CHAR PROMPT 'Enter new value: '

BEGIN
  updateContract('&col', '&pharmacy_name', '&comp_name', '&new_val');
END;
/
