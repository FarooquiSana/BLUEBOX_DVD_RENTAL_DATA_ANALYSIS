/*this is the staging area, where we are going to dump all the data coming from the csv source*/

create table tbl_stg_actor
(
actor_id int,
first_name varchar(45),
last_name varchar(45),
last_update date
); 

create table tbl_stg_address
(
address_id int,
address	varchar (50),
address2 varchar(45),
district varchar(25),
city_id	int,
postal_code	int,
phone bigint,
last_update date
); 

create table tbl_stg_category
(
category_id	int,
name varchar(15),	
last_update date
); 

create table tbl_stg_city
(
city_id	int,
city varchar(30),
country_id int,
last_update date
); 

create table tbl_stg_country
(
country_id int,
country	varchar(30),
last_update date
); 

create table tbl_stg_customer
(
customer_id	int,
store_id int,	
first_name varchar(45),
last_name varchar(45),
email varchar(40),	
address_id int,	
active int,
create_date	date,
last_update date
); 

create table tbl_stg_film
(
film_id	int,
title varchar(45),	
description	varchar(160),
release_year year,	
language_id	int,
original_language_id varchar(4),
rental_duration	int,
rental_rate	decimal(4,2),
length int,
replacement_cost decimal(5,2),	
rating varchar(30),
special_features varchar(20),	
last_update date
);

create table tbl_stg_film_actor
(
actor_id int,
film_id int,
last_update date
);

create table tbl_stg_film_category
(
film_id	int,
category_id	int,
last_update date
);

create table tbl_stg_film_text
(
film_id	int,
title varchar(45),
description varchar(160)
);

create table tbl_stg_inventory
(
inventory_id int,
film_id	int,
store_id int,
last_update date
);

create table tbl_stg_language
(
language_id int,
name varchar(20),
last_update date
);


create table tbl_stg_payment
(
payment_id int,
customer_id	int,
staff_id int,
rental_id int,
amount decimal(5,2),
payment_date date,
last_update date
);


create table tbl_stg_rental
(
rental_id int,
rental_date	date,
inventory_id int,
customer_id	int,
return_date date,
staff_id int,
last_update date
);

create table tbl_stg_staff
(
staff_id int,
first_name varchar(45),
last_name varchar(45),
address_id int,	
email varchar(30),
store_id int,	
active int,
username varchar(16),
password varchar(40),
last_update date
);

create table tbl_stg_store
(
store_id int,	
manager_staff_id int,	
address_id int,
last_update date
);
