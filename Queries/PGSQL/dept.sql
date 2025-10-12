drop table departments;

create table departments (dept_id serial primary key, dept_name varchar(20));

select * from departments;

insert into departments(dept_name)
select  distinct department from employees order by department;