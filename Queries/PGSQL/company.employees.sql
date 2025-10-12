select * from employees;

alter table employees
drop column salary_2024, 
drop column hike_2025;

alter table employees
rename salary_2025 to current_salary;

alter table employees
add column dept_id int;

update employees e
set dept_id = d.dept_id from departments d
where e.department = d.dept_name;

alter table employees
drop column department;