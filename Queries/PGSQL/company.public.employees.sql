ALTER TABLE employees
ADD COLUMN auto_record_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

drop table "Human resources".managers;

truncate public.employees;

alter table employees
drop column record_date;