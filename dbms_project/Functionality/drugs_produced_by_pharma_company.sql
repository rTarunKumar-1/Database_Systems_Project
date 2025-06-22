SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pharmaceutical_company_name CHAR PROMPT 'Please enter the name of the pharmaceutical company: '

DECLARE
  v_comp_name   drugs.company_name%TYPE := '&pharmaceutical_company_name';
  v_drug_name   drugs.trade_name%TYPE;
  v_formula     drugs.formula%TYPE;
  CURSOR cur_drugdetails IS
    SELECT trade_name,
           formula
      FROM drugs
     WHERE company_name = v_comp_name;
BEGIN
  OPEN cur_drugdetails;
  LOOP
    FETCH cur_drugdetails
      INTO v_drug_name,
           v_formula;
    EXIT WHEN cur_drugdetails%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
      'Drug Name: '  || RPAD(v_drug_name,20)
    || '  Formula: ' || v_formula
    );
  END LOOP;
  CLOSE cur_drugdetails;
END;
/
