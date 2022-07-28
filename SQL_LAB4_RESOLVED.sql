-- THIS IS FOR SQL_LAB4
use sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.

select name as category_name, count(*) as num_films
from category 
join film_category using (category_id)
group by name
order by num_films desc;

-- 2. Display the total amount rung up by each staff member in August of 2005.

select sum(p.amount) as total_amount, last_name, first_name
from payment p
join staff s
on p.staff_id = s.staff_id
where payment_date between ('2005-08-01') and ('2005-08-31')
group by last_name;

-- 3. Which actor has appeared in the most films?

select actor_id, first_name, last_name, count(actor_id) as film_count
from actor join film_actor 
using (actor_id)
group by actor_id
order by film_count desc;

-- 4. Most active customer (the customer that has rented the most number of films)

select customer.*, count(rental_id) as rental_count
from customer join rental using (customer_id)
group by customer_id
order by rental_count desc
limit 1;

-- 5. Display the first and last names, as well as the address, of each staff member.

select first_name, last_name, address
from staff s
join address a
on s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film.

select f.title, count(actor_id) as '#Actors'
from film f
join film_actor fa
using (film_id)
group by f.title;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

select first_name, last_name, sum(p.amount) as 'Total Paid'
from customer c
join payment p
on c.customer_id = p.customer_id
group by first_name, last_name
order by last_name;
