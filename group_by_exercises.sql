-- group by exercise questions and answers--

use employees;
-- 2.--;
/*In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.*/;

SELECT DISTINCT title
from titles;

SELECT
	COUNT(DISTINCT title) AS number_of_unique_titles
	from titles;

-- 7 unique
;

-- 3.--; 
/*Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.*/;

Select Distinct last_name
from employees 
WHERE last_name LIKE 'E%E'
Group BY last_name ASC;

SELECT
	last_name,
	COUNT(*) AS number_of_employees_with_this_last_name
from employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;

-- 5 Records


/*Eldridge
Erbe
Erde
Erie
Etalle*/
;


-- 4.---;
/*Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.*/;
SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name, first_name;

SELECT last_name, first_name, Count(*) AS number_of_employees
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name, first_name;


SELECT last_name, first_name, Count(*) AS number_of_employees
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name, first_name
HAVING number_of_employees > 1
ORDER BY number_of_employees DESC;

-- 846 Records.
;


-- 5.---;
/*Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.*/;


SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' 
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

SELECT DISTINCT 
	last_name
from employees
WHERE last_name LIKE '%q%' 
AND last_name NOT LIKE '%qu%';

/*Chleq
Lindqvist
Qiwen*/
;


-- 6.--;
/*Add a COUNT() to your results (the query above) and use ORDER BY to make it easier to find employees whose unusual name is shared with others.*/;


SELECT DISTINCT last_name, COUNT(last_name)
from employees
WHERE last_name Like '%q%' and last_name NOT LIKE '%qu%'
GROUP BY last_name
Order By last_name ASC;

/*	Chleq	189
	Lindqvist	190
	Qiwen	168*/
    ;

    SELECT DISTINCT last_name, COUNT(last_name) AS count_of_names
from employees
WHERE last_name Like '%q%' and last_name NOT LIKE '%qu%'
GROUP BY last_name
Order By COUNT(last_name) DESC;

/*Lindqvist	190
Chleq	189
Qiwen	168*/


-- 7.--;
/*Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.*/;
select gender, first_name, COUNT(*)
from employees 
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
Group BY gender, first_name;

/*M	Irena	144
M	Maya	146
M	Vidya	151
F	Irena	97
F	Maya	90
F	Vidya	81*/
;


select gender, first_name, COUNT(*) AS number_of_employees
from employees 
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
Group BY gender, first_name
ORDER BY first_name, number_of_employees;

-- 8.--;
/*Using your query that generates a username for all of the employees, generate a count employees for each unique username. 
Are there any duplicate usernames? BONUS: How many duplicate usernames are there?*/;


-- Part A
SELECT 
LOWER(
    CONCAT(
        SUBSTR(first_name,1,1), 
        SUBSTR(last_name,1,4), 
        '_', 
        SUBSTR(birth_date,6,2), 
        SUBSTR(birth_date,3, 2))) 
        AS username, count(*)
FROM employees
GROUP BY username;

-- records 285872
;

SELECT 
LOWER(
    CONCAT(
        SUBSTR(first_name,1,1), 
        SUBSTR(last_name,1,4), 
        '_', 
        SUBSTR(birth_date,6,2), 
        SUBSTR(birth_date,3, 2))) 
        AS username, count(*) AS number_of_duplicates
FROM employees
GROUP BY username
Order by number_of_duplicates DESC;

-- Bonus---;
SELECT 
LOWER(
    CONCAT(
        SUBSTR(first_name,1,1), 
        SUBSTR(last_name,1,4), 
        '_', 
        SUBSTR(birth_date,6,2), 
        SUBSTR(birth_date,3, 2))) 
        AS username, count(*)
FROM employees
GROUP BY username
HAVING COUNT(username) > 1;

--- 13251 Duplicates;

LOWER(
    CONCAT(
        SUBSTR(first_name,1,1), 
        SUBSTR(last_name,1,4), 
        '_', 
        SUBSTR(birth_date,6,2), 
        SUBSTR(birth_date,3, 2))) 
        AS username, count(*) AS number_of_duplicates
FROM employees
GROUP BY username
HAVING number_of_duplicates > 1
ORDER BY number_of_duplicates DESC;