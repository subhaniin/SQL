select * from employees;

select * from associates order by emp_id asc;

select emp_id from employees 
except
select emp_id from associates
order by emp_id asc;

select emp_id from associates
union
select emp_id from employees
order by emp_id asc;

select emp_id from associates
union all
select emp_id from employees
order by emp_id asc;

select emp_id from associates
intersect
select emp_id from employees
order by emp_id asc;