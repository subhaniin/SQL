Create table managers(mngr_id int primary key, mngr_name varchar(20));

insert into managers
values
(1,'Ridwarn Mohammad'),
(2,'Swetha Mentu');

select * from managers;

alter table employees
add column mngr_id int;

update employees
set mngr_id = case
when gender = 'M' then 1
when gender =  'F' then 2
else null
end;

select * from employees

select e.*,m.mngr_name from managers m
inner join employees e on
e.mngr_id = m.mngr_id
order by e.gender;