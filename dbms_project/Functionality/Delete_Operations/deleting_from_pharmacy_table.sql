SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT bname CHAR PROMPT 'Enter Pharmacy Name to delete: '

BEGIN
  deletePharma('&bname');
END;
/
