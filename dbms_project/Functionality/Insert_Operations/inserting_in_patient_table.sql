SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT id NUMBER PROMPT 'Enter Patient ID: '
ACCEPT bname CHAR PROMPT 'Enter Name: '
ACCEPT age NUMBER PROMPT 'Enter Age: '
ACCEPT addr CHAR PROMPT 'Enter Address: '
ACCEPT doc_id NUMBER PROMPT 'Enter Primary Physician ID: '

BEGIN
  addPatient(&id, '&bname', &age, '&addr', &doc_id);
END;
/
