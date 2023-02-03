-- case statement notes --
-- use the chipotle database

USE chipotle;
show tables;

-- grab a preview of table
select * from orders limit 10;
describe orders;

-- grab just the item_name from the orders table
select item_name from orders limit 5;

-- grab true values for any instance in item name where
-- that specific item is a chicken item
select item_name 
from orders 
where item_name	
	like '%chicken%';

-- change the output of cels
select item_name, -- if acts like a function call
IF(item_name like '%chicken%', 1, 0) as chicken_type
-- if ( <truth condition>, <value if case is true>, <value if case is false>
from orders 
limit 25;

-- change the output of that if statement
select if(
Item_name like '%steak%', if(
item_name like '%bowl%','steak_bowl','other_steak_item'), 
 'not_steak') as stake_col
from orders
limit 1000;



-- USE a case statement if we want to throw in some extra conditions in the mix
-- case sattements are like if statements but they are structured differently
-- CASE statements allow for multiple logic checks in a row

-- structure of a case statement:

-- Let's build out our first case:
-- adding an extra layer:
SELECT item_name, quantity,
CASE item_name
	When 'chicken bowl' THEN 'bowl'
    when 'chicken burrito' then 'burrito'
    else 'not chicken that i care about'
END as chicken_items
from orders;

-- Limitations of what i ded above
-- it can only check for direct equivalence

select item_name,
case 
when item_name like '%chicken%' then 'chicken type'
when item_name like '%steak%' then 'steak type'
else 'other thing'
end as 'meat check'
from orders;

use join_example_db;

select * from users;

-- select level names for role_id 

select role_id,
case
	when role_id > 2 then 'high roller'
    when role_id = 1 then 'some role'
    when role_id IS NULL then 'idk'
    else 'will you see this?'
end as 'case results'
from users;

select count(if(role_id = 3, 1, 0)) as role_3 from users;

select (role_id > 2) from users;

-- check out this mess
use employees;

SELECT
    dept_name,
    COUNT(CASE WHEN title = 'Senior Engineer' THEN title ELSE NULL END) AS 'Senior Engineer',
    COUNT(CASE WHEN title = 'Staff' THEN title ELSE NULL END) AS 'Staff',
    COUNT(CASE WHEN title = 'Engineer' THEN title ELSE NULL END) AS 'Engineer',
    COUNT(CASE WHEN title = 'Senior Staff' THEN title ELSE NULL END) AS 'Senior Staff',
    COUNT(CASE WHEN title = 'Assistant Engineer' THEN title ELSE NULL END) AS 'Assistant Engineer',
    COUNT(CASE WHEN title = 'Technique Leader' THEN title ELSE NULL END) AS 'Technique Leader',
    COUNT(CASE WHEN title = 'Manager' THEN title ELSE NULL END) AS 'Manager'
FROM departments
JOIN dept_emp
    ON departments.dept_no = dept_emp.dept_no AND dept_emp.to_date > CURDATE()
JOIN titles
    ON dept_emp.emp_no = titles.emp_no AND titles.to_date > CURDATE()
GROUP BY dept_name
ORDER BY dept_name;