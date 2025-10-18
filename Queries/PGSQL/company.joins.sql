select e.emp_id,e.emp_name, d.dept_id from employees e 
join departments d on e.dept_id=d.dept_id;

select e.emp_name,ep.first_name,ep.last_name from employees e
join employee_pd ep on e.emp_id = ep.emp_id;