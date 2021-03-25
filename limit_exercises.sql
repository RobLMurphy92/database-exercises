-- Limit Exercise Answers--
use employees;

select*
from employees;


-- 2--

/*MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. For example, to find all the unique titles within the company, we could run the following query:List the first 10 distinct last name sorted in descending order.*/

SELECT DISTINCT last_name
from employees
Order by last_name desc
Limit 10;

/*
Zykh
Zyda
Zwicker
Zweizig
Zumaque
Zultner
Zucker
Zuberek
Zschoche
Zongker*/


 
 
 -- ----3---
 
/*Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names of the employees returned.*/

Select *
from employees 
where hire_date like '%199%' and birth_date like '%12-25'
Order by hire_date
Limit 5;

-- 5 rows
/*Alselm	Cappello	
Utz	Mandell
Bouchung Schreiter	
Baocai	Kushner	
Petter	Stroustrup*/

-- --4--
/*Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.*/

Select *
from employees 
where hire_date like '%199%' and birth_date like '%12-25'
Order by hire_date
Limit 5 OFFSET 50;

-- RESULTS
/*
231580	1957-12-25	Christophe	BacaF	1990-08-11
275621	1961-12-25	Moie	Birsak	M	1990-08-11
494492	1957-12-25	Chikako	Ibel	F	1990-08-12
48396	1955-12-25	Shounak	Jansen	M	1990-08-13
17351	1961-12-25	Zhigen	BoissierM	1990-08-18
*/

-- 5--
/*Limit and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?*/


-- /*Limit and offset allows you to filter the rows further. Limit and offset togther let you isolate a certain number of rows. Limit isolates the results to a range, Offset defines where that result is located. I.E you are skipping a certain number of rows to get to the value you want to start with then using limit you display a range of values you want.*/


--- CARLS MYSTERY BOX-----
use chipotle;

Select quantity, item_name, item_price
from orders
where item_name LIKE '%chicken%' or item_name LIKE'%veggies%'
ORDER BY quantity DESC
LIMIT 10;