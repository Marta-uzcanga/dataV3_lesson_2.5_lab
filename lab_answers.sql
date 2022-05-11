-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT first_name = 'Scarlett' from  sakila.actor; 

-- 2. How many films (movies) are available for rent and how many films have been rented?
-- available for rent
SELECT inventory_id FROM sakila.rental
WHERE rental_date < return_date;

-- not available for rent
SELECT inventory_id FROM sakila.rental
WHERE return_date < rental_date;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) FROM sakila.film;
SELECT MIN(length) FROM sakila.film;
SELECT avg(length) FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT time(AVG(length)) as 'average duration'  FROM sakila.film;

-- 5. How many distinct (different) actors' last names are there?
SELECT count(distinct(last_name)) as Number_of_Unique_last_names FROM sakila.actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT datediff(MAX(payment_date), MIN(payment_date)) as 'days since first operation' FROM sakila.payment;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
select* from sakila.rental;

select weekday(rental_date) as 'weekday',  month(rental_date) as 'month'
from sakila.rental;

-- 8 Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update, 
CASE
when weekday(rental_date) = 0 OR  1 OR 2 OR 3 OR 4 then 'weekday'
when weekday(rental_date) = 5 OR 6 then 'weekend'
END AS 'day_type'
from sakila.rental;

--  9 Get release years.
select release_year from sakila.film; 

-- 10 Get all films with ARMAGEDDON in the title.
SELECT * from sakila.film
where title like '%ARMAGEDDON%'; 

-- 11 Get all films which title ends with APOLLO.
SELECT * FROM sakila.film
WHERE (right(title,6) = 'APOLLO'); 

-- 12 Get 10 the longest films.
SELECT * FROM sakila.film
ORDER BY length DESC
LIMIT 20;

-- 13 How many films include Behind the Scenes content?
SELECT * from sakila.film
where special_features like '%Behind the Scenes%'; 
