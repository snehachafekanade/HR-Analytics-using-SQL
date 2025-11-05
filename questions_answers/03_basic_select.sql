use hr;
-- Problem Statements to be solved using – Basic Select Statements --

-- 1. Create a query to display the employee number, first name, last name, phone number and department number (Employees table).
select employee_id, first_name, last_name, phone_number, department_id from employees;

-- 2. Create a query to display the first name, last name, hire date, salary, and salary after a raise of 20%. Name the last column (salary after a raise) heading as “ANNUAL_SAL” (Employees table).
select first_name, last_name, hire_date, salary*1.20 as Annual_sal from employees;

-- 3. Create a query to display the last name concatenated with the first name, separated by space, and the telephone number concatenated with the email address, separated by hyphen. Name the
-- column headings “FULL_NAME” and “CONTACT_DETAILS” respectively (Employees tables).
SELECT CONCAT(last_name, ' ', first_name) AS FULL_NAME,
CONCAT(phone_number, ' - ', email) AS CONTACT_DETAILS
FROM employees;

-- 4. Create a query to display the unique manager numbers from Employees table.
SELECT DISTINCT manager_id
FROM employees;

-- 5. Create a query to display the last name concatenated with job_id column, separated by space. Name this column heading as “EMPLOYEE_AND_TITLE” (Employees table).
SELECT CONCAT(last_name, ' ', job_id) AS EMPLOYEE_AND_TITLE
FROM employees;

-- 6. Create a query to display the first name, last name, salary, and hire date concatenated with the literal string “HD”, separated by space. Name the column headings “FN”, “LN”, “SAL”, and “HD” respectively (Employees table).
SELECT first_name AS FN, last_name AS LN, salary AS SAL, CONCAT(hire_date," ",'HD') AS HD FROM employees;

-- 7. Create a query to display the unique salaries in Employees tables.
SELECT DISTINCT salary FROM employees;

-- 8. Create a query to display the unique combination of values in department_id and job_id columns (Employees table) 
 SELECT DISTINCT department_id, job_id FROM employees;
