SELECT 
    (SELECT COUNT(*) FROM customers) AS source_count,
    (SELECT COUNT(*) FROM orders) AS target_count;
