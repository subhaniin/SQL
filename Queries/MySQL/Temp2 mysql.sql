use ecom;

SET SQL_SAFE_UPDATES = 0;


DELETE FROM orders  
WHERE order_id = 5;

DELETE FROM customers  
WHERE customer_id = 5;

SET SQL_SAFE_UPDATES = 1;

#inner join no null, left join right nulls, right join left nulls outer join all nulls
select * 
from customers a
Left join orders b
on a.customer_id = b.customer_id;

#FULL OUTER JOIN in SQL
SELECT *  
FROM customers a  
LEFT JOIN orders b  
ON a.customer_id = b.customer_id  
UNION  
SELECT *  
FROM customers a  
RIGHT JOIN orders b  
ON a.customer_id = b.customer_id;


