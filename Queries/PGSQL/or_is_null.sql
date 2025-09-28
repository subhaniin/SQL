select * from employees where salary between 50000 and 60000;

select * from employees where first_name is null
or last_name is null
or email is null
or phone is null
or department is null
or position is null
or salary is null
or hire_date is null
or status is null;

select * from employees

update employees
set position = 'Team Lead' where first_name = 'subhani';

alter table employees
rename new_salary to  salary_2025;

alter table employees
alter column hike_2025 type numeric;

update employees
set hike_2025 = 1.1;

alter table employees
add column new_salary INT;

update employees
set new_salary = salary*hike_2025;

select hike_2025, salary_2024, salary_2025 from employees;