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

select * from employees where 

update employees
set position = 'Team Lead' where first_name = 'subhani';