begin;
truncate table employees;

rollback;

select * from employees where emp_name = 'test';

begin;
delete from employees where emp_name = 'test';

rollback;