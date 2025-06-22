SET VERIFY OFF
SET FEEDBACK OFF

ACCEPT id NUMBER PROMPT 'Enter Doctor ID to delete: '

BEGIN
  deleteDoctor(&id);
END;
/
