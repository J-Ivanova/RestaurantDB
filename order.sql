CREATE VIEW OrderView AS
SELECT 
    order_id AS OrderID,
    customer_id AS CustomerID,
     employee_id AS EmployeeID,
    order_type_id AS OrderTypeID,
    order_date DATETIME NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL
FROM 
    orders;