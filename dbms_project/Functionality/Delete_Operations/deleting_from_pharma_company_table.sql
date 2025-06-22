SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT bname CHAR PROMPT 'Enter Company Name to delete: '

BEGIN
  deletePharmaCompany('&bname');
END;
/
