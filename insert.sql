-- Populate Employee Table
INSERT INTO Employee (name, position, salary, is_manager)
VALUES 
('John Doe', 'Manager', 1200, TRUE),
('Jane Smith', 'Chef', 1000, FALSE),
('Michael Brown', 'Waiter', 950, FALSE);

-- Populate Customer Table
INSERT INTO Customer (name, email, phone)
VALUES 
('Alice Johnson', 'alice@example.com', '111-222-3333'),
('Bob Williams', 'bob@example.com', '444-555-6666'),
('Charlie Brown', 'charlie@example.com', '777-888-9999');

-- Populate Menu Table
INSERT INTO Menu (name, price, description)
VALUES 
('Spaghetti Carbonara', 12.99, 'Classic Italian pasta dish with eggs, cheese, pancetta, and pepper.'),
('Sushi Roll', 18.99, 'Delicious sushi roll with fresh fish and rice.'),
('Cheeseburger', 10.99, 'Juicy cheeseburger with lettuce, tomato, and pickles.');

-- Populate Order_Type Table
INSERT INTO Order_Type (type)
VALUES 
('Dine-in'),
('Takeout');

-- Populate Order Table
INSERT INTO `Order` (customer_id, employee_id, order_type_id, order_date, total_amount)
VALUES 
(1, 1, 1, '2024-06-01 18:30:00', 25.98),
(2, 2, 2, '2024-06-02 12:00:00', 17.98),
(3, 3, 1, '2024-06-03 19:45:00', 10.99);

-- Populate Order_Item Table
INSERT INTO Order_Item (order_id, menu_id, quantity)
VALUES 
(1, 1, 1),
(1, 3, 1),
(2, 2, 2),
(3, 3, 1);
