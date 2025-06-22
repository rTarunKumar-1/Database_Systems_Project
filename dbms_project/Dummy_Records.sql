-- 1. DOCTOR TABLE
INSERT INTO DOCTOR VALUES (101, 'Smith', 7, 'Cardiology');
INSERT INTO DOCTOR VALUES (102, 'Jones', 5, 'Neurology');
INSERT INTO DOCTOR VALUES (103, 'Taylor', 12, 'General Medicine');
INSERT INTO DOCTOR VALUES (104, 'Root', 14, 'General Medicine');

-- 2. PATIENT TABLE
INSERT INTO PATIENT VALUES (201, 'John', 27, '123 North St, Delhi', 103);
INSERT INTO PATIENT VALUES (202, 'James', 32, '456 Oak St, Delhi', 101);
INSERT INTO PATIENT VALUES (203, 'Wood', 29, '789 New Arena, Mumbai', 102);
INSERT INTO PATIENT VALUES (204, 'Abel', 39, 'Old area St, Chennai', 102);

-- 3. PHARMACY_COMPANY
INSERT INTO PHARMACY_COMPANY VALUES ('HealthPlus', 400511);
INSERT INTO PHARMACY_COMPANY VALUES ('MediCare', 500500);
INSERT INTO PHARMACY_COMPANY VALUES ('MedPlus', 770007);

-- 4. DRUGS
INSERT INTO DRUGS VALUES ('HealthPlus', 'Paracetamol', 'C8H9NO2');
INSERT INTO DRUGS VALUES ('HealthPlus', 'Cetirizine', 'C21H25ClN2O3');
INSERT INTO DRUGS VALUES ('MediCare', 'Paracetamol', 'C8H9NO2');
INSERT INTO DRUGS VALUES ('MediCare', 'Zincovit', 'MultiVitamin');
INSERT INTO DRUGS VALUES ('MedPlus', 'Aspirin', 'C9H804');
INSERT INTO DRUGS VALUES ('MedPlus', 'Ibuprofen', 'C13H18O2');

-- 5. PHARMACY
INSERT INTO PHARMACY VALUES ('KingsPharma', 824910, 'SouthSt, Delhi');
INSERT INTO PHARMACY VALUES ('Apollo', 767650, 'NorthSt, Mumbai');
INSERT INTO PHARMACY VALUES ('NewPharma', 243457, 'TNagar, Chennai');

-- 6. CONTRACT
INSERT INTO CONTRACT VALUES (
    'KingsPharma', 'MedPlus', 
    TO_DATE('19/02/2024', 'DD/MM/YYYY'), 
    TO_DATE('19/02/2027', 'DD/MM/YYYY'), 
    'Murthy', '5 mil finalized'
);
INSERT INTO CONTRACT VALUES (
    'Apollo', 'HealthPlus', 
    TO_DATE('25/12/2024', 'DD/MM/YYYY'), 
    TO_DATE('25/12/2026', 'DD/MM/YYYY'), 
    'Somu', 'not finalized'
);
INSERT INTO CONTRACT VALUES (
    'Apollo', 'MedPlus', 
    TO_DATE('10/10/2022', 'DD/MM/YYYY'), 
    TO_DATE('10/10/2027', 'DD/MM/YYYY'), 
    'Somu', 'verified'
);
INSERT INTO CONTRACT VALUES (
    'NewPharma', 'MedPlus', 
    TO_DATE('02/09/2023', 'DD/MM/YYYY'), 
    TO_DATE('02/09/2025', 'DD/MM/YYYY'), 
    'Sundar', 'third party involved'
);
INSERT INTO CONTRACT VALUES (
    'NewPharma', 'HealthPlus', 
    TO_DATE('01/10/2023', 'DD/MM/YYYY'), 
    TO_DATE('01/10/2023', 'DD/MM/YYYY'), 
    'Sundar', 'deal needs approval'
);

-- 7. SELLS
INSERT INTO SELLS VALUES ('KingsPharma', 'MedPlus', 'Aspirin', 120);
INSERT INTO SELLS VALUES ('KingsPharma', 'HealthPlus', 'Cetirizine', 340);
INSERT INTO SELLS VALUES ('Apollo', 'HealthPlus', 'Paracetamol', 450);
INSERT INTO SELLS VALUES ('Apollo', 'MedPlus', 'Aspirin', 300);
INSERT INTO SELLS VALUES ('NewPharma', 'MedPlus', 'Ibuprofen', 100);
INSERT INTO SELLS VALUES ('NewPharma', 'HealthPlus', 'Paracetamol', 200);

-- 8. PRESCRIPTION
INSERT INTO PRESCRIPTION VALUES (101, 202, TO_DATE('19/01/2025', 'DD/MM/YYYY'));
INSERT INTO PRESCRIPTION VALUES (102, 201, TO_DATE('23/03/2025', 'DD/MM/YYYY'));
INSERT INTO PRESCRIPTION VALUES (102, 203, TO_DATE('24/03/2025', 'DD/MM/YYYY'));
INSERT INTO PRESCRIPTION VALUES (103, 201, TO_DATE('15/04/2025', 'DD/MM/YYYY'));
INSERT INTO PRESCRIPTION VALUES (104, 204, TO_DATE('01/04/2025', 'DD/MM/YYYY'));

-- 9. PRESCRIPTION_DETAILS
INSERT INTO PRESCRIPTION_DETAILS VALUES (103, 201, 'MedPlus', 'Aspirin', 20);
INSERT INTO PRESCRIPTION_DETAILS VALUES (103, 201, 'HealthPlus', 'Cetirizine', 30);
INSERT INTO PRESCRIPTION_DETAILS VALUES (102, 201, 'HealthPlus', 'Paracetamol', 5);
INSERT INTO PRESCRIPTION_DETAILS VALUES (101, 202, 'MedPlus', 'Aspirin', 15);
INSERT INTO PRESCRIPTION_DETAILS VALUES (102, 203, 'MedPlus', 'Ibuprofen', 25);
INSERT INTO PRESCRIPTION_DETAILS VALUES (104, 204, 'HealthPlus', 'Cetirizine', 40);
INSERT INTO PRESCRIPTION_DETAILS VALUES (104, 204, 'HealthPlus', 'Paracetamol', 10);

COMMIT;