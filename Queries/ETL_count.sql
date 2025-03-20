SELECT COUNT(*) FROM customers AS source_count,
SELECT COUNT(*) FROM orders AS target_count;

--Single table
SELECT 
    (SELECT COUNT(*) FROM customers) AS source_count,
    (SELECT COUNT(*) FROM orders) AS target_count;
