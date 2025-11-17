SELECT emp_id, email, phone, role_, hire_date, status, salary, dept_id, emp_name
	FROM public.employees;


ALTER TABLE employees DROP CONSTRAINT employees_email_key;

ALTER TABLE employees
ADD CONSTRAINT employees_email_key UNIQUE (email);

select email,count(*) as counts from employees group by email having count(*) > 1;