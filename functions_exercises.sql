-- functions exercise-- USING CONCAT, LIKE/NOT LIKE, SUBSTR, CASE CONVERSION, REPLACE, DATE & TIME FUNC
-- Numerical function, Casting

use employees;

/*------2-------*/
/*Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.*/
;
SELECT CONCAT(first_name, ': ', last_name) AS 'full_name'
from employees
WHERE last_name LIKE 'E%' and last_name LIKE '%E';

-- 899 Records
;


/*------3-------*/
/*Convert the names produced in your last query to all uppercase.*/
SELECT UPPER(CONCAT(first_name, ': ', last_name)) AS 'full_name'
from employees
WHERE last_name LIKE 'E%' and last_name LIKE '%E';

-- 899 Records
;

/*------4-------*/
/*Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),*/
;


SELECT first_name, last_name, hire_date, birth_date,  DATEDIFF(CURDATE(), hire_date) AS 'TOTAL_DAYS_START_TO_NOW'
from employees
WHERE hire_date LIKE '%199%' and birth_date LIKE '%12-25%';

-- 362 records
;

/*------5-------*/
/*Find the smallest and largest current salary from the salaries table.*/

Select *
from salaries;

select MAX(salary), MIN(salary)
from salaries;

-- MAX 158220 MIN 38623
;

/*------6-------*/
/*Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:*/
;

SELECT 
LOWER(
	CONCAT(SUBSTR(first_name,1,1), SUBSTR(last_name,1,4), '_', SUBSTR(birth_date, 6,2), SUBSTR(birth_date, 3,2))) AS 'username', first_name, last_name, birth_date
from employees;