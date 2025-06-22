SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT bname CHAR PROMPT 'Enter Pharmacy Name: '
ACCEPT phone NUMBER PROMPT 'Enter Phone Number: '
ACCEPT addr CHAR PROMPT 'Enter Address: '

BEGIN
  addPharma('&bname', &phone, '&addr');
END;
/
