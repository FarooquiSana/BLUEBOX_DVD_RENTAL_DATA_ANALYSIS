CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_trans_hop2`()
begin
    declare source1_table varchar(30);
    declare target1_table varchar(30);
	declare source2_table varchar(30);
    declare target2_table varchar(30);
    declare source3_table varchar(30);
    declare target3_table varchar(30);
	declare process_name varchar(30);
	declare source1_count int;
    declare target1_count int;
	declare source2_count int;
    declare target2_count int;
	declare source3_count int;
    declare target3_count int;
    declare operation_type varchar(50);
    declare log_details varchar(50);
    
    select 'tbl_trans_address_hop1' into source1_table;
    select 'tbl_trans_address_hop2' into target1_table;
    set operation_type = 'modifying the existing column and values';
    set process_name = 'sp_trans_hop2';
    
    select count(*) into source1_count from tbl_trans_address_hop1;
    
    insert into tbl_trans_address_hop2
        select 
            address_id,
            address,
            district,
            city_id,  
            ifnull(postal_code,0),
            ifnull(phone,0000000000)
        from
            tbl_trans_address_hop1;
            
    select count(*) into target1_count from tbl_trans_address_hop2;
    
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

    select 'tbl_trans_customer_hop1' into source2_table;
    select 'tbl_trans_customer_hop2' into target2_table;
    set operation_type = 'modifying the existing column and values';
    set process_name = 'sp_trans_hop2';
    
    select count(*) into source2_count from tbl_trans_customer_hop1;
    
    insert into tbl_trans_customer_hop2
        select 
         customer_id,
         store_id,	
         customer_name,
         concat(lower(substring_index(email, '@', 1)), '@blueboxdvd.com') as email,	
         address_id,	
         active
        from
            tbl_trans_customer_hop1;
            
    select count(*) into target2_count from tbl_trans_customer_hop2;
    
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

    select 'tbl_trans_film_hop1' into source3_table;
    select 'tbl_trans_film_hop2' into target3_table;
    set operation_type = 'modifying the existing column and values';
    set process_name = 'sp_trans_hop2';
    
    select count(*) into source3_count from tbl_trans_film_hop1;
    
    insert into tbl_trans_film_hop2
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
            tbl_trans_film_hop1;
			
update tbl_trans_film_hop2
set rating = 'general audience'
where rating='g';

update tbl_trans_film_hop2
set rating = 'parental guidance'
where rating='pg';

update tbl_trans_film_hop2
set rating = 'parents strongly cautioned'
where rating='pg-13';

update tbl_trans_film_hop2
set rating = 'restricted'
where rating='r';

update tbl_trans_film_hop2
set rating = 'adults only'
where rating='nc-17';
            
    select count(*) into target3_count from tbl_trans_film_hop2;
    
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


end