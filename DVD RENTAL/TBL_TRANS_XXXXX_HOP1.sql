/*this is the hop1 transformation area, where we are going to remove columns in the table 
based on the requirements data*/

create table tbl_trans_actor_hop1
(
actor_id int,
actor_name varchar(70)
); 

create table tbl_trans_address_hop1
(
address_id int,
address	varchar(50),
district varchar(25),
city_id	int,
postal_code	int,
phone bigint
); 

create table tbl_trans_category_hop1
(
category_id	int,
name varchar(15)
); 

create table tbl_trans_city_hop1
(
city_id	int,
city varchar(30),
country_id int
); 

create table tbl_trans_country_hop1
(
country_id int,
country	varchar(30)
); 

create table tbl_trans_customer_hop1
(
customer_id	int,
store_id int,	
customer_name varchar(70),
email varchar(40),	
address_id int,	
active int
); 

create table tbl_trans_film_hop1
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

create table tbl_trans_film_actor_hop1
(
actor_id int,
film_id int
);

create table tbl_trans_film_category_hop1
(
film_id	int,
category_id	int
);

create table tbl_trans_film_text_hop1
(
film_id	int,
title varchar(45),
description varchar(160)
);

create table tbl_trans_inventory_hop1
(
inventory_id int,
film_id	int,
store_id int
);

create table tbl_trans_language_hop1
(
language_id int,
name varchar(20)
);


create table tbl_trans_payment_hop1
(
payment_id int,
customer_id	int,
staff_id int,
rental_id int,
amount decimal(5,2),
payment_date datetime
);


create table tbl_trans_rental_hop1
(
rental_id int,
rental_date	datetime,
inventory_id int,
customer_id	int,
return_date datetime,
staff_id int
);

create table tbl_trans_staff_hop1
(
staff_id int,
first_name varchar(45),
last_name varchar(45),
address_id int,	
email varchar(30),
store_id int,	
active boolean,
username varchar(16),
password varchar(40)
);

create table tbl_trans_store_hop1
(
store_id int,	
manager_staff_id int,	
address_id int
);