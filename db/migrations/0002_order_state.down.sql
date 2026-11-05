DROP INDEX orders_customer_created_idx;
ALTER TABLE orders RENAME COLUMN state TO status;
