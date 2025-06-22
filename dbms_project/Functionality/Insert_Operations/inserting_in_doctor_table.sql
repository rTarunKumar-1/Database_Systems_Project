SET VERIFY OFF
SET FEEDBACK OFF


ACCEPT id NUMBER PROMPT 'Enter Doctor ID: '
ACCEPT bname CHAR PROMPT 'Enter Name: '
ACCEPT exp NUMBER PROMPT 'Enter Experience: '
ACCEPT spec CHAR PROMPT 'Enter Specialization: '

BEGIN
  addDoctor(&id, '&bname', &exp, '&spec');
END;
/
