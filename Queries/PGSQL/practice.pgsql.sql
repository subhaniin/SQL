select * from demo_view;

select * from employees order by emp_id;

select avg(salary) from employees;

select emp_id, salary from employees where salary>(select avg(salary) from employees);

select dept_id,max(salary) from employees group by dept_id;

select emp_name,dept_id,salary from employees e
where salary=(select max(salary) from employees where e.dept_id=dept_id);

SELECT role, AVG(salary) AS avg_salary
FROM employees
GROUP BY role
HAVING AVG(salary) > 50000;


select * from performance_fy_2025

alter table employees
add column dept_id int;

update employees
set dept_id = 'BPS' where salary < 50000;

select dept_id,avg(salary)from employees group by dept_id having avg(salary)>50000;

SELECT dept_id, AVG(salary)
FROM employees
WHERE salary > 90000       -- ✅ allowed
GROUP BY dept_id;

SELECT dept_id, AVG(salary) AS avg_salary
FROM employees
WHERE salary > 30000 -- filters individual rows before grouping
GROUP BY dept_id
HAVING AVG(salary) > 50000;   -- filters grouped results

select e.dept_id,d.dept_name,avg(e.salary) from employees e
join departments d on e.dept_id = d.dept_id
group by e.dept_id, d.dept_name order by avg(e.salary);

select avg(salary) from employees where dept_id =2;

update employees
set salary = salary +20000 where dept_id = 1;


select e.dept_id,d.dept_name, sum(e.salary) from employees e join departments d on e.dept_id = d.dept_id
group by e.dept_id, d.dept_name order by dept_id;

select emp_id, emp_name, salary,
rank() over (order by salary desc) as salary_rank
from employees;

select * from employees where role_ = 'Manager';

select * from managers;

update employees
set role_  = 'Team Lead' where emp_id between 3 and 10;

insert into team_leaders(emp_id,emp_name)
select emp_id,emp_name from employees where role_ = 'Team Lead';

select * from team_leaders;
