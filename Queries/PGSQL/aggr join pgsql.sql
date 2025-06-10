select * from employees;

select * from performance_FY_2025;

alter table performance rename to performance_FY_2025;

--employees grade and hike
select e.emp_id,e.emp_name, p.grade,p.hike,p.bonus,(p.new_salary+bonus) as May_salary from employees e
inner join performance_FY_2025 p on
e.emp_id = p.emp_id
order by e.emp_id;

alter table performance_FY_2025
add column Bonus int;

update performance_FY_2025
set bonus = case
when grade = 'A' then 5000
when grade = 'B' then 3000
else 1000
end;

WITH EmployeePerformance AS (
    SELECT 
        e.emp_id,
        e.emp_name,
        p.grade,
        p.hike,
        p.bonus,
        p.new_salary,
        (p.new_salary + p.bonus) AS may_salary
    FROM 
        employees e
    INNER JOIN 
        performance_FY_2025 p 
        ON e.emp_id = p.emp_id
)
SELECT 
    emp_id,
    emp_name,
    grade,
    hike,
    bonus,
    new_salary,
    may_salary,
    -- Rank employees by May salary (highest salary = rank 1)
    RANK() OVER (ORDER BY may_salary DESC) AS salary_rank,
    -- Average hike per grade (same value for all employees with that grade)
    AVG(hike) OVER (PARTITION BY grade) AS avg_hike_by_grade,
    -- Running total of May salary ordered by emp_id
    SUM(may_salary) OVER (ORDER BY may_salary DESC, emp_id ASC) AS running_total_salary
FROM 
    EmployeePerformance
ORDER BY 
    salary_rank, emp_id;
