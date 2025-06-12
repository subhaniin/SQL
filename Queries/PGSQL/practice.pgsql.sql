select avg(salary) from employees;

select emp_id, salary from employees where salary>(select avg(salary) from employees);