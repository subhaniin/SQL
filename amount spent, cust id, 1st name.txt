SELECT c.cust_id, c.first_name, o.amount_spent
FROM Customers AS c 
LEFT JOIN Orders AS o ON c.cust_id = o.cust_id;

left join?(https://www.youtube.com/watch?v=4XCLU3ES02Y)
amount spent, cust id, 1st name