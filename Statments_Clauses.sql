# Practice Notes
use fruits_db;
Describe fruits;


SELECT *
From fruits;

-- select specific name columns and all of the row from those colums.
Select NAME
From fruits;

Select 
	name,
	quantity
from fruits;
	
-- Select distinct statement
Select Distinct name
from fruits;
-- use chipotle database to demo types of orders table.
Use chipotle;

-- Inspect the columns and data types from the order table
Describe orders;

-- select all of the rows and columns from a table (4622 records retrievied)
Select *
from orders;

-- slect specific columns and all of the rows from a

select item_name
from orders;

-- return only unique values from a column using the distinct keyword

select distinct item_name
from orders;

-- filter so that only records with the value 'Chicken Bowl' in (item_name are returned.)
-- 726 records returned WHERE CLAUSE, giving a condition that have to be met.
-- in my sql can use "" or '' for string value...
-- A - is not the same as a space.
Select *
from orders
where item_name = 'Chicken Bowl';

Select *
from orders
Where item_price = '$4.45';
-- can return a range using operators.

-- filter by a primary key, only record will be returned because thew value must be unique

Select *
from orders
where Id = 15;

-- Filter using a WHERE clause with the BETWEEN & AND operators. (Return 39 Records)
select *
from orders
where quantity between 3 and 5;

-- Filter uusing a WHERE Statement >,<, <> (not equals) operators.
select *
from orders where order_id > 1500;

select* 
from orders 
where quantity != 1;


-- Create alias use AS
-- Alias renames a column (return 267 records).
-- no spaces dont need"" have to seperate column with ,
-- ALias are key when joining tables.
select 
	item_name AS "Multiple Item Order",
	quantity AS Number
from orders
where quantity  >= 2; -- where this condition is true return it to me..