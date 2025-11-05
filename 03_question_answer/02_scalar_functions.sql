use hr;
-- Problem Statements to be solved using – SQL Scalar/Numeric Functions --

-- 1. Display the first name in lower case and last name in upper case, for all employees whose employee number is in the range between 80 and 150.
select lower(first_name) , upper(last_name) from employees 
where employee_id between 80 and 150;

-- 2. Display the first name and last name for all employees whose family name is King, perform this exercise with a case-insensitive search (regardless of the capitalization used for the values within last name column).
select first_name , last_name from employees 
where upper(last_name) = "KING";

-- 3. Generating new email address
-- a. For each employee, display the first name, last name, and email address. The email address will be composed from the first letter of first name, concatenated with the three
-- first letters of last name, concatenated with @oracle.com.
select first_name , last_name , 
CONCAT(LOWER(SUBSTRING(first_name, 1, 1)), LOWER(SUBSTRING(last_name, 1, 3)),'@oracle.com') AS gen_email FROM employees;

-- b. For each employee, display the first name, last name, and email address. The email
-- address will be composed from the first letter of first name, concatenated with the three last letters of last name, concatenated with @oracle.com.
SELECT first_name, last_name, CONCAT(LOWER(SUBSTRING(first_name, 1, 1)), LOWER(RIGHT(last_name, 3)), '@oracle.com') AS gen_email FROM employees;

-- 4. Using the CONCAT function
-- a. For each employee, use the CONCAT function to display the first name concatenated with the last name.
select concat(first_name," ",last_name) as full_name from employees;

-- b. For each employee, use the CONCAT function to display the first name concatenated with the last name, concatenated with hire date.
select concat(first_name," ",last_name," ",hire_date) as hire_name from employees;

-- 5. Display the last name for all employees where last name’s length is greater than 8 characters.
select last_name from employees
where length(last_name) > 8;

-- 6. Phone numbers:
-- a. For each employee, display the first name, last name, phone number and a new phone number using the REPLACE function. in the new phone number replace all occurrences of 515 with 815.
select first_name, last_name, phone_number , replace(phone_number,"515","815") as new_phone_number from employees;

-- b. For each employee, display the first name, last name, phone number and a new phone number using the REPLACE function. in the new phone number replace all prefixes of 515 with 815.
SELECT first_name, last_name, phone_number, CONCAT('815', SUBSTRING(phone_number, 4)) AS new_phone_number FROM employees
WHERE phone_number LIKE '515%';

-- 7. For each employee, display :
-- a. first name b. salary c. salary after a raise of 12% d. salary after a raise of 12%, expressed as a whole number (ROUND) e. salary after a raise of 12%, round down to the nearest whole number.
select first_name, salary, salary+salary*.12, round(salary+salary*.12,0), round(salary+salary*.12) from employees; 

-- 8.For each employee, display the first name, hire date, hire date minus 10 days, hire date plus one month, and the day difference between current date and hire date.
select first_name, hire_date, date_sub(hire_date, interval 10 day), date_add(hire_date, interval 1 month), datediff(curdate(),hire_date) from employees;

-- 9. For each employee, display the first name, last name, hire date, number of months he works in the company, and number of years he works in the company.
select first_name, last_name, hire_date, timestampdiff(month,hire_date,curdate()), timestampdiff(year,hire_date,curdate()) from employees;

-- 10. For each employee, display the first name, hire date, and hire date plus one year.
select first_name, hire_date, date_add(hire_date, interval 1 year) from employees;

-- 11. For each employee, display the first name, hire date, hire date rounded up to the nearest year, and hire date rounded up to the nearest month.
SELECT 
    first_name,
    hire_date,
    IF(DAYOFYEAR(hire_date) = 1,
        hire_date,
        MAKEDATE(YEAR(hire_date) + 1, 1)) AS rounded_up_year,
    IF(DAY(hire_date) = 1,
        DATE_FORMAT(hire_date, '%Y-%m-01'),
        DATE_FORMAT(DATE_ADD(hire_date, INTERVAL 1 MONTH),
                '%Y-%m-01')) AS rounded_up_month
FROM employees;

-- 12. For each employee, display the first name, the day of his hire date, and the year of his hire date.
SELECT first_name, DAY(hire_date) AS day_hired, YEAR(hire_date) AS year_hired FROM employees;

-- 13. Display the last name in upper case, the salary in format model : ‘9,999.999’, and hire date in format model: ‘DD/MM/YYYY’, for all employees whose last name begins with the letter D or K.
SELECT UPPER(last_name) AS last_upper,
FORMAT(salary, 3) AS salary_fmt,
DATE_FORMAT(hire_date, '%d/%m/%Y') AS hire_date_fmt
FROM employees
WHERE last_name LIKE 'D%' OR last_name LIKE 'K%';

-- 14. Commission Percentage
-- a. For each employee, display the first name, last name, salary and commission percentage. If an employee doesn’t earn a commission, display 0 instead of NULL.
SELECT first_name, last_name, salary, IFNULL(commission_pct, 0) AS commission_pct FROM employees;

-- b. For each employee, display the first name, last name, salary and commission percentage. If an employee doesn’t earn a commission, display “No Commission” instead of NULL.
SELECT first_name, last_name, salary, IFNULL(commission_pct, 'No Commission') AS commission_pct FROM employees;

-- 15. For each employee, display the first name, last name, salary, and a salary grade based on these conditions :
-- a. if the salary is between 0 and 5000 – salary grade level is A
-- b. if the salary is between 5001 and 15000 – salary grade level is B
-- c. if the salary is between 15001 and 20000 – salary grade level is C
-- d. for any other range – salary grade level is D  
SELECT first_name, last_name, salary,
case
WHEN salary between 0 and 5000 then 'A'
WHEN salary between 5001 and 15000 then'B'
WHEN salary between 15001 and 20000 then 'C'
ELSE 'D'
END as salary_grade
FROM employees;

