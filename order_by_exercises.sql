-- Order BY Exercise--
--Problems & Answers --

use employees;

 -- ---2----
/*Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?*/
select first_name, last_name
from employees
where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya'
Order by first_name;

-- 709 Rows
-- Irena Reutenauer--first row
-- Vidya Simmen-- last person

-- ----3----
/*Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?*/

select first_name, last_name
from employees
where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya'
Order by first_name, last_name;

-- 709
-- Irena Acton
-- Vidya Zweizig


-- 4------
/*Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?*/

select first_name, last_name
from employees
where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya'
Order by last_name, first_name;
-- 709
-- Irena Acton
-- Maya Zyda

-- 5--
/*Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.*/

select *
from employees
where last_name LIKE '%E' and last_name LIKE 'E%'
ORDER BY emp_no;

-- 899
-- 10021 ---Ramzi Erde
-- 499648 ---Tadahiro Erde


----- 'e%e' means starts with e and ends with e..


-- 6-----
/*Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.*/

Select *
from employees 
where last_name LIKE '%E' and last_name LIKE 'E%'
ORDER BY hire_date DESC;

-- 899
-- Teiji Eldridge newest
-- Sergi Erde oldest


-- 7-----
/*Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first.*/

select * 
from employees
where hire_date LIKE '%199%' and birth_date LIKE '%-12-25%'
order by birth_date ASC, hire_date DESC;

-- 362--
-- Khun Bernini ---Oldest Hired Last 
-- Douadi Pettis--- Youngest Hired First