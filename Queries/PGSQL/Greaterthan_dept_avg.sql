select * from
(select emp_name,dept_id,salary, avg(salary) over(partition by dept_id) as avg from employees) 
where salary>avg;

select 
	e.emp_name,
	e.dept_id,
	e.salary,
	d.dept_avg 
from employees e
join(
	select dept_id,avg(salary)as dept_avg 
	from employees 
	group by dept_id 
)d
on e.dept_id = d.dept_id
where e.salary > d.dept_avg;


SELECT emp_name, dept_id, salary
FROM employees;
--QUALIFY salary > AVG(salary) OVER (PARTITION BY dept_id); qualify only works Snowflake, BigQuer, Teradat, Redshift (partial)
select * 
from(
	select
		e.emp_name,e.salary,e.dept_id,d.dept_name,avg(e.salary) over(partition by e.dept_id) as dept_avg 
	from 
		employees e
	join 
	departments d on e.dept_id = d.dept_id)
where 
	salary>dept_avg;
--------------------------------------------------------	
select * 
from(
	select e.dept_id,d.dept_name,e.salary,
	dense_rank()over(partition by e.dept_id order by e.salary desc) 
	as salary_rank,e.hire_date,avg(e.salary) over (partition by e.dept_id) as dept_avg from employees e
	join departments d
	on e.dept_id = d.dept_id) 
where salary_rank <3 and hire_date>'2021-01-01' and dept_avg >6000
union all
select 
	NULL AS dept_id,
    'TOTAL' AS dept_name,
    SUM(salary) AS salary,
    NULL AS salary_rank,
    NULL AS hire_date,
    NULL AS dept_avg
from employees;
--------------------------------------------------------
select * from employees where hire_date > '2010-01-01'