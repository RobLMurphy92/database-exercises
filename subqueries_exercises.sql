-- Subqueries Exercises--


use employees;

SELECT * FROM employees
where emp_no = 101010;
-- can use salaries for current employee due to if not getting paid not an employee.
-- employees need to have a hire date of 1990-10-22
-- employee needs to be current.


/*--1.)Find all the current employees with the same hire date as employee 101010 using a sub-query.*/;

SELECT emp_no FROM salaries
where to_date > NOW();

SELECT * FROM employees
where hire_date = '1992-10-22';

SELECT first_name, last_name, hire_date
from employees
where emp_no IN (
SELECT emp_no FROM salaries
where to_date > NOW())
AND hire_date = '1992-10-22';

-- Results 40 Records.




/*-- 2.)Find all the titles ever held by all current employees with the first name Aamod.*/;
-- first name of employee is Aamod.
-- need titles
-- employees have to be currently
;

SELECT * from titles;

SELECT * from salaries
WHERE to_date > NOW();

SELECT * from employees
WHERE first_name = 'Aamod';

SELECT employees.emp_no
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE to_date > CURRENT_DATE()
AND first_name = 'Aamod';


SELECT 
title, COUNT(title) AS number_of_employees_Aamod
from titles
where emp_no IN(
SELECT employees.emp_no
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE to_date > CURRENT_DATE()
AND first_name = 'Aamod')
GROUP BY title
ORDER BY number_of_employees_Aamod DESC;

-- RESULTS:
/*
Staff	64
Engineer	62
Senior Staff	60
Senior Engineer	51
Technique Leader	9
Assistant Engineer	5
*/

-- 3.)How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
;
-- Have to be not working anymore so 
 select *
 from salaries
 WHERE to_date LIKE '9999-01-01';
/* to_date = 9999-01-01
-- if an employee no longer gets a salary they arent employeed*/
-- dont need name, can use emp_no, dont want duplicates., COUNT(emp_no) AS no_longer_employed
;
SELECT COUNT(*) AS Not_employed
from employees AS e 
WHERE emp_no NOT IN
(select s.emp_no
 from salaries AS s
 WHERE s.to_date LIKE '9999-01-01'
);

-- RESULTS 59900

SELECT COUNT(*)
from employees
WHERE emp_no NOT IN(
SELECT emp_no
FROM salaries 
WHERE to_date = '9999-01-01');


-- RESULT: 59,900


-- Know what employees are employed
SELECT emp_no FROM salaries
WHERE to_date = '9999-01-01'
GROUP BY emp_no;



-- 4.)Find all the current department managers that are female. List their names in a comment in your code.
-- current department manager, need to use the dept_manager table
-- needs to be current dept_manager has to_date for if employed/still manager.
-- need the names of the women, first, and last. employees table has these
SELECT * 
from employees;

SELECT emp_no FROM dept_manager 
WHERE to_date > CURRENT_DATE(); -- 9 values

SELECT first_name, last_name FROM employees
WHERE gender = 'F'; -- has emp_no

SELECT CONCAT(first_name, ' ', last_name) AS current_female_managers
from employees AS e
WHERE emp_no IN (
SELECT dm.emp_no FROM dept_manager AS dm
WHERE dm.to_date LIKE '%9999-01-01%')
AND e.gender = 'F'
ORDER BY current_female_managers;




-- RESULTS: 4 records
/*Hilary	Kambil
Isamu	Legleitner
Karsten	Sigstam
Leon	DasSarma*/;


-- 5.)Find all the employees who currently have a higher salary than the companies overall, historical average salary.
-- need to calculate historical average
SELECT AVG(s.salary) AS historical_average
from salaries AS s;
-- historical avg 63810.7448

SELECT s.salary
from salaries AS s
WHERE s.to_date ='9999-01-01';

-- want to take these two and subtract.




SELECT e.emp_no, first_name, last_name, salary
from employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE s.salary > (SELECT AVG(salary) from salaries)
and s.to_date = '9999-01-01';

-- RESULT 154543

;


-- 6.)How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

SELECT STDDEV(salary)
from salaries
WHERE to_date > CURRENT_DATE();  -- 17309.95933634675
;

Select max(salary)
from salaries
WHERE to_date > CURRENT_DATE(); -- 158220

Select min(salary)
from salaries
WHERE to_date > CURRENT_DATE();  -- 38623

Select avg(salary)
from salaries
WHERE to_date > CURRENT_DATE(); -- AVG 72012.2359
-- 
-- 
-- 
--

SELECT (SELECT COUNT(salary)
from salaries 
WHERE to_date > CURRENT_DATE()
	and salary >= 
				(SELECT MAX(salary) - STDDEV(salary)
				from salaries
				WHERE to_date > CURRENT_DATE()
				)) 
				/ 
(SELECT 
COUNT(salary)
from salaries
WHERE to_date > CURRENT_DATE()) * 100; 

-- RESULTS :
-- PERCENTAGE IS 0.0346%.
-- 83 Salaries with 1 STD.