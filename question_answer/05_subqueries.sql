use hr;
-- Problem Statements to be solved using – SQL Sub-Queries-- 

-- 1. Display the first name and salary for all employees who earn more than employee number 103 (Employees table).
select first_name , salary from employees
where salary > (select salary from employees where employee_id = 103);

-- 2. Display the department number and department name for all departments whose location number is equal to the location number of department number 90 (Departments table).
select department_id , department_name from departments 
where location_id = (select location_id from departments where department_id = 90);

-- 3. Display the last name and hire date for all employees who was hired after employee number 101 (Employees table).
select last_name , hire_date from employees
where hire_date >(select employee_id from employees where employee_id = 101);

-- 4. Display the first name, last name, and department number for all employees who work in Sales department (Employees and Departments table).
SELECT e.first_name, e.last_name, e.department_id FROM employees as e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = "Sales";

-- 5. Display the department number and department name for all departments located in Toronto (Departments table).
select d.department_id , d.department_name from departments as d
join locations as l
on d.location_id = l.location_id
where l.city = "Toronto";

-- 6. Display the first name, salary and department number for all employees who work in the department as employee number 124 (Employees table).
select first_name , salary , department_id from employees
where department_id = (select department_id from employees where employee_id = 124);

-- 7. Display the first name, salary, and department number for all employees who earn more than the average salary (Employees table).
select first_name , salary , department_id from employees
where salary > (select avg(salary) from employees); 

-- 8. Display the first name, salary, and department number for all employees whose salary equals one of the salaries in department number 20 (Employees table).
select first_name , salary , department_id from employees
where salary in (select distinct salary from employees where department_id = 20);

-- 9. Display the first name, salary, and department number for all employees who earn more than maximum salary in department number 50 (Employees table).
select first_name , salary , department_id from employees
where salary > (select max(salary) from employees where department_id = 50);

-- 10. Display the first name, salary, and department number for all employees who earn more than the minimum salary in department number 60 (Employees table).
select first_name , salary , department_id from employees
where salary > (select min(salary) from employees where department_id = 60);

-- 11. Display the first name, salary, and department number for all employees who earn less than the minimum salary of department number 90 (Employees table).
select first_name , salary , department_id from employees
where salary < (select min(salary) from employees where department_id = 90);

-- 12. Display the first name, salary and department number for all employees whose department is located Seattle (Employees, Departments and Locations table).
select e.first_name , e.salary , e.department_id from employees as e
join departments as d
on e.department_id = d.department_id 
join locations as l
on l.location_id = d.location_id
where l.city = "Seattle";

-- 13. Display the first name, salary, and department number for all employees who earn less than the average salary, and also work at the same department as employee whose first name is Kevin
SELECT first_name, salary, department_id
FROM employees WHERE salary < (SELECT AVG(salary) FROM employees)
AND department_id in (SELECT department_id FROM employees WHERE first_name = 'Kevin');

