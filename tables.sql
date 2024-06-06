CREATE SCHEMA `RestaurantDB` ;

-- Employee Table
Use `RestaurantDB`;

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    position VARCHAR(255) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    is_manager BOOLEAN DEFAULT FALSE
);

-- Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

-- Menu Table
CREATE TABLE Menu (
    menu_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT
);

-- Order_Type Table
CREATE TABLE Order_Type (
    order_type_id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(50) NOT NULL
);

-- Order Table
CREATE TABLE `Order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    employee_id INT,
    order_type_id INT,
    order_date DATETIME NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (order_type_id) REFERENCES Order_Type(order_type_id)
);

-- Order_Item Table (Many-to-Many relationship between Order and Menu)
CREATE TABLE Order_Item (
    order_id INT,
    menu_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, menu_id),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);

CREATE TABLE Menu_Log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    menu_id INT,
    old_price DECIMAL(10, 2),
    new_price DECIMAL(10, 2),
    old_description TEXT,
    new_description TEXT,
    changed_at DATETIME,
    FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);
