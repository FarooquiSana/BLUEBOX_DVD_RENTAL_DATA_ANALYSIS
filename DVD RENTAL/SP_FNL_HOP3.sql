CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fnl_hop3`()
begin
    declare source1_table varchar(30);
    declare target1_table varchar(30);
    declare source2_table varchar(30);
    declare target2_table varchar(30);
    declare source3_table varchar(30);
    declare target3_table varchar(30);
	declare source4_table varchar(30);
    declare target4_table varchar(30);
    declare source5_table varchar(30);
    declare target5_table varchar(30);
    declare source6_table varchar(30);
    declare target6_table varchar(30);
	declare source7_table varchar(30);
    declare target7_table varchar(30);
    declare source8_table varchar(30);
    declare target8_table varchar(30);
    declare source9_table varchar(30);
    declare target9_table varchar(30);
	declare source10_table varchar(30);
    declare target10_table varchar(30);
    declare source11_table varchar(30);
    declare target11_table varchar(30);
    declare source12_table varchar(30);
    declare target12_table varchar(30);
	declare source13_table varchar(30);
    declare target13_table varchar(30);
	declare source14_table varchar(30);
    declare target14_table varchar(30);
    declare source15_table varchar(30);
    declare target15_table varchar(30);
    declare source16_table varchar(30);
    declare target16_table varchar(30);
    declare source1_count int;
    declare target1_count int;
	declare source2_count int;
    declare target2_count int;
	declare source3_count int;
    declare target3_count int;
	declare source4_count int;
    declare target4_count int;
	declare source5_count int;
    declare target5_count int;
	declare source6_count int;
    declare target6_count int;
	declare source7_count int;
    declare target7_count int;
	declare source8_count int;
    declare target8_count int;
	declare source9_count int;
    declare target9_count int;
	declare source10_count int;
    declare target10_count int;
	declare source11_count int;
    declare target11_count int;
	declare source12_count int;
    declare target12_count int;
	declare source13_count int;
    declare target13_count int;
	declare source14_count int;
    declare target14_count int;
	declare source15_count int;
    declare target15_count int;
	declare source16_count int;
    declare target16_count int;
    declare process_name varchar(30);
    declare operation_type varchar(50);
    declare log_details varchar(50);
    
    select 'tbl_trans_actor_hop1' into source1_table;
    select 'tbl_fnl_actor' into target1_table;
    set operation_type = 'loading the final actor table';
    set process_name = 'sp_fnl_hop3';
    
    select count(*) into source1_count from tbl_trans_actor_hop1;
    
    insert into tbl_fnl_actor
        select 
            actor_id,
            actor_name
        from
            tbl_trans_actor_hop1;
            
    select count(*) into target1_count from tbl_fnl_actor;
    
    if source1_count <> target1_count then
        set log_details = 'there is a mismatch, need to check the flow';
    else
        set log_details = 'there is no mismatch, data loaded successfully';
    end if;
    
    insert into bluebox_dvd_audit_control 
    (source_name,
    target_name,
    process_name,
    operation_type,
    source_count,
    target_count,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        source1_table,
        target1_table,
        process_name,
        operation_type,
        source1_count,
        target1_count,
        log_details,
        current_user(),
        current_timestamp());


	select 'tbl_trans_address_hop2' into source2_table;
    select 'tbl_fnl_address' into target2_table;
    set operation_type = 'loading the final address table';
    set process_name = 'sp_fnl_hop3';
    
    select count(*) into source2_count from tbl_trans_address_hop2;
    
    insert into tbl_fnl_address
        select 
            address_id,
            address,
            district,
            city_id,
            postal_code,
            phone
        from
            tbl_trans_address_hop2;
            
    select count(*) into target2_count from tbl_fnl_address;
    
    if source2_count <> target2_count then
        set log_details = 'there is a mismatch, need to check the flow';
    else
        set log_details = 'there is no mismatch, data loaded successfully';
    end if;
    
    insert into bluebox_dvd_audit_control  
    (source_name,
    target_name,
    process_name,
    operation_type,
    source_count,
    target_count,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        source2_table,
        target2_table,
        process_name,
        operation_type,
        source2_count,
        target2_count,
        log_details,
        current_user(),
        current_timestamp());
        
        
        
	select 'tbl_trans_customer_hop2' into source3_table;
    select 'tbl_fnl_customer' into target3_table;
    set operation_type = 'loading the final locations table';
    set process_name = 'sp_fnl_hop3';
    
    select count(*) into source3_count from tbl_trans_customer_hop2;
    
    insert into tbl_fnl_customer
        select 
            customer_id,
            store_id,	
            customer_name,
            email,	
            address_id,	
            active
        from
            tbl_trans_customer_hop2;
            
    select count(*) into target3_count from tbl_fnl_customer;
    
    if source3_count <> target3_count then
        set log_details = 'there is a mismatch, need to check the flow';
    else
        set log_details = 'there is no mismatch, data loaded successfully';
    end if;
    
    insert into bluebox_dvd_audit_control 
    (source_name,
    target_name,
    process_name,
    operation_type,
    source_count,
    target_count,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        source3_table,
        target3_table,
        process_name,
        operation_type,
        source3_count,
        target3_count,
        log_details,
        current_user(),
        current_timestamp());
        
        
        
	select 'tbl_trans_film_hop2' into source4_table;
    select 'tbl_fnl_film' into target4_table;
    set operation_type = 'loading the final countries table';
    set process_name = 'sp_fnl_hop3';
    
    select count(*) into source4_count from tbl_trans_film_hop2;
    
    insert into tbl_fnl_film
        select 
            film_id,
            title,	
            description,
            release_year,	
            language_id,
            rental_duration,
            rental_rate,
            length,
            replacement_cost,	
            rating,
            special_features
        from
            tbl_trans_film_hop2;
            
    select count(*) into target4_count from tbl_fnl_film;
    
    if source4_count <> target4_count then
        set log_details = 'there is a mismatch, need to check the flow';
    else
        set log_details = 'there is no mismatch, data loaded successfully';
    end if;
    
    insert into bluebox_dvd_audit_control 
    (source_name,
    target_name,
    process_name,
    operation_type,
    source_count,
    target_count,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        source4_table,
        target4_table,
        process_name,
        operation_type,
        source4_count,
        target4_count,
        log_details,
        current_user(),
        current_timestamp());
        
	select 'tbl_trans_category_hop1' into source5_table;
    select 'tbl_fnl_category' into target5_table;
    set operation_type = 'loading the final category table';
    set process_name = 'sp_fnl_hop3';
    
    select count(*) into source5_count from tbl_trans_category_hop1;
    
    insert into tbl_fnl_category
        select 
            category_id,
            name 
        from
            tbl_trans_category_hop1;
            
    select count(*) into target5_count from tbl_fnl_category;
    
    if source5_count <> target5_count then
        set log_details = 'there is a mismatch, need to check the flow';
    else
        set log_details = 'there is no mismatch, data loaded successfully';
    end if;
    
    insert into bluebox_dvd_audit_control 
    (source_name,
    target_name,
    process_name,
    operation_type,
    source_count,
    target_count,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        source5_table,
        target5_table,
        process_name,
        operation_type,
        source5_count,
        target5_count,
        log_details,
        current_user(),
        current_timestamp());
        
	select 'tbl_trans_city_hop1' into source6_table;
    select 'tbl_fnl_city' into target6_table;
    set operation_type = 'loading the final city table';
    set process_name = 'sp_fnl_hop3';
    
    select count(*) into source6_count from tbl_trans_city_hop1;
    
    insert into tbl_fnl_city
        select 
            city_id,
            city,
            country_id
        from
            tbl_trans_city_hop1;
            
    select count(*) into target6_count from tbl_fnl_city;
    
    if source6_count <> target6_count then
        set log_details = 'there is a mismatch, need to check the flow';
    else
        set log_details = 'there is no mismatch, data loaded successfully';
    end if;
    
    insert into bluebox_dvd_audit_control 
    (source_name,
    target_name,
    process_name,
    operation_type,
    source_count,
    target_count,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        source6_table,
        target6_table,
        process_name,
        operation_type,
        source6_count,
        target6_count,
        log_details,
        current_user(),
        current_timestamp());
        
	select 'tbl_trans_country_hop1' into source7_table;
    select 'tbl_fnl_country' into target7_table;
    set operation_type = 'loading the final job history table';
    set process_name = 'sp_fnl_hop3';
    
    select count(*) into source7_count from tbl_trans_country_hop1;
    
    insert into tbl_fnl_country
        select 
            country_id,
            country	
        from
            tbl_trans_country_hop1;
            
    select count(*) into target7_count from tbl_fnl_country;
    
    if source7_count <> target7_count then
        set log_details = 'there is a mismatch, need to check the flow';
    else
        set log_details = 'there is no mismatch, data loaded successfully';
    end if;
    
    insert into bluebox_dvd_audit_control 
    (source_name,
    target_name,
    process_name,
    operation_type,
    source_count,
    target_count,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        source7_table,
        target7_table,
        process_name,
        operation_type,
        source7_count,
        target7_count,
        log_details,
        current_user(),
        current_timestamp());
		
	select 'tbl_trans_film_actor_hop1' into source8_table;
    select 'tbl_fnl_film_actor' into target8_table;
    set operation_type = 'loading the final film_actor table';
    set process_name = 'sp_fnl_hop3';
    
    select count(*) into source8_count from tbl_trans_film_actor_hop1;
    
    insert into tbl_fnl_film_actor
        select 
            actor_id,
            film_id
        from
            tbl_trans_film_actor_hop1;	
		
	select count(*) into target8_count from tbl_fnl_film_actor;
    
    if source8_count <> target8_count then
        set log_details = 'there is a mismatch, need to check the flow';
    else
        set log_details = 'there is no mismatch, data loaded successfully';
    end if;
    
    insert into bluebox_dvd_audit_control 
    (source_name,
    target_name,
    process_name,
    operation_type,
    source_count,
    target_count,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        source8_table,
        target8_table,
        process_name,
        operation_type,
        source8_count,
        target8_count,
        log_details,
        current_user(),
        current_timestamp());	
	
	select 'tbl_trans_film_category_hop1' into source9_table;
    select 'tbl_fnl_film_category' into target9_table;
    set operation_type = 'loading the final film_category table';
    set process_name = 'sp_fnl_hop3';
    
    select count(*) into source9_count from tbl_trans_film_category_hop1;
    
    insert into tbl_fnl_film_category
        select 
		    film_id,
            category_id  
        from
            tbl_trans_film_category_hop1;	
		
	select count(*) into target9_count from tbl_fnl_film_category;
    
    if source9_count <> target9_count then
        set log_details = 'there is a mismatch, need to check the flow';
    else
        set log_details = 'there is no mismatch, data loaded successfully';
    end if;
    
    insert into bluebox_dvd_audit_control 
    (source_name,
    target_name,
    process_name,
    operation_type,
    source_count,
    target_count,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        source9_table,
        target9_table,
        process_name,
        operation_type,
        source9_count,
        target9_count,
        log_details,
        current_user(),
        current_timestamp());
	
	select 'tbl_trans_film_text_hop1' into source10_table;
    select 'tbl_fnl_film_text' into target10_table;
    set operation_type = 'loading the final film_text table';
    set process_name = 'sp_fnl_hop3';
    
    select count(*) into source10_count from tbl_trans_film_text_hop1;
    
    insert into tbl_fnl_film_text
        select 
            film_id,
            title,
            description	
        from
            tbl_trans_film_text_hop1;	
		
	select count(*) into target10_count from tbl_fnl_film_text;
    
    if source10_count <> target10_count then
        set log_details = 'there is a mismatch, need to check the flow';
    else
        set log_details = 'there is no mismatch, data loaded successfully';
    end if;
    
    insert into bluebox_dvd_audit_control 
    (source_name,
    target_name,
    process_name,
    operation_type,
    source_count,
    target_count,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        source10_table,
        target10_table,
        process_name,
        operation_type,
        source10_count,
        target10_count,
        log_details,
        current_user(),
        current_timestamp());
		
	select 'tbl_trans_inventory_hop1' into source11_table;
    select 'tbl_fnl_inventory' into target11_table;
    set operation_type = 'loading the final inventory table';
    set process_name = 'sp_fnl_hop3';
    
    select count(*) into source11_count from tbl_trans_inventory_hop1;
    
    insert into tbl_fnl_inventory
        select 
            inventory_id,
            film_id,
            store_id
        from
            tbl_trans_inventory_hop1;	
		
	select count(*) into target11_count from tbl_fnl_inventory;
    
    if source11_count <> target11_count then
        set log_details = 'there is a mismatch, need to check the flow';
    else
        set log_details = 'there is no mismatch, data loaded successfully';
    end if;
    
    insert into bluebox_dvd_audit_control 
    (source_name,
    target_name,
    process_name,
    operation_type,
    source_count,
    target_count,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        source11_table,
        target11_table,
        process_name,
        operation_type,
        source11_count,
        target11_count,
        log_details,
        current_user(),
        current_timestamp());
	
    select 'tbl_trans_language_hop1' into source12_table;
    select 'tbl_fnl_language' into target12_table;
    set operation_type = 'loading the final language table';
    set process_name = 'sp_fnl_hop3';
    
    select count(*) into source12_count from tbl_trans_language_hop1;
    
    insert into tbl_fnl_language
        select 
            language_id,
            name
        from
            tbl_trans_language_hop1;	
		
	select count(*) into target12_count from tbl_fnl_language;
    
    if source12_count <> target12_count then
        set log_details = 'there is a mismatch, need to check the flow';
    else
        set log_details = 'there is no mismatch, data loaded successfully';
    end if;
    
    insert into bluebox_dvd_audit_control 
    (source_name,
    target_name,
    process_name,
    operation_type,
    source_count,
    target_count,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        source12_table,
        target12_table,
        process_name,
        operation_type,
        source12_count,
        target12_count,
        log_details,
        current_user(),
        current_timestamp());	
	
    select 'tbl_trans_payment_hop1' into source13_table;
    select 'tbl_fnl_payment' into target13_table;
    set operation_type = 'loading the final payment table';
    set process_name = 'sp_fnl_hop3';
    
    select count(*) into source13_count from tbl_trans_payment_hop1;
    
    insert into tbl_fnl_payment
        select 
            payment_id,
            customer_id,
            staff_id,
            rental_id,
            amount,
            payment_date
        from
            tbl_trans_payment_hop1;	
		
	select count(*) into target13_count from tbl_fnl_payment;
    
    if source13_count <> target13_count then
        set log_details = 'there is a mismatch, need to check the flow';
    else
        set log_details = 'there is no mismatch, data loaded successfully';
    end if;
    
    insert into bluebox_dvd_audit_control 
    (source_name,
    target_name,
    process_name,
    operation_type,
    source_count,
    target_count,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        source13_table,
        target13_table,
        process_name,
        operation_type,
        source13_count,
        target13_count,
        log_details,
        current_user(),
        current_timestamp());	
	
	select 'tbl_trans_rental_hop1' into source14_table;
    select 'tbl_fnl_rental' into target14_table;
    set operation_type = 'loading the final rental table';
    set process_name = 'sp_fnl_hop3';
    
    select count(*) into source14_count from tbl_trans_rental_hop1;
    
    insert into tbl_fnl_rental
        select 
            rental_id,
            rental_date,
            inventory_id,
            customer_id,
            return_date,
            staff_id
        from
            tbl_trans_rental_hop1;	
		
	select count(*) into target14_count from tbl_fnl_rental;
    
    if source14_count <> target14_count then
        set log_details = 'there is a mismatch, need to check the flow';
    else
        set log_details = 'there is no mismatch, data loaded successfully';
    end if;
    
    insert into bluebox_dvd_audit_control 
    (source_name,
    target_name,
    process_name,
    operation_type,
    source_count,
    target_count,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        source14_table,
        target14_table,
        process_name,
        operation_type,
        source14_count,
        target14_count,
        log_details,
        current_user(),
        current_timestamp());
	
	select 'tbl_trans_staff_hop1' into source15_table;
    select 'tbl_fnl_staff' into target15_table;
    set operation_type = 'loading the final staff table';
    set process_name = 'sp_fnl_hop3';
    
    select count(*) into source15_count from tbl_trans_staff_hop1;
    
    insert into tbl_fnl_staff
        select 
            staff_id,
            first_name,
            last_name,
            address_id,	
            email,
            store_id,	
            active,
            username,
            password 
        from
            tbl_trans_staff_hop1;	
		
	select count(*) into target15_count from tbl_fnl_staff;
    
    if source15_count <> target15_count then
        set log_details = 'there is a mismatch, need to check the flow';
    else
        set log_details = 'there is no mismatch, data loaded successfully';
    end if;
    
    insert into bluebox_dvd_audit_control 
    (source_name,
    target_name,
    process_name,
    operation_type,
    source_count,
    target_count,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        source15_table,
        target15_table,
        process_name,
        operation_type,
        source15_count,
        target15_count,
        log_details,
        current_user(),
        current_timestamp());
	
	select 'tbl_trans_store_hop1' into source16_table;
    select 'tbl_fnl_store' into target16_table;
    set operation_type = 'loading the final store table';
    set process_name = 'sp_fnl_hop3';
    
    select count(*) into source16_count from tbl_trans_store_hop1;
    
    insert into tbl_fnl_store
        select 
            store_id,	
            manager_staff_id,	
            address_id
        from
            tbl_trans_store_hop1;	
		
	select count(*) into target16_count from tbl_fnl_store;
    
    if source16_count <> target16_count then
        set log_details = 'there is a mismatch, need to check the flow';
    else
        set log_details = 'there is no mismatch, data loaded successfully';
    end if;
    
    insert into bluebox_dvd_audit_control 
    (source_name,
    target_name,
    process_name,
    operation_type,
    source_count,
    target_count,
    log_details,
    operated_by,
	operation_date)
    values 
        (
        source16_table,
        target16_table,
        process_name,
        operation_type,
        source16_count,
        target16_count,
        log_details,
        current_user(),
        current_timestamp());
	
			
		
end