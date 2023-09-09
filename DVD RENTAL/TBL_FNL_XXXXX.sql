/*this is the final area, where we we will have all the cleaned data*/
create table tbl_fnl_actor
(
actor_id int,
actor_name varchar(70) not null
); 

create table tbl_fnl_address
(
address_id int,
address	varchar(50),
district varchar(25),
city_id	int,
postal_code	int,
phone bigint
); 

create table tbl_fnl_customer
(
customer_id	int,
store_id int,	
customer_name varchar(70),
email varchar(40),	
address_id int,	
active int
); 

create table tbl_fnl_film
(
film_id	int,
title varchar(45),	
description	varchar(160),
release_year year,	
language_id	int,
rental_duration	int,
rental_rate	decimal(4,2),
length int,
replacement_cost decimal(5,2),	
rating varchar(30),
special_features varchar(20)
);

create table tbl_fnl_category
(
category_id	int,
name varchar(15)not null
); 

create table tbl_fnl_city
(
city_id	int,
city varchar(30)not null,
country_id int
); 

create table tbl_fnl_country
(
country_id int,
country	varchar(30) not null
); 

create table tbl_fnl_film_actor
(
actor_id int,
film_id int
);

create table tbl_fnl_film_category
(
film_id	int,
category_id	int
);

create table tbl_fnl_film_text
(
film_id	int,
title varchar(45),
description varchar(160)
);

create table tbl_fnl_inventory
(
inventory_id int,
film_id	int,
store_id int
);

create table tbl_fnl_language
(
language_id int,
name varchar(20) not null
);


create table tbl_fnl_payment
(
payment_id int,
customer_id	int,
staff_id int,
rental_id int,
amount decimal(5,2),
payment_date datetime
);


create table tbl_fnl_rental
(
rental_id int,
rental_date	datetime,
inventory_id int,
customer_id	int,
return_date datetime,
staff_id int
);

create table tbl_fnl_staff
(
staff_id int,
first_name varchar(45) not null,
last_name varchar(45)not null,
address_id int,	
email varchar(30),
store_id int,	
active int,
username varchar(16),
password varchar(40)
);

create table tbl_fnl_store
(
store_id int,	
manager_staff_id int,	
address_id int
);

