-- Without CONCURRENTLY this takes a ShareLock on orders: writes block until the build finishes.
CREATE INDEX orders_customer_idx ON orders (customer_id);
