SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT bname CHAR PROMPT 'Enter Company Name: '
ACCEPT phone NUMBER PROMPT 'Enter Phone Number: '

BEGIN
  addPharmaCompany('&bname', &phone);
END;
/
