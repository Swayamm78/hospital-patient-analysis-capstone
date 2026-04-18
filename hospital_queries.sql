-- ================================================================
-- HOSPITAL PATIENT DATA ANALYSIS — SQL Tasks
-- Capstone Project | Swayam | Roll No: 23052684
-- ================================================================

-- TABLE CREATION
CREATE TABLE patients (
    patient_id     INT PRIMARY KEY,
    age            INT,
    gender         VARCHAR(10),
    disease        VARCHAR(50),
    doctor         VARCHAR(50),
    treatment_cost DECIMAL(10, 2)
);

-- SAMPLE DATA INSERTION
INSERT INTO patients VALUES
(1,  45, 'Male',   'Diabetes',      'Dr Shah',     5000),
(2,  30, 'Female', 'Fever',         'Dr Patil',    2000),
(3,  55, 'Male',   'Heart Disease', 'Dr Shah',    20000),
(4,  22, 'Female', 'Flu',           'Dr Kulkarni', 1500),
(5,  40, 'Male',   'Diabetes',      'Dr Shah',     4500),
(6,  35, 'Female', 'Diabetes',      'Dr Patil',    4800),
(7,  60, 'Male',   'Heart Disease', 'Dr Kulkarni',22000),
(8,  28, 'Female', 'Fever',         'Dr Shah',     1800),
(9,  50, 'Male',   'Flu',           'Dr Patil',    1600),
(10, 42, 'Female', 'Heart Disease', 'Dr Shah',    19500),
(11, 33, 'Male',   'Fever',         'Dr Kulkarni', 2100),
(12, 65, 'Female', 'Diabetes',      'Dr Kulkarni', 5200);

-- ================================================================
-- TASK 1: Display all patient records
-- ================================================================
SELECT * FROM patients;

-- ================================================================
-- TASK 2: Count patients by disease (most common diseases first)
-- ================================================================
SELECT
    disease,
    COUNT(*) AS patient_count
FROM patients
GROUP BY disease
ORDER BY patient_count DESC;

-- ================================================================
-- TASK 3: Calculate average treatment cost (overall)
-- ================================================================
SELECT
    ROUND(AVG(treatment_cost), 2) AS avg_treatment_cost
FROM patients;

-- BONUS: Average cost broken down per disease
SELECT
    disease,
    COUNT(*)                             AS patient_count,
    ROUND(AVG(treatment_cost), 2)        AS avg_cost,
    MIN(treatment_cost)                  AS min_cost,
    MAX(treatment_cost)                  AS max_cost
FROM patients
GROUP BY disease
ORDER BY avg_cost DESC;

-- ================================================================
-- TASK 4: Identify the doctor treating the most patients
-- ================================================================
SELECT
    doctor,
    COUNT(*) AS patients_treated
FROM patients
GROUP BY doctor
ORDER BY patients_treated DESC
LIMIT 1;

-- BONUS: Full doctor workload summary with avg cost
SELECT
    doctor,
    COUNT(*)                             AS patients_treated,
    ROUND(AVG(treatment_cost), 2)        AS avg_cost_per_patient,
    SUM(treatment_cost)                  AS total_revenue
FROM patients
GROUP BY doctor
ORDER BY patients_treated DESC;

-- ================================================================
-- BONUS QUERY: Gender-wise disease distribution
-- ================================================================
SELECT
    gender,
    disease,
    COUNT(*) AS count
FROM patients
GROUP BY gender, disease
ORDER BY gender, count DESC;

-- ================================================================
-- END OF SQL SCRIPT
-- ================================================================
