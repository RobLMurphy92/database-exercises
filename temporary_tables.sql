-- temporary tables exercise-

/*1.)Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department.*/

CREATE TEMPORARY TABLE employees_with_departments 
(first_name VARCHAR(30) NOT NULL, last_name VARCHAR(30) NOT NULL,
dept_name VARCHAR(30) NOT NULL);

SELECT * FROM employees_with_departments;r

-- a.)Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns

ALTER TABLE employees_with_departments
ADD full_name VARCHAR(32) NOT NULL;
SELECT * FROM employees_with_departments;



-- b.) Update the table so that full name column contains the correct data

UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);

-- c.)Remove the first name and last name columns from the table.

ALTER TABLE employees_with_departments 
DROP COLUMN first_name;

ALTER TABLE employees_with_departments 
DROP COLUMN last_name;

SELECT * FROM employees_with_departments;

-- d.) What is another way you could have ended up with this same table?


drop table if exists employees_with_departments;

SELECT dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_no, departments.dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
WHERE to_date > curdate();

Create TEMPORARY TABLE employees_with_departments AS (
SELECT dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_no, departments.dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
WHERE to_date > curdate());

SELECT * FROM employees_with_departments AS ewd;

AlTER TABLE employees_with_departments ADD full_name VARCHAR(32);

UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);

ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

SELECT * FROM employees_with_departments;

-- 2.) Create a temporary table based on the payment table from the sakila database. 
-- Write the SQL necessary to transform the amount column such that it is stored as an 
-- integer representing the number of cents of the payment. For example, 1.99 should become 199.
;
USE `florence19`;

CREATE TEMPORARY TABLE payment_sakila AS (SELECT sakila.payment.payment_id, sakila.payment.customer_id, sakila.payment.staff_id, sakila.payment.rental_id, sakila.payment.amount * 100 AS payment_cents_int, sakila.payment.payment_date, sakila.payment.last_update
FROM sakila.payment);

SELECT * FROM payment_sakila;

ALTER TABLE payment_sakila modify payment_sakila.payment_cents_int INT NOT NULL;

SELECT * FROM payment_sakila;









-- 3.)Find out how the current average pay in each department compares to the overall, historical average pay. 
-- In order to make the comparison easier, you should use the Z-score for salaries. 
-- In terms of salary, what is the best department right now to work for? The worst: 
-- Results Sales is the best, HR is the worst. REMEMBER FOR STDEV that it just the amount of deviation from the mean both + and -. 

;


use employees;
SELECT avg(salary) AS historical_avg_salary, STDDEV(salary) AS historical_std
from salaries;
-- historical_avg_salary = 63810.7448	
-- historical standard deviation = 16904.82828800014
;


use florence19;



create temporary table current_info_rm AS (
	SELECT dept_name, avg(salary) as department_avg
	from employees.salaries
	join employees.`dept_emp` ON employees.salaries.emp_no = employees.dept_emp.emp_no
	join employees.departments ON employees.dept_emp.dept_no = employees.departments.dept_no
	where employees.dept_emp. `to_date` > curdate()
	and employees.salaries.`to_date` > curdate()
	group by dept_name);
	
SELECT * FROM current_info_rm;

ALTER TABLE current_info_rm add average_salary float(10,2);

ALTER TABLE current_info_rm add stddev_salary float(10,2);

ALTER TABLE current_info_rm add z_score float(10,2);

update current_info_rm set average_salary = (63810.7448);

update current_info_rm set stddev_salary = (16904.82828800014);

update current_info_rm set z_score = (department_avg - average_salary)/stddev_salary;

SELECT * FROM current_info_rm
order by z_score DESC;
