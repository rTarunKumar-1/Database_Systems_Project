CREATE OR REPLACE PROCEDURE print_all_tables AS
    /* handy shortcut for padding */
    FUNCTION pad(p_txt VARCHAR2, p_len PLS_INTEGER)
        RETURN VARCHAR2
    IS
    BEGIN
        RETURN RPAD(NVL(p_txt, ' '), p_len);  -- NB: non-breaking space in NVL
    END;
BEGIN
    DBMS_OUTPUT.enable(NULL);                 -- unlimited buffer
    /* ---------------------------------------------------------- */
    DBMS_OUTPUT.put_line(chr(10)||'==========  DOCTOR  ==========');
    DBMS_OUTPUT.put_line(
        pad('ID',6)||pad('NAME',25)||pad('EXP',5)||'SPECIALIZATION'
    );
    FOR r IN (SELECT * FROM doctor ORDER BY doctor_aid) LOOP
        DBMS_OUTPUT.put_line(
            pad(r.doctor_aid,6)||
            pad(r.name,25)||
            pad(r.experience,5)||
            r.specialization
        );
    END LOOP;
    /* ---------------------------------------------------------- */
    DBMS_OUTPUT.put_line(chr(10)||'==========  PATIENT  ==========');
    DBMS_OUTPUT.put_line(
        pad('ID',6)||pad('NAME',25)||pad('AGE',5)||
        pad('ADDRESS',30)||'PRIMARY_DOCTOR'
    );
    FOR r IN (SELECT * FROM patient ORDER BY patient_aid) LOOP
        DBMS_OUTPUT.put_line(
            pad(r.patient_aid,6)||
            pad(r.name,25)||
            pad(r.age,5)||
            pad(r.address,30)||
            NVL(TO_CHAR(r.primary_physician), '—')
        );
    END LOOP;
    /* ---------------------------------------------------------- */
    DBMS_OUTPUT.put_line(chr(10)||'==========  PHARMACY  =========');
    DBMS_OUTPUT.put_line(
        pad('NAME',25)||pad('PHONE',15)||'ADDRESS'
    );
    FOR r IN (SELECT * FROM pharmacy ORDER BY name) LOOP
        DBMS_OUTPUT.put_line(
            pad(r.name,25)||
            pad(TO_CHAR(r.phone_number),15)||
            r.address
        );
    END LOOP;
    /* ---------------------------------------------------------- */
    DBMS_OUTPUT.put_line(chr(10)||'=====  PHARMACY_COMPANY  ======');
    DBMS_OUTPUT.put_line(
        pad('COMPANY',30)||'PHONE'
    );
    FOR r IN (SELECT * FROM pharmacy_company ORDER BY company_name) LOOP
        DBMS_OUTPUT.put_line(
            pad(r.company_name,30)||TO_CHAR(r.phone_number)
        );
    END LOOP;
    /* ---------------------------------------------------------- */
    DBMS_OUTPUT.put_line(chr(10)||'============  DRUGS  ==========');
    DBMS_OUTPUT.put_line(
        pad('COMPANY',30)||pad('TRADE_NAME',25)||'FORMULA'
    );
    FOR r IN (SELECT * FROM drugs ORDER BY company_name, trade_name) LOOP
        DBMS_OUTPUT.put_line(
            pad(r.company_name,30)||
            pad(r.trade_name,25)||
            r.formula
        );
    END LOOP;
    /* ---------------------------------------------------------- */
    DBMS_OUTPUT.put_line(chr(10)||'=========  PRESCRIPTION  =======');
    DBMS_OUTPUT.put_line(
        pad('DOC_ID',7)||pad('PAT_ID',7)||'DATE'
    );
    FOR r IN (SELECT * FROM prescription ORDER BY doctor_aid, patient_aid) LOOP
        DBMS_OUTPUT.put_line(
            pad(r.doctor_aid,7)||
            pad(r.patient_aid,7)||
            TO_CHAR(r.date_prsc,'DD-MON-YYYY')
        );
    END LOOP;
    /* ---------------------------------------------------------- */
    DBMS_OUTPUT.put_line(chr(10)||'====  PRESCRIPTION_DETAILS  ====');
    DBMS_OUTPUT.put_line(
        pad('DOC_ID',7)||pad('PAT_ID',7)||
        pad('COMPANY',25)||pad('TRADE',20)||'QTY'
    );
    FOR r IN (
        SELECT * FROM prescription_details
        ORDER BY doctor_aid, patient_aid, company_name, trade_name
    ) LOOP
        DBMS_OUTPUT.put_line(
            pad(r.doctor_aid,7)||
            pad(r.patient_aid,7)||
            pad(r.company_name,25)||
            pad(r.trade_name,20)||
            r.quantity
        );
    END LOOP;
    /* ---------------------------------------------------------- */
    DBMS_OUTPUT.put_line(chr(10)||'=============  SELLS  ==========');
    DBMS_OUTPUT.put_line(
        pad('PHARMACY',25)||pad('COMPANY',25)||
        pad('TRADE',20)||'PRICE'
    );
    FOR r IN (
        SELECT * FROM sells
        ORDER BY pharmacy_name, company_name, trade_name
    ) LOOP
        DBMS_OUTPUT.put_line(
            pad(r.pharmacy_name,25)||
            pad(r.company_name,25)||
            pad(r.trade_name,20)||
            TO_CHAR(r.price)
        );
    END LOOP;
    /* ---------------------------------------------------------- */
    DBMS_OUTPUT.put_line(chr(10)||'===========  CONTRACT  =========');
    DBMS_OUTPUT.put_line(
        pad('PHARMACY',25)||pad('COMPANY',25)||
        pad('START',12)||pad('END',12)||
        pad('SUPERVISOR',15)||'DETAILS'
    );
    FOR r IN (
        SELECT * FROM contract
        ORDER BY pharmacy_name, company_name
    ) LOOP
        DBMS_OUTPUT.put_line(
            pad(r.pharmacy_name,25)||
            pad(r.company_name,25)||
            pad(TO_CHAR(r.start_date,'DD-MON-YY'),12)||
            pad(TO_CHAR(r.end_date  ,'DD-MON-YY'),12)||
            pad(r.supervisor,15)||
            r.contract_details
        );
    END LOOP;
    /* ---------------------------------------------------------- */
END print_all_tables;
/

EXEC print_all_tables;