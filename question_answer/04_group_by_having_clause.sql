use hr;
-- Problem Statements to be solved using – Group By --
 
-- 1. Display the lowest last name alphabetically (Employees table).
SELECT MIN(last_name) as lowest_last_name FROM employees;

-- 2. Display the highest last name alphabetically (Employees table).
SELECT MAX(last_name) as highest_last_name FROM employees;

-- 3. Display the number of rows in Employees table.
SELECT COUNT(*) as total_employees FROM employees;

-- 4. Display the number of values (exclude NULLs) in commission_pct column (Employees table).
SELECT COUNT(commission_pct) as commission_non_null_count FROM employees;

-- 5. Display the number of NULL values in commission_pct column (Employees table).
SELECT COUNT(*) AS null_count FROM employees
WHERE commission_pct IS NULL;

-- 6. Display the highest, lowest, and average salary.
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary, AVG(salary) AS avg_salary FROM employees;



-- Problem Statements to be solved using - GROUP BY and HAVING Clauses --


-- 7. Average salary per department a. Display the department number and average salary for each department.
select department_id , avg(salary) as avg_salary from employees
group by department_id;

--  b. Modify your query to display the results only for departments 50 or 80.
select department_id , avg(salary) as avg_salary from employees
group by department_id
having department_id in (50 , 80);

-- 8. Numer of employees per job id
-- a. Display the job id and the number of employees for each job id.
select job_id , count(*) as employee_count from employees
group by job_id;

-- b. Modify your query to display the results only for employees whose salary is greater the 10000.
select job_id , count(*) as employee_count from employees
where salary > 10000
group by job_id;

-- c. Modify your query again, this time display the results only for jobs with more than 2 people.
select job_id , count(*) as employee_count from employees
group by job_id
having count(*) > 2;

-- 9. Display the department number, job id, and the average salary for each department and job id.
select department_id , job_id , avg(salary) as avg_salary from employees
group by department_id , job_id ;

-- 10. Managers and highest salary
-- a. Display the manager number and the highest salary for each manager number.
select manager_id , max(salary) as high_salary from employees
group by manager_id;

 -- b. Modify your query to display the results only for employees whose salary is greater than 10000.
select manager_id , max(salary) as high_salary from employees
where salary > 10000
group by manager_id;

-- 11. Display the job id and minimum salary for each job id, for all jobs whose minimum salary is greater than 7000.
select job_id , min_salary from jobs
where min_salary > 7000;

-- 12. Display the department number, and the average salary for each department, for all departments whose number is in the range of 20 and 80, and their average salary is greater than 9000  
select department_id , avg(salary) as avg_salary from employees
where department_id between 20 and 80 
group by department_id
having avg(salary) > 9000;
