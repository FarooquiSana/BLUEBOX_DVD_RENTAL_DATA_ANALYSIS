/*this is the hop2 transformation area,where we are going to modify 
the existing columns based on the requirements data */

create table tbl_trans_address_hop2
(
address_id int,
address	varchar(50),
district varchar(25),
city_id	int,
postal_code	int,
phone bigint
); 

create table tbl_trans_customer_hop2
(
customer_id	int,
store_id int,	
customer_name varchar(70),
email varchar(40),	
address_id int,	
active int
); 

create table tbl_trans_film_hop2
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
