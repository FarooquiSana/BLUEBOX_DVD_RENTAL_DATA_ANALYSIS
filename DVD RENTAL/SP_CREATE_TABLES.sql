CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_tables`()
begin

/*declaring the variables*/

declare table_count int;
declare operation_type varchar(50);
declare log_details varchar(50);
declare process_name varchar(30);
set operation_type = 'creating the table for all the layers';
set process_name = 'sp_create_tables';

    
/*this is the audit table where we will capture all the operation and details for auditing*/
create table bluebox_dvd_audit_control
(op_id int primary key auto_increment,  
source_name varchar(30),
target_name varchar(30),
process_name varchar(30),
operation_type varchar(50),
source_count int,
target_count int,
log_details varchar(50),
operated_by varchar(20),
operation_date date);

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


select count(*) into table_count from information_schema.tables where table_schema='bluebox_dvd';

if table_count = 52 then
        set log_details = 'all the tables are created successfully';
else
		set log_details = 'there is no mismatch in the number of tables';
end if;


insert into bluebox_dvd_audit_control 
    (
    process_name,
    operation_type,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        process_name,
        operation_type,
        log_details,
        current_user(),
        current_date());

end