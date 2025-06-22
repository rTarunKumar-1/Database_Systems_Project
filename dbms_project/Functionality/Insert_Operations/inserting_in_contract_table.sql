SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT pharmacy_name CHAR PROMPT 'Enter Pharmacy Name: '
ACCEPT comp_name CHAR PROMPT 'Enter Company Name: '
ACCEPT bstart_date CHAR PROMPT 'Enter Start Date (DD-MON-YY): '
ACCEPT end_date CHAR PROMPT 'Enter End Date (DD-MON-YY): '

BEGIN
  addContract('&pharmacy_name', '&comp_name', TO_DATE('&bstart_date','DD-MON-YY'), TO_DATE('&end_date','DD-MON-YY'));
END;
/
