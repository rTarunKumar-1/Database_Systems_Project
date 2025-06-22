SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT pharmacy_name CHAR PROMPT 'Enter Pharmacy Name: '
ACCEPT comp_name CHAR PROMPT 'Enter Company Name: '

BEGIN
  deleteContract('&pharmacy_name', '&comp_name');
END;
/
