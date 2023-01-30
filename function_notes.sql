-- FUNCTIONS
-- fromat: name_of_function(input)

USE albums_db;
show tables;

-- count function
SELECT count(*) from albums;

-- numerical functions: min, max, avg, round round(2) {2 decimals}

select min(release_date) as min_release_date, max(release_date), round(avg(release_date),1) from albums; -- chained 2 functions

-- string functions

-- CONCAT combines expressions concat(e1,e2)

SELECT concat('Hello', 'world') as hello_world from albums;

select concat('my favorite artists is ', artist, '!') from albums;

-- SUBSTRING(string, start, legnth)

select substr('Hello oneil class', 7, 5); -- oneil

select substr('Hello oneil class', 7); -- gives everythign after 7 characters

select substr(release_date, 3, 2), release_date from albums;
select substr(release_date, -2), release_date from albums; -- you can send negative values

select substr('123-45-6789', -4); -- last 4 of a social

-- case conversion

select upper(artist), artist from albums;
select lower(artist), artist from albums;

select upper(artist), lower(artist), artist from albums;

-- replace
-- format: REPLACE(string, from_string, new_string)
select replace('Hello oneil class!', 'oneil','O\'Neil');

use albums_db;
select * from albums;

select genre, replace(genre, 'rock', '***ROCK***') as genre_rocks from albums;

-- time and date functions

select now();

select current_date();

select curdate();

select curtime();

-- find database

select database();

select unix_timestamp();
-- change time zone
select now(), convert_tz(now(),'+00:00','-06:00');

-- CASTING: change datatype of variable
-- format: CAST(value AS)

select 1 + '2'; -- generally don't need to cast datatypes in mysql

select month('2023-01-02');

select 1 + cast('2' as unsigned);

