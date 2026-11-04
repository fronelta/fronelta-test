-- One statement per file: golang-migrate sends a multi-statement file as one implicit transaction, and
-- CREATE INDEX CONCURRENTLY can't run inside one.
CREATE INDEX CONCURRENTLY orders_customer_idx ON orders (customer_id);
