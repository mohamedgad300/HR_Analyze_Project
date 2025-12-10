-- ============================
--   HR DATASET FULL ANALYSIS
-- ============================

-- 1) General Statistics
SELECT 
    COUNT(*) AS total_employees,
    COUNT(DISTINCT Department) AS total_departments,
    COUNT(DISTINCT Job_Role) AS total_job_roles,
    MIN(Age) AS youngest_age,
    MAX(Age) AS oldest_age,
    AVG(Age * 1.0) AS avg_age
FROM [HR Dataset];

-- 2) Salary Analysis
SELECT 
    AVG(Salary * 1.0) AS avg_salary,
    MIN(Salary) AS min_salary,
    MAX(Salary) AS max_salary
FROM [HR Dataset];

SELECT 
    Department,
    COUNT(*) AS employees,
    AVG(Salary * 1.0) AS avg_salary,
    MIN(Salary) AS min_salary,
    MAX(Salary) AS max_salary
FROM [HR Dataset]
GROUP BY Department
ORDER BY avg_salary DESC;

SELECT 
    Job_Role,
    AVG(Salary * 1.0) AS avg_salary,
    MIN(Salary) AS min_salary,
    MAX(Salary) AS max_salary
FROM [HR Dataset]
GROUP BY Job_Role
ORDER BY avg_salary DESC;

-- 3) Performance Analysis
SELECT 
    Department,
    AVG(Performance_Score * 1.0) AS avg_performance
FROM [HR Dataset]
GROUP BY Department
ORDER BY avg_performance DESC;

-- TOP 10 Highest Performance
SELECT TOP 10
    Name, Department, Job_Role, Performance_Score
FROM [HR Dataset]
ORDER BY Performance_Score DESC;

-- 4) Experience Analysis
SELECT 
    Department,
    AVG(Experience_Years * 1.0) AS avg_experience
FROM [HR Dataset]
GROUP BY Department
ORDER BY avg_experience DESC;

SELECT 
    Experience_Years,
    AVG(Salary * 1.0) AS avg_salary
FROM [HR Dataset]
GROUP BY Experience_Years
ORDER BY Experience_Years;

-- 5) Education Level
SELECT 
    Education_Level,
    COUNT(*) AS employees,
    AVG(Salary * 1.0) AS avg_salary,
    AVG(Performance_Score * 1.0) AS avg_performance
FROM [HR Dataset]
GROUP BY Education_Level
ORDER BY avg_salary DESC;

-- 6) Promotion Analysis (BIT column)
SELECT 
    SUM(CASE WHEN Promotion_Last_Year = 1 THEN 1 ELSE 0 END) AS promoted,
    SUM(CASE WHEN Promotion_Last_Year = 0 THEN 1 ELSE 0 END) AS not_promoted,
    ROUND(100.0 * SUM(CASE WHEN Promotion_Last_Year = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS promotion_rate
FROM [HR Dataset];

SELECT 
    Department,
    SUM(CASE WHEN Promotion_Last_Year = 1 THEN 1 ELSE 0 END) AS promoted,
    COUNT(*) AS total,
    ROUND(100.0 * SUM(CASE WHEN Promotion_Last_Year = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS promotion_rate
FROM [HR Dataset]
GROUP BY Department
ORDER BY promotion_rate DESC;

-- 7) Overtime Analysis
SELECT 
    Overtime,
    COUNT(*) AS employees,
    AVG(Salary * 1.0) AS avg_salary,
    AVG(Performance_Score * 1.0) AS avg_performance
FROM [HR Dataset]
GROUP BY Overtime;

-- 8) Attendance Analysis
SELECT 
    AVG(Attendance_Rate * 1.0) AS avg_attendance
FROM [HR Dataset];

SELECT
    CASE 
        WHEN Performance_Score >= 4 THEN 'High'
        WHEN Performance_Score >= 3 THEN 'Medium'
        ELSE 'Low'
    END AS performance_level,
    AVG(Attendance_Rate * 1.0) AS avg_attendance
FROM [HR Dataset]
GROUP BY 
    CASE 
        WHEN Performance_Score >= 4 THEN 'High'
        WHEN Performance_Score >= 3 THEN 'Medium'
        ELSE 'Low'
    END;

-- 9) Gender Analysis
SELECT 
    Gender,
    COUNT(*) AS employees,
    AVG(Salary * 1.0) AS avg_salary,
    AVG(Performance_Score * 1.0) AS avg_performance
FROM [HR Dataset]
GROUP BY Gender;

-- 10) Location Analysis
SELECT 
    Location,
    COUNT(*) AS employees,
    AVG(Salary * 1.0) AS avg_salary,
    AVG(Performance_Score * 1.0) AS avg_performance
FROM [HR Dataset]
GROUP BY Location
ORDER BY employees DESC;

-- 11) Marital Status Analysis
SELECT 
    Marital_Status,
    COUNT(*) AS employees,
    AVG(Salary * 1.0) AS avg_salary,
    AVG(Performance_Score * 1.0) AS avg_performance
FROM [HR Dataset]
GROUP BY Marital_Status;

-- 12) Full Employee Dataset (Dashboard)
SELECT 
    Name,
    Gender,
    Age,
    Department,
    Job_Role,
    Salary,
    Experience_Years,
    Education_Level,
    Performance_Score,
    Promotion_Last_Year,
    Overtime,
    Attendance_Rate,
    Location,
    Marital_Status
FROM [HR Dataset];
