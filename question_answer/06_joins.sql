use hr;
-- Problem Statements to be solved using – Inner JOIN --

-- 1. Employees and departments (Employees & Departments tables)
-- a. For each employee, display the first name, last name, department number and department name.
 select e.first_name , e.last_name , e.department_id , d.department_name from employees as e
join departments as d
on e.department_id = d.department_id ;

-- b. Display the first name, last name, department number and department name, for all employees in departments 50 or 90.
select e.first_name , e.last_name , e.department_id , d.department_name from employees as e
join departments as d
on e.department_id = d.department_id
where e.department_id in (50 , 90);

-- 2. Departments and locations (Departments, Employees & Locations tables)
-- a. For each department, display the department name, city, and state province.
select d.department_name , l.city , l.state_province from departments as d
join locations as l
on l.location_id = d.location_id;

-- b. For each employee, display the full name, department name, city, and state province.
select concat(e.first_name," ",e.Last_name) as full_name , d.department_name , l.city , l.state_province from employees as e
join departments as d
on e.department_id = d.department_id
join locations as l
on l.location_id = d.location_id;

-- c. Display the full name, department name, city, and state province, for all employees whose last name contains the letter a.
select concat(e.first_name," ",e.Last_name) as full_name , d.department_name , l.city , l.state_province from employees as e
join departments as d
on e.department_id = d.department_id
join locations as l
on l.location_id = d.location_id
where e.last_name like "%a%";
  

-- Problem Statements to be solved using – Outer JOIN -- 


-- 4. Employees & departments
-- a. Display the first name, last name, department number and department name, for all employees including those without any department.
select e.first_name , e.last_name , e.department_id , d.department_name from employees as e
left join departments as d
on e.department_id = d.department_id;

-- b. Modify your query to display all departments including departments without any employees.
SELECT e.first_name, e.last_name, d.department_id, d.department_name FROM departments d
right JOIN employees e 
ON e.department_id = d.department_id;


-- Problem Statements to be solved using – Self JOIN --


-- 5. Employees and managers (Employees table)
-- a. For each employee, display the last name, and the manager’s last name.
SELECT   e.last_name as manager_last_name,m.last_name as employee_last_name FROM employees e
Join employees m 
ON e.employee_id = m.manager_id;

-- b. Modify your query to display all employees including those without any manager.
SELECT e.last_name as employee_last_name, m.last_name as manager_last_name FROM employees e
left Join employees m 
ON e.manager_id = m.employee_id;

-- 6. Display the first name, last name, and department number for all employees who work in the same department as employee whose last name is “King”.
select first_name , last_name , department_id from employees 
where department_id in (select department_id from employees where last_name = "King");

-- 7. Display the last name and salary for all employees who earn less than employee number 103  
select last_name , salary from employees
where salary < (select salary from employees where employee_id = 103);