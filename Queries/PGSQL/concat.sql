UPDATE employees
SET email = CONCAT(emp_name, emp_id, '@abc.com')
WHERE emp_id BETWEEN 1 AND 10;

UPDATE employees
SET email = 'emp' || emp_id || '@abc.com'
WHERE emp_id BETWEEN 1 AND 10;

select * from employees order by emp_id;