SET SERVEROUTPUT ON;
SET VERIFY OFF
ACCEPT pharmacy_name CHAR PROMPT 'Please enter the name of the pharmacy: '
ACCEPT company_name CHAR PROMPT 'Please enter the name of the pharmaceutical company: '

DECLARE
  v_pharmacy_name  contract.pharmacy_name%TYPE := '&pharmacy_name';
  v_company_name   contract.company_name%TYPE := '&company_name';

  v_start_date     contract.start_date%TYPE;
  v_end_date       contract.end_date%TYPE;
  v_supervisor     contract.supervisor%TYPE;
  v_details        contract.contract_details%TYPE;
  v_found          BOOLEAN := FALSE;

  CURSOR cur_contract IS
    SELECT start_date, end_date, supervisor, contract_details
    FROM contract
    WHERE pharmacy_name = v_pharmacy_name
      AND company_name = v_company_name;

BEGIN
  OPEN cur_contract;
  IF NOT cur_contract%ISOPEN THEN
    DBMS_OUTPUT.PUT_LINE('Failed to open cursor.');
  END IF;

  IF cur_contract%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('No contract found.');
  END IF;

  LOOP
    FETCH cur_contract INTO v_start_date, v_end_date, v_supervisor, v_details;
    EXIT WHEN cur_contract%NOTFOUND;

    v_found := TRUE;

    DBMS_OUTPUT.PUT_LINE('Contract Details:');
    DBMS_OUTPUT.PUT_LINE('Pharmacy               : ' || RPAD(v_pharmacy_name,20));
    DBMS_OUTPUT.PUT_LINE('Company                : ' || v_company_name);
    DBMS_OUTPUT.PUT_LINE('Start date             : ' || RPAD(TO_CHAR(v_start_date, 'DD-MON-YYYY'), 20));
    DBMS_OUTPUT.PUT_LINE('End date               : ' || TO_CHAR(v_end_date, 'DD-MON-YYYY'));    
    DBMS_OUTPUT.PUT_LINE('Supervisor             : ' || RPAD(v_supervisor,20));
    DBMS_OUTPUT.PUT_LINE('Additional information : ' || RPAD(v_details,20));
    DBMS_OUTPUT.PUT_LINE('');
  END LOOP;

  CLOSE cur_contract;

  IF NOT v_found THEN
    DBMS_OUTPUT.PUT_LINE('No contract found for the given pharmacy and company.');
  END IF;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/