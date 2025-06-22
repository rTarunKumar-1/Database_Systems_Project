SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT col CHAR PROMPT 'Enter column name to update: '
ACCEPT comp CHAR PROMPT 'Enter Company Name: '
ACCEPT trade CHAR PROMPT 'Enter Trade Name: '
ACCEPT new_val CHAR PROMPT 'Enter new value: '

BEGIN
  updateDrug('&col', '&comp', '&trade', '&new_val');
END;
/
