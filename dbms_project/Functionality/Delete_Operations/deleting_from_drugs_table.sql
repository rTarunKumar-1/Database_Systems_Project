SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT comp CHAR PROMPT 'Enter Company Name: '
ACCEPT trade CHAR PROMPT 'Enter Trade Name: '

BEGIN
  deleteDrug('&comp', '&trade');
END;
/
