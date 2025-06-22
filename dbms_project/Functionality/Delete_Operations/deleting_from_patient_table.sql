SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT id NUMBER PROMPT 'Enter Patient ID to delete: '

BEGIN
  deletePatient(&id);
END;
/
