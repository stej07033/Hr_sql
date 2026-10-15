select * from Hr_data;


--- Total Employees

SELECT
    COUNT(*) as total_employees
from Hr_data;

--- Total Attrition

SELECT COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition = 1;

--- Attrition Rate (%)

SELECT 
    ROUND(100.0 * SUM(CASE WHEN attrition = 1 then 1
     else 0
  end)/count(*), 1) as Attrition_rate
from Hr_data;

--- . Active Employees

SELECT COUNT(*) As active_emp
from Hr_data
where Attrition = 0;

--- Average Age
 
 SELECT 
      ROUND(AVG(AGE), 1) as avg_age
      from  Hr_data;

--- Attrition count by Department 

SELECT department,
     count(*) as attrition_count,
round(count(*) * 100.0/
(select count(*) 
from hr_data
where Attrition = 1),
2) as attrition_percentage
from Hr_data
where attrition = 1
group by department
order by attrition_count desc;

--- Number of Employees by Age Group 

WITH AgeGroups AS (
    SELECT
        CASE
            WHEN Age < 25 THEN 'Under 25'
            WHEN Age BETWEEN 25 AND 34 THEN '25 - 34'
            WHEN Age BETWEEN 35 AND 44 THEN '35 - 44'
            WHEN Age BETWEEN 45 AND 55 THEN '45 - 55'
            ELSE 'Over 55'
        END AS CF_age_band,
        Gender
    FROM hr_data
)
SELECT
    CF_age_band,
    Gender,
    COUNT(*) AS employee_count
FROM AgeGroups
GROUP BY
    CF_age_band,
    Gender
ORDER BY
    CASE CF_age_band
        WHEN 'Under 25' THEN 1
        WHEN '25 - 34' THEN 2
        WHEN '35 - 44' THEN 3
        WHEN '45 - 55' THEN 4
        WHEN 'Over 55' THEN 5
    END,
    Gender;

--- Job Satisfaction Rating

SELECT
    Job_Role,
    SUM(CASE WHEN Job_Satisfaction = 1 THEN 1 ELSE 0 END) AS rating_1,
    SUM(CASE WHEN Job_Satisfaction = 2 THEN 1 ELSE 0 END) AS rating_2,
    SUM(CASE WHEN Job_Satisfaction = 3 THEN 1 ELSE 0 END) AS rating_3,
    SUM(CASE WHEN Job_Satisfaction = 4 THEN 1 ELSE 0 END) AS rating_4,
    COUNT(*) AS total_employees
FROM hr_data
GROUP BY Job_Role
ORDER BY total_employees DESC;

--- Attrition count by Education Field

SELECT
    Education_Field,
    COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition = '1'
GROUP BY Education_Field
ORDER BY attrition_count DESC;

--- Attrition Rate by Gender and Age Group

WITH AgeGroups AS (
    SELECT
        CASE
            WHEN Age < 25 THEN 'Under 25'
            WHEN Age BETWEEN 25 AND 34 THEN '25 - 34'
            WHEN Age BETWEEN 35 AND 44 THEN '35 - 44'
            WHEN Age BETWEEN 45 AND 55 THEN '45 - 55'
            ELSE 'Above 55'
        END AS CF_age_band,
        Gender,
        Attrition
    FROM hr_data
)
SELECT
    CF_age_band,
    Gender,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = '1' THEN 1
            ELSE 0
        END
    ) AS attrition_count,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN Attrition = '1' THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS attrition_rate
FROM AgeGroups
GROUP BY CF_age_band, Gender
ORDER BY
    CASE CF_age_band
        WHEN 'Under 25' THEN 1
        WHEN '25 - 34' THEN 2
        WHEN '35 - 44' THEN 3
        WHEN '45 - 55' THEN 4
        WHEN 'Above 55' THEN 5
    END,
    Gender;

--- Department, Gender and Education filter

SELECT DISTINCT Department
FROM hr_data
ORDER BY Department;

--- Attrition by Department and Gender

SELECT
    Department,
    Gender,
    COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition = '1'
GROUP BY Department, Gender
ORDER BY Department, Gender;

--- Employee attrition summary by job role

SELECT
    Job_Role,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
        AS employees_left,
    SUM(CASE WHEN Attrition = 0 THEN 1 ELSE 0 END)
        AS active_employees,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM hr_data
GROUP BY Job_Role
ORDER BY attrition_rate DESC;