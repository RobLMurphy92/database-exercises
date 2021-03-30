-- Exercise 1 JOIN Example Database--
use join_example_db;

-- 1.)
/*Use the join_example_db. Select all the records from both the users and roles tables.*/

-- 2.)
/*Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.*/
select *
from users -- table a
join roles ON users.role_id = roles.id;
-- what i told sql was; table A is users, I want to do an inner join(excludes null) and join roles table column roles ID to Users table column role_id. 
select * 
from users -- table A
Left join roles on users.role_id = roles.id;

-- I told SQL here to return all the records of table A and an matched values including nulls from table B!

select * 
from users -- table A
Left join roles on users.role_id = roles.id;

-- Use Alias

select *
from users AS employee -- TABLE A
Join roles AS position -- TABLE B
ON employee.role_id = position.id;


Select *
from users AS employee
Left Join roles AS position
ON employee.role_id = position.id;


SELECT *
from roles;

SELECT *
from users;

Select *
from users AS employee
Right Join roles AS position
ON employee.role_id = position.id;


-- 3.)
/*Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.*/

SELECT roles.name AS roles, 
count(users.role_id) AS users
FROM roles
LEFT JOIN users ON users.role_id = roles.id
GROUP BY roles;



# ----------------------------------------------------#--------------------------------

-- Madeline Runthrough
/*1.)Use the join_example_db. Select all the records from both the users and roles tables.*/
use join_example_db;
SELECT * FROM roles;
SELECT * FROM usersl;


/*2.)Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.*/

SELECT *
FROM users
Join roles on users.role_id = roles.id;

SELECT *
FROM users
Left Join roles on users.role_id = roles.id;

SELECT *
FROM users
RIGHT Join roles on users.role_id = roles.id;


/*3.)Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.*/

SELECT r.name, COUNT(u.name)
FROM roles AS r 
LEFT JOIN users AS u ON r.id = u.role_id
GROUP BY r.name;

--- EXERCISE 2 Employees Database---

-- 1.) use employees_db

use employees;

-- want department name and department manager

/*2.)Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.*/
Describe departments;


Select dept_name AS 'Department Name', 
CONCAT(first_name, ' ', last_name) AS 'Department Manager'
from dept_manager
Join departments ON dept_manager.dept_no = departments.dept_no
Join employees ON dept_manager.emp_no = employees.emp_no
WHERE to_date LIKE '%9999%'
Order by dept_name ASC;

/*Customer Service	Yuchang Weedman
Development	Leon DasSarma
Finance	Isamu Legleitner
Human Resources	Karsten Sigstam
Marketing	Vishwani Minakawa
Production	Oscar Ghazalie
Quality Management	Dung Pesch
Research	Hilary Kambil
Sales	Hauke Zhang*/;


/*3.)Find the name of all departments currently managed by women.*/

-- Madeline Method
SELECT departments.dept_name,
CONCAT(employees.first_name, ' ', employees.last_name)
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE dept_manager.to_date LIKE '%9999%' and employees.gender = 'F'
Order BY dept_name;
 

-- MY method
Select dept_name AS 'Department Name', 
CONCAT(first_name, ' ', last_name) AS 'Department Manager'
from dept_manager
Join departments ON dept_manager.dept_no = departments.dept_no
Join employees ON dept_manager.emp_no = employees.emp_no
WHERE to_date LIKE '%9999%' and gender = 'F'
Order by dept_name ASC;

/*Development	Leon DasSarma
Finance	Isamu Legleitner
Human Resources	Karsten Sigstam
Research	Hilary Kambil*/;

/*4.) Find the current titles of employees currently working in the Customer Service department.*/;
-- MY METHOD
Select title AS Title, COUNT(*)
from dept_emp 
Join employees ON dept_emp.emp_no = employees.emp_no
Join titles ON dept_emp.emp_no = titles.emp_no
Join departments ON dept_emp.dept_no = departments.dept_no
WHERE titles.to_date LIKE '%9999%' and (departments.dept_name LIKE '%Customer Service%' and dept_emp.to_date LIKE '%9999%')
GROUP BY Title ASC;

/*
Assistant Engineer	68
Engineer	627
Manager	1
Senior Engineer	1790
Senior Staff	11268
Staff	3574
Technique Leader	241
*/
-- Madeline Method
;
SELECT titles.title,
COUNT(employees.emp_no)
FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN titles ON employees.emp_no = titles.emp_no
WHERE titles.to_date LIKE '%9999%' and dept_name LIKE '%Customer Service%'
Group By title;

/*5.) Find the current salary of all current managers.*/
-- Want Department Name, Employee Name, Salary
-- Salaries--emp_no
-- departments-- dept_no
-- employees-- emp_no
-- dept_manager --emp_no, dept_no, will use to_date here!
-- HAVE TO BE CURRENT MANAGERS


-- MY METHOD
SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS Name, salaries.salary AS Salary
from dept_manager
Join salaries ON dept_manager.emp_no = salaries.emp_no
Join departments ON dept_manager.dept_no = departments.dept_no
Join employees ON dept_manager.emp_no = employees.emp_no
WHERE dept_manager.to_date LIKE '%9999%' and salaries.to_date LIKE '%9999%'
ORDER BY departments.dept_name;

-- madeline method
;
SELECT d.dept_name,CONCAT(employees.first_name, ' ', employees.last_name) AS employee_name,
s.salary
FROM employees
JOIN salaries s ON employees.emp_no = s.emp_no
JOIN dept_manager on s.`emp_no` = dept_manager.emp_no
JOIN departments d ON d.dept_no = dept_manager.`dept_no`
WHERE s.to_date > NOW() and dept_manager.to_date > NOW()
ORDER BY dept_name;



/*6.)Find the number of current employees in each department.*/
-- MY METHOD
SELECT departments.dept_no, departments.dept_name, COUNT(employees.emp_no) AS num_employees
from dept_emp
Join departments ON dept_emp.dept_no = departments.dept_no
Join employees ON dept_emp.emp_no = employees.emp_no
WHERE dept_emp.to_date LIKE '%9999%'
Group BY dept_emp.dept_no


-- madeline method
SELECT d.dept_no,d.dept_name, COUNT(e.emp_no) AS num_employees
from departments AS d
JOIN current_dept_emp AS de ON d.dept_no = de.dept_no
JOIN employees AS e ON de.emp_no = e.emp_no
WHERE de.to_date > NOW()
GROUP BY d.dept_name
ORDER BY d.dept_no;

/*7.)Which department has the highest average salary? Hint: Use current not historic information.*/; 
-- MY METHOD
SELECT departments.dept_name, AVG(salaries.salary) AS average_salary
FROM `dept_emp`
JOIN salaries ON dept_emp.`emp_no` = salaries.`emp_no`
JOIN departments ON dept_emp.`dept_no` = departments.`dept_no`
WHERE (salaries.`to_date` LIKE "%9999%" and dept_emp.`to_date` LIKE '%9999%') 
GROUP BY departments.`dept_name`
Order BY average_salary DESC
LIMIT 1;

-- madeline method

SELECT d.dept_name, AVG(s.salary) AS average_salary
FROM departments AS d
JOIN dept_emp AS de ON d.dept_no = de.dept_no
	AND de.`to_date` > NOW()
JOIN salaries AS s ON s.emp_no = de.emp_no
	AND s.to_date > NOW()
GROUP BY dept_name
ORDER BY average_salary DESC LIMIT 1;

/*8.) Who is the highest paid employee in the Marketing department?*/
-- Department is MArketing
-- Will need to know employee name
-- Will need to know salary
-- MAX salary.
-- Current employee in Marketing
;
-- MY METHOD
SELECT 
first_name, last_name
from employees
JOIN salaries ON salaries.`emp_no` = employees.`emp_no`
JOIN dept_emp ON dept_emp.`emp_no` = employees.`emp_no`
JOIN departments ON departments.`dept_no` = dept_emp.`dept_no`
WHERE departments.`dept_no`='d001'
ORDER BY salary DESC
Limit 1;

-- Madeline Method

SELECT e.`first_name`, e.`last_name`
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
	AND de.to_date > NOW()
JOIN salaries AS s ON de.emp_no = s.emp_no
	AND s.`to_date` > NOW()
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Marketing'
Order BY s.salary DESC
LIMIT 1;



/*9.)Which current department manager has the highest salary?*/
-- OUTPUT department manager name, department name, max salary

-- madeline method
SELECT 
e.`first_name`, e.`last_name`
s.salary,
d.dept_name,
FROM employees AS e 
JOIN dept_manager AS dm ON e.`emp_no` = dm.emp_no
	AND dm.to_date > NOW()
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.`to_date` > NOW()
JOIN departments AS d ON d.dept_no = dm.dept_no
ORDER BY s.salary DESC
LIMIT 1;




-- 10.(BONUS)

-- 11.(BONUS)
