select * from employees;

select emp_name,salary, rank()over(order by salary desc)as salary_rank from employees;

select emp_name,salary, row_number()over(order by salary desc)as salary_rank from employees;

SELECT emp_name, salary,
       RANK() OVER (ORDER BY salary DESC) AS rank,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank
FROM employees;

SELECT emp_name, salary,
       LEAD(salary) OVER (ORDER BY salary DESC) AS next_salary
FROM employees;

SELECT emp_name, salary,
       LAG(salary) OVER (ORDER BY salary DESC) AS prev_salary
FROM employees;