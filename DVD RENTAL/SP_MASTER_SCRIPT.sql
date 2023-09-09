CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_master_script`(in step_type varchar(50), out output varchar(50))
begin

if step_type = 'sp_create_tables' then
        call sp_create_tables();
        set output = 'sp_create_table ran successfully';
elseif step_type = 'sp_trans_hop1' then
		call sp_trans_hop1();
        set output = 'sp_trans_hop1 ran successfully';
elseif step_type = 'sp_trans_hop2' then 
		call sp_trans_hop2();
        set output = 'sp_trans_hop2 ran successfully';
elseif step_type = 'sp_fnl_hop3' then
		call sp_fnl_hop3();
        set output = 'sp_fnl_hop3 ran successfully';
elseif step_type = 'sp_constraint_enable' then
		call sp_constraint_enable();
        set output = 'sp_constraint_enable ran successfully';
else  set output = 'enter the valid option';   
end if;
    
end