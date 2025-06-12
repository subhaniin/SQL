select avg(salary) from employees;

select * from employees;

select emp_id, salary from employees where salary>(select avg(salary) from employees);

SELECT role, AVG(salary) AS avg_salary
FROM employees
GROUP BY role
HAVING AVG(salary) > 50000;

select * from performance_fy_2025

alter table employees
add column department text;

update employees
set department = 'BPS' where salary < 50000;

select department,avg(salary)from employees group by department having avg(salary)>50000

SELECT department, AVG(salary)
FROM employees
WHERE salary > 30000       -- ✅ allowed
GROUP BY department;

SELECT department, AVG(salary) AS avg_salary
FROM employees
WHERE salary > 30000 -- filters individual rows before grouping
GROUP BY department;
HAVING AVG(salary) > 50000;   -- filters grouped results
