EXPLAIN SELECT * FROM customers;
EXPLAIN SELECT * FROM orders;
EXPLAIN SELECT * FROM order_items;

ALTER TABLE customers ADD INDEX idx_customer_id (customer_id);
ALTER TABLE orders ADD INDEX idx_order_id (order_id);
ALTER TABLE order_items ADD INDEX idx_order_item_id (order_item_id);

SHOW INDEX FROM customers;
SHOW INDEX FROM orders;
SHOW INDEX FROM order_items;

EXPLAIN SELECT customer_id FROM customers WHERE customer_id = 1;
EXPLAIN SELECT * FROM orders WHERE order_id = 123;
EXPLAIN SELECT * FROM order_items WHERE order_item_id = 456;