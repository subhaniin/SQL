CREATE or replace VIEW employee_name AS
SELECT
  e.emp_name,
  ep.first_name,
  ep.last_name
FROM
  employees e
  JOIN employee_pd ep ON e.emp_id = ep.emp_id;


SELECT definition
FROM pg_views
WHERE viewname = 'employee_name';

create or replace view high_earners as
SELECT 
    e.emp_name, 
    e.dept_id, 
    e.salary,
    d.avg_salary
FROM employees e
JOIN (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
) d --as d also work
ON e.dept_id = d.dept_id
WHERE e.salary > d.avg_salary order by avg_salary;