--avg
select emp_name, salary,avg(salary)over() from employees;

--dept_avg
select dept_id,avg(salary) from employees group by dept_id order by dept_id;

-->dept_avg
select * from
(select emp_name,dept_id,salary,avg(salary)over(partition by dept_id)
as dept_avg from employees)
where salary>dept_avg:

Select dept_id, Count(*) from Employees
Group by dept_id
Having Count(*)between 5 and 10;

select dept_id,count(*) from employees group by dept_id;