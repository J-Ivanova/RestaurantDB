START TRANSACTION;

CREATE INDEX idx_customer_email ON Customer(email);

CREATE INDEX idx_order_date_total_amount ON `Order`(order_date, total_amount);

CREATE INDEX idx_employee_name_prefix ON Employee(name(10));

COMMIT;