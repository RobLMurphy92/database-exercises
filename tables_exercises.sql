#SQL Practice Exercises.
# Tables Exercise 1.
List all the tables in the database
# employees, depatments, salaries, titles, combination of departments & employees

Explore the employees table. What different data types are present on this table?
# You are seeing several different data types. Numeric, String, Date. There is a null value allowed for only titles table to date.

Which table(s) do you think contain a numeric type column?
##Salary, Employees

Which table(s) do you think contain a string type column?
##Every table except salary. 

Which table(s) do you think contain a date type column?
##Every table except departments.

What is the relationship between the employees and the departments tables?
#employee number and department number. We are able to see which department an indivual is in.

Show the SQL that created the dept_manager table.
CREATE TABLE `dept_manager` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
	
