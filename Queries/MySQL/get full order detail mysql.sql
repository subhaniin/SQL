DELIMITER $$

CREATE PROCEDURE get_full_order_details()
BEGIN
    SELECT 
        c.customer_id, c.first_name, c.last_name, c.email,
        o.order_id, o.order_date, o.total_amount, 
        p.product_id, p.name AS product_name, p.category, oi.quantity, oi.price AS item_price,
        pay.payment_id, pay.payment_date, pay.amount AS payment_amount, pay.payment_method, pay.status AS payment_status
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    LEFT JOIN payments pay ON o.order_id = pay.order_id;
END $$

DELIMITER ;