SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT pharmacy_name CHAR PROMPT 'Enter Pharmacy Name: '
ACCEPT comp_name CHAR PROMPT 'Enter Company Name: '
ACCEPT trade_name CHAR PROMPT 'Enter Trade Name: '
ACCEPT price NUMBER PROMPT 'Enter Price: '

BEGIN
  addSells('&pharmacy_name', '&comp_name', '&trade_name', &price);
END;
/
