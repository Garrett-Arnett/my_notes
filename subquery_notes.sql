-- subqueries notes

-- query inside of a query
-- can be in SELECT, FROM, or WHERE. typically in WHERE

-- inner query can return single value/column/row or table

-- find the first and last name employeer from the below quere

select  first_name, last_name, salaries.*
from salaries -- pulls everything from salaries table
	join employees -- added in join to pull back name
		using (emp_no)
where salary >
	(select avg(salary) -- must put sub query in parenthesis
	from salaries
	)
;
-- which employees have higher than average salaries? --

use employees;

-- inner query 

select avg(salary) 
from salaries;


-- outer query
select * from salaries;


-- combine

select * 
from salaries 
where salary >
	(select avg(salary) -- must put sub query in parenthesis
	from salaries
	)
;

-- How do i add the average salary to previous query

-- A: A subquery in the select statement

-- 1. inner query: average salary
select avg(salary) from salaries;

-- 2. outer
select  
first_name,
 last_name,
 salary 
from salaries 
	join employees
		using (emp_no)
where salary >
	(select avg(salary) 
	from salaries
	)
;

-- COMBINE--

select  
first_name,
 last_name,
 salary, 
 (select avg(salary) from salaries) as avg_salary
from salaries 
	join employees
		using (emp_no)
where salary >
	(select avg(salary) 
	from salaries
	)
;


-- find ass current department managers and thier birthdays

select * from dept_manager limit 10; -- looking at tables being used
select * from employees limit 10;

 select * 
 from dept_manager
 where to_date > now();
 
 select first_name, last_name, birth_date
 from employees;
 
 select first_name, last_name, birth_date
 from employees 
 where emp_no in -- make sure variables matvch output of the inner query
	( select emp_no 
	from dept_manager
	where to_date > now()
	)	
;


