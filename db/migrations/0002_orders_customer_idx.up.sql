-- Build the index without blocking writes; give up quickly instead of queueing behind long transactions.
SET lock_timeout = '2s';
CREATE INDEX CONCURRENTLY orders_customer_idx ON orders (customer_id);
