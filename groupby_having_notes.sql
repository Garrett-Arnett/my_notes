USE chipotle;

show tables;

select * from orders;
-- using group by instead of distinct

select distinct item_name from orders where item_name like '%chicken%';

select item_name from orders where item_name like '%chicken%' group by item_name;

-- group by multiple variables

select item_name, quantity from orders where item_name like '%chicken%' group by item_name, quantity order by item_name;

-- aggregate functions -- (total)

select count(item_name) from orders where item_name like '%chicken bowl%';

select item_name, count(item_name) from orders where item_name like '%chicken%' group by item_name;

-- min, max --

select item_name, min(quantity), max(quantity) from orders where item_name like '%chicken%' group by item_name;

-- HAVING --

-- find all orders items that have been ordered over 100 times

select item_name, count(item_name) as count_items
from orders
where item_name like '%chicken%'
group by item_name
having count_items > 100;

