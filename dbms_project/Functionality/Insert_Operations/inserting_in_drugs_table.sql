SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT comp CHAR PROMPT 'Enter Company Name: '
ACCEPT trade CHAR PROMPT 'Enter Trade Name: '
ACCEPT formula CHAR PROMPT 'Enter Formula: '

BEGIN
  addDrug('&comp', '&trade', '&formula');
END;
/
