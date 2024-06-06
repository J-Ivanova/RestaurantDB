START TRANSACTION;

CREATE VIEW MenuView AS
SELECT 
    menu_id AS MenuID,
    name AS MenuName,
    price AS MenuPrice,
    description AS MenuDescription
FROM 
    Menu;
    
CREATE VIEW CustomerView AS
SELECT 
    customer_id AS CustomerID,
    name AS CustomerName,
    email AS CustomerEmail,
    phone AS CustomerPhone
FROM 
    Customer;
    
CREATE VIEW OrderView AS
SELECT 
    order_id AS OrderID,
    customer_id AS CustomerID,
    employee_id AS EmployeeID,
    order_type_id AS OrderTypeID,
    order_date AS OrderDate,
    total_amount AS TotalAmount
FROM 
    `Order`;

COMMIT;