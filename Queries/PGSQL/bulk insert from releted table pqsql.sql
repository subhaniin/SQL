select * from employees;

create table associates(emp_id int primary key, emp_name varchar(30),salary int,age int,gender character(1));

select * from associates;

insert into associates
(emp_id,emp_name,salary,age,gender)
select emp_id,emp_name,salary,age,gender from employees where mngr_id is not null;

select * from associates;

alter table associates add column role varchar(15);

update associates a
set role = e.role
from employees e
where e.emp_id = a.emp_id;