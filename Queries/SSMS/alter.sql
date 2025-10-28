alter table demo_table
drop column ID;

alter table demo_table
add ID int identity(1,1);

select * from demo_table;

insert into demo_table(name,age)
values('aeiou',25);

select * from KYC;