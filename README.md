# 📊 HR Analytics & Employee Attrition Analysis — SQL

<img width="1254" height="1254" alt="image" src="https://github.com/user-attachments/assets/eb9e51d3-54c8-4a5f-904c-5284413a9931" />

Analyzing employee data using SQL Server to understand workforce distribution, employee attrition, job satisfaction, and department-level trends.

## 🚀 Project Overview

The **HR Analytics & Employee Attrition Analysis** project uses SQL to transform employee records into meaningful business insights. The goal is to help HR teams understand employee turnover, identify workforce patterns, and support data-driven retention strategies.

## 🎯 Project Objectives

- Calculate total employees and active employees.
- Measure the overall employee attrition rate.
- Analyze attrition across departments and education fields.
- Compare employee attrition by gender and age group.
- Understand job satisfaction ratings across job roles.
- Identify job roles with higher attrition rates.
- Summarize employee retention and workforce distribution.

## 🛠️ Tools & Technologies

- **SQL Server** — Data querying and analysis
- **SQL Server Management Studio (SSMS)** — Query development and execution
- **SQL** — Aggregations, filtering, grouping, conditional logic, CTEs, and sorting
- **Power BI** — Optional visualization of SQL analysis results

## 📂 Project Structure

```text
HR-Analytics-SQL/
│
├── Hr_sql_solutions.sql
└── README.md
```

## 📈 Key Analysis & SQL Concepts

### 1. Workforce Overview

Calculate total employees, active employees, average employee age, and total employees who left the organization.

**SQL concepts:** `COUNT()`, `AVG()`, `ROUND()`, `WHERE`

### 2. Employee Attrition Rate

Calculate the percentage of employees who left the organization.

```sql
SELECT
    ROUND(
        100.0 * SUM(
            CASE WHEN Attrition = 1 THEN 1 ELSE 0 END
        ) / COUNT(*),
        1
    ) AS Attrition_rate
FROM Hr_data;
```

### 3. Department-wise Attrition

Identify the departments contributing the highest number of employee exits.

**SQL concepts:** `GROUP BY`, `COUNT()`, subqueries, `ORDER BY`

### 4. Age Group & Gender Analysis

Segment employees into age groups:

- Under 25
- 25–34
- 35–44
- 45–55
- Above 55

Compare employee counts and attrition rates across gender and age categories.

**SQL concepts:** `CASE`, `BETWEEN`, CTEs, conditional aggregation

<img width="490" height="520" alt="Screenshot 2026-10-15 121745" src="https://github.com/user-attachments/assets/7c9d03c9-f1c5-453f-9086-981e7e57d0b6" />
<img width="926" height="580" alt="Screenshot 2026-10-15 121729" src="https://github.com/user-attachments/assets/4fd74c85-1206-43ce-9a10-0ad1f1765674" />

### 5. Job Satisfaction Analysis

Analyze employee satisfaction ratings from 1 to 4 for different job roles.

**SQL concepts:** `SUM(CASE WHEN...)`, `GROUP BY`, `COUNT()`

### 6. Education Field Analysis

Measure employee attrition across different education fields to understand workforce turnover patterns.

### 7. Job Role Attrition Summary

Compare total employees, employees who left, active employees, and attrition rates across job roles.

## 💡 Business Questions Answered

- How many employees work in the organization?
- What percentage of employees have left?
- Which departments have the highest number of employee exits?
- How does attrition vary by age group and gender?
- Which job roles have the highest attrition rates?
- How are job satisfaction ratings distributed across job roles?
- Which education fields account for the most employee exits?

## 🧠 Skills Demonstrated

- SQL querying and data analysis
- Data aggregation and grouping
- Conditional logic using `CASE`
- Common Table Expressions (CTEs)
- Subqueries
- Percentage and attrition-rate calculations
- Workforce segmentation
- HR business analysis
- Translating business questions into SQL queries

## 📌 Business Value

This project demonstrates how SQL can support HR decision-making by highlighting workforce composition, employee turnover patterns, and job satisfaction trends. These findings can help HR teams investigate retention challenges and prioritize further analysis.

*Note: The queries identify patterns and associations; they do not establish the causes of employee attrition.*

## 👨‍💻 Author

**Sai M**  
Aspiring Data Analyst

- **GitHub:** https://github.com/stej07033
- **LinkedIn:** https://www.linkedin.com/in/madanapalli-sai-19b835389/

---

⭐ If you find this project useful, feel free to explore the SQL queries and share your feedback.

#SQL #HRAnalytics #EmployeeAttrition #DataAnalytics #SQLServer #DataAnalysis
