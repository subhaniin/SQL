CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    department VARCHAR(50),
    position VARCHAR(50),
    salary NUMERIC(10,2),
    hire_date DATE,
    status VARCHAR(20)
);

INSERT INTO employees (first_name, last_name, email, phone, department, position, salary, hire_date, status) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234', 'HR', 'Manager', 75000.00, '2021-01-15', 'Active'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678', 'IT', 'Developer', 85000.00, '2022-03-10', 'Active'),
('Mike', 'Brown', 'mike.brown@example.com', '555-8765', 'Finance', 'Analyst', 65000.00, '2020-07-22', 'Active'),
('Emily', 'Jones', 'emily.jones@example.com', '555-4321', 'IT', 'QA Engineer', 72000.00, '2023-02-01', 'Active'),
('Robert', 'Davis', 'robert.davis@example.com', '555-3344', 'Marketing', 'Coordinator', 58000.00, '2019-11-05', 'Inactive'),
('Linda', 'Wilson', 'linda.wilson@example.com', '555-9988', 'Sales', 'Executive', 90000.00, '2018-08-20', 'Active'),
('David', 'Miller', 'david.miller@example.com', '555-2211', 'HR', 'Recruiter', 60000.00, '2021-06-14', 'Active'),
('Susan', 'Taylor', 'susan.taylor@example.com', '555-1122', 'Finance', 'Manager', 88000.00, '2020-10-30', 'Inactive'),
('James', 'Anderson', 'james.anderson@example.com', '555-7788', 'IT', 'DevOps Engineer', 87000.00, '2022-12-12', 'Active'),
('Karen', 'Thomas', 'karen.thomas@example.com', '555-8899', 'Support', 'Agent', 52000.00, '2023-04-25', 'Active');

select * from employees;

create table managers(
Manager_ID SERIAL PRIMARY KEY,
emp_ID int,
first_name varchar(30),
Last_name varchar(30)
);

insert into managers(emp_id,first_name,last_name)
select emp_id,first_name,last_name from employees where position = 'Manager';

select * from managers;

ALTER TABLE managers
ADD CONSTRAINT fk_emp_id
FOREIGN KEY (emp_id)
REFERENCES employees(emp_id);