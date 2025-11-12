select e.emp_id,e.emp_name, d.dept_id from employees e 
join departments d on e.dept_id=d.dept_id;

select e.emp_name,ep.first_name,ep.last_name from employees e
join employee_pd ep on e.emp_id = ep.emp_id;

select e.dept_id,d.dept_name,avg(e.salary) from employees e
join departments d on e.dept_id = d.dept_id
group by e.dept_id, d.dept_name order by avg(e.salary);

select * from employees order by emp_id;

ALTER TABLE employees
ADD CONSTRAINT status_check CHECK (LOWER(status) IN ('active', 'inactive'));

alter table employees
add constraint hire_date_check check(hire_date>='01-01-2000');

SELECT column_name, data_type, column_default 
FROM information_schema.columns
WHERE table_name = 'employees';

SELECT setval('employees_emp_id_seq', (SELECT MAX(emp_id) FROM employees));

select e.emp_id,e.emp_name,e.salary,e.dept_id,d.avg_salary,e.salary-d.avg_salary as diff from employees e 
join(select dept_id,avg(salary) as avg_salary
from employees group by dept_id)d
on e.dept_id = d.dept_id
where e.salary > d.avg_salary order by dept_id;


