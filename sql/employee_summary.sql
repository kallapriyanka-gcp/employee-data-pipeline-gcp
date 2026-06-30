SELECT * FROM `employee-data-pipeline-501012.employee_dataset.employee_data`;

CREATE OR REPLACE TABLE `employee-data-pipeline-501012.employee_dataset.employee_summary` AS

SELECT DISTINCT employee_id, INITCAP(employee_name) AS employee_name,
department,IFNULL(salary,0) AS salary,IFNULL(city,'Unknown') AS city,joining_date
from `employee-data-pipeline-501012.employee_dataset.employee_data`;


SELECT * FROM `employee-data-pipeline-501012.employee_dataset.employee_summary`;

--Total Employees
SELECT COUNT(*) AS total_employees FROM `employee-data-pipeline-501012.employee_dataset.employee_summary`;
--Department-wise Count
SELECT COUNT(*),department FROM `employee-data-pipeline-501012.employee_dataset.employee_summary`
GROUP BY department;
--Average Salary
SELECT avg(salary) as avg_salary FROM `employee-data-pipeline-501012.employee_dataset.employee_summary`;
--Highest Salary
SELECT MAX(salary) as Highest_Salary FROM `employee-data-pipeline-501012.employee_dataset.employee_summary`;
--Lowest Salary
SELECT MIN(salary) as Highest_Salary FROM `employee-data-pipeline-501012.employee_dataset.employee_summary`;
--Salary by Department
select sum(salary) as total_salary,department from `employee-data-pipeline-501012.employee_dataset.employee_summary`
group by department;
--Employees Joined After 2022
SELECT * from `employee-data-pipeline-501012.employee_dataset.employee_summary`
where joining_date>'2022-01-01';
--IT Employees
select * from `employee-data-pipeline-501012.employee_dataset.employee_summary`
where department='IT';
--Sort by Salary
select * from `employee-data-pipeline-501012.employee_dataset.employee_summary`
order by salary desc;
--Top 3 Highest Paid Employees
select * from `employee-data-pipeline-501012.employee_dataset.employee_summary`
order by salary desc
limit 3;

select * from(
select *, row_number() over (order by salary desc) rn
from `employee-data-pipeline-501012.employee_dataset.employee_summary`) a
where rn<=3;
--Department wise top 2 highest paid employess
select * from(
select *, row_number() over (partition by department order by salary desc) rn
from `employee-data-pipeline-501012.employee_dataset.employee_summary`) a
where rn<=2;



