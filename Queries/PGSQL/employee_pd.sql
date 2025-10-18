create table employee_PD(emp_id int primary key,first_name varchar(25), last_name varchar(25));


insert into employee_PD(emp_id,first_name,last_name)
select emp_id, first_name,last_name from employees;



alter table employees
drop first_name,
drop last_name;