select * from demo_table;

create table "employees"(Emp_id int primary key, EMP_name varchar(20),Salary float);

insert into employees
values
(5,'Deepak Seru',40000,30,'M'),
(6,'Purushotham Kumar',300000,25,'M'),
(7,'Anjana Bhagnagre',30000,28,'F'),
(8,'Afifa Tasneem',50000,26,'F'),
(9,'Manoj Doddapaneni',40000,28,'M'),
(10,'Narasimah',35000,26,'M');

update employees
set gender = 'M' where gender is null;

update employees
set gender = 'F' where emp_name = 'Sujata Rana';

ALTER TABLE demo_table
drop column gender;

CREATE TYPE gender_enum AS ENUM ('M', 'F', 'O');

ALTER TABLE demo_table
ADD COLUMN gender gender_enum;

select emp_id,salary from employees where gender = 'F';

Select count(emp_id) from employees where gender = 'M';

select * from employees;