select dept_id, max(salary) from employees group by dept_id order by dept_id;

select e.dept_id,e.emp_name,e.salary 
from employees e
join
	(select dept_id,max(salary) as maxsalary 
	from employees group  by dept_id) as m 
on e.dept_id = m.dept_id and e.salary = m.maxsalary 
order by e.dept_id

select dept_id,emp_name,salary,hire_date from employees e
where e.salary =(select max(salary)from employees  where dept_id = e.dept_id);