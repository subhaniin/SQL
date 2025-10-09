select sum(salary_2024), sum(salary_2025) from employees; --where emp_id between 50 and 100
select sum(salary_2025)-sum(salary_2024) from employees as diff_salary;