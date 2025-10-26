select dept_id, avg(salary) from employees group by dept_id order by avg(salary) desc;

select emp_name, dept_id, salary from employees e where salary>(select avg(salary) from employees where e.dept_id = dept_id) order by dept_id desc;

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
