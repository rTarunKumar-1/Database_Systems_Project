SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pharmacy_name CHAR PROMPT 'Please enter the name of the pharmacy: '

DECLARE
  v_phar_name sells.pharmacy_name%TYPE := '&pharmacy_name';
  v_comp_name sells.company_name%TYPE;
  v_drug_name sells.trade_name%TYPE;
  v_price sells.price%TYPE;

  v_found BOOLEAN := FALSE;

  CURSOR cur_stock_position IS
    SELECT company_name, trade_name, price
    FROM sells
    WHERE pharmacy_name = v_phar_name;

BEGIN
  OPEN cur_stock_position;

  LOOP
    FETCH cur_stock_position
      INTO v_comp_name, v_drug_name, v_price;
    EXIT WHEN cur_stock_position%NOTFOUND;

    IF NOT v_found THEN
      -- Print this only once, before the first row
      DBMS_OUTPUT.PUT_LINE('Stock Details for "' || v_phar_name || '":');
      v_found := TRUE;
    END IF;

    DBMS_OUTPUT.PUT_LINE(
      'Drug Name: ' || RPAD(v_drug_name, 20) ||
      'Manufacturer: ' || RPAD(v_comp_name, 20) ||
      'Price: ' || v_price
    );
    DBMS_OUTPUT.PUT_LINE('');
  END LOOP;

  CLOSE cur_stock_position;

  IF NOT v_found THEN
    DBMS_OUTPUT.PUT_LINE('No stock records found for pharmacy "' || v_phar_name || '".');
  END IF;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/