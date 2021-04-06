-- Case Statements Exercises

use employees;

/*.)Create a file named case_exercises.sql and craft queries to return the results for the following criteria:*/
-- created file.
;


/*1.)Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.*/;
-- start date is their hire date!!!

-- 300024 rows
-- need emp_no, department number, start date, end_date and is_current_employee is a 1 if still empoyed

use employees;

select emp_no, max(to_date)
from dept_emp
group by emp_no;


SELECT 
de.emp_no, 
dept_no, 
e.hire_date, 
de.to_date,
IF (to_date > curdate(), 1, 0) as current_employees -- created my if function
	from dept_emp as de -- stated what columns i wanted from the dept_emp table which contained majority of columns I wanted.
Join (
	select emp_no, max(to_date) as max_date
	from dept_emp
	group by emp_no) -- created my own temp table here then aliased it. 
	AS last_dept ON de.emp_no = last_dept.emp_no AND de.to_date = last_dept.max_date 
	-- I used a join to add the rows from the temp table known as last_dept 
	-- I joined the table using column id emp_no.
	-- As well joined on the column id de.to_date to temp table last_dept column max_date,
	-- which i had used earlier to get emp_no with their max date  
join employees as e on de.emp_no = e.emp_no;
-- lastly i joined employees to be able to get the hire date.

-- ryan method
-- always define your level of observation
-- before slinging code: list out any tables we need to talk to;
-- employees table to get their name
-- each row should be an employees
-- inner join == and operation
-- used a temp table method.

SELECT 
	de.emp_no,
	dept_no,
	hire_date,
	to_date,
	IF(to_date > CURDATE(), 1, 0) AS current_employee
FROM dept_emp AS de
JOIN (SELECT 
			emp_no,
			MAX(to_date) AS max_date
		FROM dept_emp
		GROUP BY emp_no) as last_dept 
		ON de.emp_no = last_dept.emp_no
			AND de.to_date = last_dept.max_date
JOIN employees AS e ON e.emp_no = de.emp_no;

-- RESULTS: 300024 rows

/*2.)Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.*/;

SELECT 
first_name,
last_name,
CASE 
when last_name >= 'a' and last_name <='h' then 'a-h'
when last_name >= 'i' and last_name <='q' then 'i-q'
else 'r-z'
END as alpha_group
from employees;



select first_name, last_name, case
     when last_name like 'A%' then 'A-H'
     when last_name like 'B%' then 'A-H'
     when last_name like 'C%' then 'A-H'
     when last_name like 'D%' then 'A-H'
     when last_name like 'E%' then 'A-H'
     when last_name like 'F%' then 'A-H'
     when last_name like 'G%' then 'A-H'
     when last_name like 'H%' then 'A-H'
     when last_name like 'I%' then 'I-Q'
     when last_name like 'J%' then 'I-Q'
     when last_name like 'K%' then 'I-Q'
     when last_name like 'L%' then 'I-Q'
     when last_name like 'M%' then 'I-Q'
     when last_name like 'N%' then 'I-Q'
     when last_name like 'O%' then 'I-Q'
     when last_name like 'P%' then 'I-Q'
     when last_name like 'Q%' then 'I-Q'  
     else 'R-Z'
     end as alpha_group
from employees
;


SELECT 
first_name,
last_name,
CASE 
when left(last_name,1) >= 'az' and last_name <='hz' then 'a-h'
when left(last_name,1) >= 'iz' and last_name <='q' then 'i-q'
when left(last_name,1) >= 'rz' and last_name <='zz' then 'r-z'
END as alpha_group
from employees;





/*3.)How many employees (current or previous) were born in each decade?*/
select COUNT(*) num_employees_per_decade,
CASE
when birth_date between '1950-01-01' and '1959-12-31' then '1950s'
when birth_date between '1960-01-01' and '1969-12-31' then '1960s'
ELSE 'youngish'
END as birth_decades
from employees
group by birth_decades;




-- BONUS
/*What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?*/;
