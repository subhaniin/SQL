select * from employees;

select emp_name,salary, rank()over(order by salary desc)as salary_rank from employees;

select emp_name,salary, row_number()over(order by salary desc)as salary_rank from employees;

SELECT emp_name, salary,
       RANK() OVER (ORDER BY salary) AS rank,
       DENSE_RANK() OVER (ORDER BY salary) AS dense_rank,
	   row_number() over (order by salary) as row_number
FROM employees;

SELECT emp_name, salary,
       LEAD(salary) OVER (ORDER BY salary DESC) AS next_salary
FROM employees;

SELECT emp_name, salary,
       LAG(salary) OVER (ORDER BY salary DESC) AS prev_salary
FROM employees;

SELECT emp_id, dept_id, salary, 
       SUM(salary) OVER (PARTITION BY dept_id ORDER BY hire_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM employees;
