create table employee_PD(emp_id int primary key,first_name varchar(25), last_name varchar(25));

insert into employee_PD(emp_id,first_name,last_name)
select emp_id, first_name,last_name from employees;

---------------------------------------------------------------
drop table departments;

create table departments (dept_id serial primary key, dept_name varchar(20));

select * from departments;

insert into departments(dept_name)
select  distinct department from employees order by department;

-------------------------------------------------------------------------
create table team_members(emp_id int,emp_name varchar(25));
create table team_leaders(emp_id int,emp_name varchar(25));