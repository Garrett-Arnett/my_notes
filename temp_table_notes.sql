-- temp table notes --

use oneil_2096;

-- create temp table called my numbers
-- with two columns - n and name

create temporary table my_numbers
	(
    n int unsigned not null,
    name varchar(20) not null
    )
;

-- view table that i created
select * from my_numbers;

show tables;

-- insert data

insert into my_numbers(n, name)
values (1,'a'),(2,'b'),(3,'c'),(4,'d'),(5,'e');

-- verify data was inserted
select * from my_numbers;

#update values in temp table
update my_numbers
set name = 'BIG'
where n >=4
;

select * from my_numbers;

-- delet value from temp table

delete from my_numbers
where n = 2
;

-- switch to employees to create new temp table

use employees;

select first_name, last_name, salary, dept_name 
from employees
	join dept_emp de
		using(emp_no)
	join salaries s
		using(emp_no)
	join departments
		using (dept_no)
where de.to_date < now()
	and s.to_date < now()
	and dept_name = 'Customer Service'
;

# create temp table as the query above

create temporary table oneil_2096.curr_employees as
-- save table in my database ^
	(
    select first_name, last_name, salary, dept_name 
from employees
	join dept_emp de
		using(emp_no)
	join salaries s
		using(emp_no)
	join departments
		using (dept_no)
where de.to_date > now()
	and s.to_date > now()
	and dept_name = 'Customer Service'
    )
;

drop table oneil_2096.curr_employees;

create temporary table oneil_2096.curr_employees as
-- save table in my database ^
	(
    select first_name, last_name, salary, dept_name 
from employees
	join dept_emp de
		using(emp_no)
	join salaries s
		using(emp_no)
	join departments
		using (dept_no)
where de.to_date > now()
	and s.to_date > now()
	and dept_name = 'Customer Service'
    )
;
-- select the table from my database in employees
select * from oneil_2096.curr_employees;

use oneil_2096;
show tables;
select * from curr_employees;

-- average salary of current employees
select round(avg(salary),2) as avg_salary from curr_employees;

-- add a new column for avg salary

alter table curr_employees -- alter table table_name
add avg_dept_salary float; -- add column_name data_type

select * from curr_employees;

-- update the average salary
select round(avg(salary),2) from curr_employees;

update curr_employees
set avg_dept_salary = 67285.23;

select * from curr_employees;

select * from my_numbers;
show tables;

-- delete table

drop table curr_employees

select * from curr_employees;
