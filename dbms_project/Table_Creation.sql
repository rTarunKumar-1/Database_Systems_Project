
DROP TABLE PRESCRIPTION_DETAILS;
DROP TABLE PRESCRIPTION;
DROP TABLE SELLS;
DROP TABLE CONTRACT;
DROP TABLE DRUGS;
DROP TABLE PATIENT;
DROP TABLE DOCTOR;
DROP TABLE PHARMACY;
DROP TABLE PHARMACY_COMPANY;

/* =========  ROOT TABLES  ========= */
CREATE TABLE doctor (
    doctor_aid       NUMBER
        CONSTRAINT pk_doctor
        PRIMARY KEY,
    name             VARCHAR2(100),
    experience       NUMBER,
    specialization   VARCHAR2(50)
);
/* ................................................................. */
CREATE TABLE patient (
    patient_aid      NUMBER
        CONSTRAINT pk_patient
        PRIMARY KEY,
    name             VARCHAR2(100),
    age              NUMBER,
    address          VARCHAR2(100),
    primary_physician NUMBER
        CONSTRAINT fk_patient_phys
        REFERENCES doctor (doctor_aid)
        ON DELETE SET NULL      -- keep patient if doctor leaves
);
/* ................................................................. */
CREATE TABLE pharmacy (
    name             VARCHAR2(50)
        CONSTRAINT pk_pharmacy
        PRIMARY KEY,
    phone_number     NUMBER,
    address          VARCHAR2(100)
);
/* ................................................................. */
CREATE TABLE pharmacy_company (
    company_name     VARCHAR2(50)
        CONSTRAINT pk_company
        PRIMARY KEY,
    phone_number     NUMBER
);

/* =========  DEPENDENT TABLES  ========= */
CREATE TABLE drugs (
    company_name     VARCHAR2(100),
    trade_name       VARCHAR2(100),
    formula          VARCHAR2(100),
    CONSTRAINT pk_drugs
        PRIMARY KEY (company_name, trade_name),
    CONSTRAINT fk_drug_company
        FOREIGN KEY (company_name)
        REFERENCES pharmacy_company (company_name)
        ON DELETE CASCADE
);
/* ................................................................. */
CREATE TABLE prescription (
    doctor_aid       NUMBER,
    patient_aid      NUMBER,
    date_prsc        DATE,
    CONSTRAINT pk_prescription
        PRIMARY KEY (doctor_aid, patient_aid),
    CONSTRAINT fk_presc_doc
        FOREIGN KEY (doctor_aid)
        REFERENCES doctor (doctor_aid)
        ON DELETE CASCADE,
    CONSTRAINT fk_presc_pat
        FOREIGN KEY (patient_aid)
        REFERENCES patient (patient_aid)
        ON DELETE CASCADE
);
/* ................................................................. */
CREATE TABLE prescription_details (
    doctor_aid       NUMBER,
    patient_aid      NUMBER,
    company_name     VARCHAR2(100),
    trade_name       VARCHAR2(100),
    quantity         NUMBER,
    CONSTRAINT pk_presc_det
        PRIMARY KEY (doctor_aid, patient_aid, company_name, trade_name),
    CONSTRAINT fk_det_presc
        FOREIGN KEY (doctor_aid, patient_aid)
        REFERENCES prescription (doctor_aid, patient_aid)
        ON DELETE CASCADE,
    CONSTRAINT fk_det_drug
        FOREIGN KEY (company_name, trade_name)
        REFERENCES drugs (company_name, trade_name)
        ON DELETE CASCADE
);
/* ................................................................. */
CREATE TABLE sells (
    pharmacy_name    VARCHAR2(100),
    company_name     VARCHAR2(100),
    trade_name       VARCHAR2(100),
    price            NUMBER,
    CONSTRAINT pk_sells
        PRIMARY KEY (pharmacy_name, company_name, trade_name),
    CONSTRAINT fk_sells_pharm
        FOREIGN KEY (pharmacy_name)
        REFERENCES pharmacy (name)
        ON DELETE CASCADE,
    CONSTRAINT fk_sells_drug
        FOREIGN KEY (company_name, trade_name)
        REFERENCES drugs (company_name, trade_name)
        ON DELETE CASCADE
);
/* ................................................................. */
CREATE TABLE contract (
    pharmacy_name    VARCHAR2(100),
    company_name     VARCHAR2(100),
    start_date       DATE,
    end_date         DATE,
    supervisor       VARCHAR2(100),
    contract_details VARCHAR2(100),
    CONSTRAINT pk_contract
        PRIMARY KEY (pharmacy_name, company_name),
    CONSTRAINT fk_con_pharm
        FOREIGN KEY (pharmacy_name)
        REFERENCES pharmacy (name)
        ON DELETE CASCADE,
    CONSTRAINT fk_con_company
        FOREIGN KEY (company_name)
        REFERENCES pharmacy_company (company_name)
        ON DELETE CASCADE
);


