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