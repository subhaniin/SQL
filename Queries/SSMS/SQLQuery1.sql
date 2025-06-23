create table demo_table(ID int primary key,Name Varchar(30));

insert into demo_table (ID,Name)
values
(2, 'Ansar Shaik'),
(3, 'Alikhan Mohammad'),
(4, 'Ayesha Mohammad');

select * from demo_table;

alter table demo_table
add age int;

update demo_table
set age = 22 where age is null;

alter table demo_table
add first_name varchar(20), last_name varchar(20);

alter table demo_table
drop column last_name;

alter table demo_table
add address varchar(100);

update demo_table
set address = '2-95, 1st street, rayudupalem, kakinada rural, kakinada district, 533006, Andhra Pradesh, India';

EXEC sp_rename 'demo_table', 'KYC';

select top 2 * from KYC;