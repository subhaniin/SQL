select min(emp_name) from employees;

select max(emp_name) from employees;

select count(status) from employees;

select status,count(status) from employees group by status;

select email, count(email) from employees group by email having count(email)>1;

select * from employees;

update employees
set email = 'abc.com' where emp_id between 1 and 10;

select * from employees where email = 'abc.com';