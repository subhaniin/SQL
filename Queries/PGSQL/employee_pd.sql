create table employee_PD(emp_id int primary key,first_name varchar(25), last_name varchar(25));


insert into employee_PD(emp_id,first_name,last_name)
select emp_id, first_name,last_name from employees;

select e.first_name,ep.first_name from employees e
join employee_pd ep on e.emp_id = ep.emp_id;

alter table employees
drop first_name,
drop last_name;