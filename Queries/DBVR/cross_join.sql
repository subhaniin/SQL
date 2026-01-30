select *,rank() OVER (ORDER BY e1.emp_id) AS rank from employees e1
cross join
employees e2;

select *,dense_rank() OVER (ORDER BY e1.emp_id) AS dense_rank from employees e1
cross join
employees e2;

SELECT 
    e1.*,
    e2.*,
    ROW_NUMBER() OVER (ORDER BY e1.emp_id) AS row_num
FROM employees e1
CROSS JOIN employees e2;
