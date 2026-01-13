select e1.dept_id, max(e1.salary) from employees e1 
where e1.salary <(select max(e2.salary) from employees e2 where e1.dept_id = e2.dept_id)
group by dept_id;

select * from
(select *,dense_rank()over(partition by dept_id order by salary desc) as rnk from employees e);

select dept_id,avg(salary)from employees group by dept_id order by dept_id;
-----------------------------------------------
select emp_name, salary
from employees
where salary > (select avg(salary) from employees);

select e.emp_name, e.salary, e.department
from employees e
where e.salary > (
    select avg(e1.salary)
    from employees e1
    where e.department = e1.department
);


select e.emp_name,e.salary,a.avg_salary
from employees e
 cross join (select avg(salary) as avg_salary from employees) a
where e.salary > a.avg_salary;

select emp_name,
       salary,
       avg(salary) over () as avg_salary
from employees
where salary > avg(salary) over ();
---------------------------------------------------------
