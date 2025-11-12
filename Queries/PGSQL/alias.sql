select emp_name as name from employees;

select e.emp_id,e.emp_name,e.salary,e.dept_id,d.avg_salary,e.salary-d.avg_salary as diff from employees e 
join(select dept_id,avg(salary) as avg_salary
from employees group by dept_id)d
on e.dept_id = d.dept_id
where e.salary > d.avg_salary order by dept_id;