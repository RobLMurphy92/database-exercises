-- Where Clause Exercise--



use employees;

Describe employee;
-- Primary Key emp_no


-- WHERE Exercise Start:

-- 2.--
/*Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN.  Enter a comment with the number of records returned.*/

SELECT first_name, last_name
from employees
where first_name IN ('Irena', 'Vidya', 'Maya');
-- Returned 709 rows

-- 3.--
/*Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?*/

SELECT first_name, last_name
from employees
where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya';

-- Results: Returned 709 rows

-- 4.--
/*Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.*/

SELECT first_name, last_name, gender
from employees
where gender = 'M' 
and (first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya');

-- return 441 records

-- 5.---
/*Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.*/

SELECT last_name, first_name
from employees
where last_name LIKE 'e%';

-- return 7330 records


-- 6.--
/* Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?*/

SELECT last_name, first_name
from employees
where last_name LIKE '%E' or 'E%';

-- 24292 with e start or e end

SELECT last_name, first_name
from employees
where last_name LIKE '%E' and last_name NOT LIKE 'E%';
-- 23393

-- 7 --
/*Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?*/

Select last_name, first_name
from employees
where last_name Like '%E' and last_name LIKE 'E%';
-- 899 Starts and ends with E

-- 24292 ends with E redardless


-- 8 --
/*Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.*/

Select *
from employees
where hire_date Like '%199%';

-- 135214 

-- 9 --
/*Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.*/

select *
from employees
where birth_date LIKE '%12-25';

-- 842 records


-- 10-- 
/*Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.*/

select *
from employees
where birth_date LIKE '%12-25' and hire_date LIKE '%199%' ;

-- 362 rows


-- 11--
/*Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.*/

SELECT last_name, first_name
from employees
where last_name LIKE '%q%';

-- 1873--



-- 12--
/*Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?*/

SELECT last_name, first_name
from employees
where last_name LIKE '%q%' and last_name NOT LIKE '%qu%';

-- 547 