ALTER TABLE customers ADD INDEX idx_customer_id (customer_id);
ALTER TABLE orders ADD INDEX idx_order_id (order_id);
ALTER TABLE order_items ADD INDEX idx_order_item_id (order_item_id);
