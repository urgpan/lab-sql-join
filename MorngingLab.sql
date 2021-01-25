use sakila;

select * from film;

-- 1
select count(film_id), category_id from film_category
group by category_id;

select c.category_id, c.name as Category, count(f.film_id) as Movies from film as f
join film_category as fc
on f.film_id= fc.film_id
join category as c
on c.category_id = fc.category_id
group by category;


-- 2
select s.first_name, s.last_name, a.address from staff as s
join address as a
on s.address_id = a.address_id;

-- 3
select * from rental;

	-- different returning
	-- my solution
	select count(r.rental_id), r.staff_id, sum(p.amount) from rental as r
	join payment as p
	on r.rental_id = p.rental_id
	where payment_date regexp '2005-08-'
	group by r.staff_id;

	-- group solution 
	select s.staff_id, s.first_name, s.last_name, sum(p.amount) as Amount from staff as s
	Join payment as p
	on s.staff_id = p.staff_id
	where payment_date regexp '2005-08-'
	group by s.staff_id;

-- 4
select * from film_actor;

	select f.title, count(actor_id) from film as f
	join film_actor as fa
	on f.film_id = fa.film_id
	group by title;

-- 5 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

	select p.customer_id, c.last_name , sum(p.amount) as paid from payment as p
	join customer as c
	on p.customer_id = c.customer_id
    group by p.customer_id
    order by c.last_name;
