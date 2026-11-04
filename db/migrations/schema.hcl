table "customers" {
  column "id" {
    type     = "bigint"
    identity = "always"
  }
  column "email" { type = "text" }
  column "created_at" {
    type    = "timestamptz"
    default = "now()"
  }
  primary_key = ["id"]
  unique "customers_email_key" { columns = ["email"] }
}

table "orders" {
  column "id" {
    type     = "bigint"
    identity = "always"
  }
  column "customer_id" { type = "bigint" }
  column "total_cents" { type = "integer" }
  column "status" {
    type    = "text"
    default = "'pending'"
  }
  column "created_at" {
    type    = "timestamptz"
    default = "now()"
  }
  primary_key = ["id"]

  foreign_key {
    columns     = ["customer_id"]
    ref_table   = "customers"
    ref_columns = ["id"]
  }
  check "orders_total_cents_check" { expr = "total_cents >= 0" }
  index "orders_customer_idx" { columns = ["customer_id"] }
}
