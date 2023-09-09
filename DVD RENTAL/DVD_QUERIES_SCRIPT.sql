/*DVD RENTAL SQL QUERIES*/

/*What is the most popular top category?*/

select c.name as category_name, count(*) as rental_count
from tbl_fnl_category c
join tbl_fnl_film_category fc on c.category_id = fc.category_id
join tbl_fnl_film f on fc.film_id = f.film_id
join tbl_fnl_inventory i on f.film_id = i.film_id
join tbl_fnl_rental r on i.inventory_id = r.inventory_id
group by c.name
order by rental_count desc
limit 1;

 
/*What is the 4th most popular top category?*/

select c.name as category_name, count(*) as rental_count
from tbl_fnl_category c
join tbl_fnl_film_category fc on c.category_id = fc.category_id
join tbl_fnl_film f on fc.film_id = f.film_id
join tbl_fnl_inventory i on f.film_id = i.film_id
join tbl_fnl_rental r on i.inventory_id = r.inventory_id
group by c.name
order by rental_count desc
limit 1 offset 3;

 
/*Which movie category will you recommend to Betty White? Support your answer with the SQL query*/

select c.name as recommended_category
from tbl_fnl_category c
join tbl_fnl_film_category fc on c.category_id = fc.category_id
join (
    select film_id, count(rental_id) as rental_count
    from tbl_fnl_inventory i
    join tbl_fnl_rental r on i.inventory_id = r.inventory_id
    group by film_id
    order by rental_count desc
    limit 1
) as most_rented_film on fc.film_id = most_rented_film.film_id;

 
/*Which actor was the most popular for all customers?  Support your answer with the SQL query*/

select a.actor_id, a.actor_name, count(r.rental_id) as rental_count
from tbl_fnl_actor a
join tbl_fnl_film_actor fa on a.actor_id = fa.actor_id
join tbl_fnl_film f on fa.film_id = f.film_id
join tbl_fnl_inventory i on f.film_id = i.film_id
join tbl_fnl_rental r on i.inventory_id = r.inventory_id
group by a.actor_id, actor_name
order by rental_count desc
limit 1;

/*What is the total revenue we got for the year 2005 the adult movies rented from the store id 1 . Support your answer with the SQL query*/

select sum(p.amount) as total_revenue
from tbl_fnl_payment p
join tbl_fnl_rental r on p.rental_id = r.rental_id
join tbl_fnl_inventory i on r.inventory_id = i.inventory_id
join tbl_fnl_film f on i.film_id = f.film_id
where i.store_id = 1
and year(r.rental_date) = 2005
and f.rating = 'adults only';

 


