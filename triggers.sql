DELIMITER //
CREATE TRIGGER before_order_insert
BEFORE INSERT ON `Order`
FOR EACH ROW
BEGIN
    
    IF NEW.total_amount < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Total amount cannot be negative';
    END IF;
    
    
    IF (SELECT COUNT(*) FROM Customer WHERE customer_id = NEW.customer_id) = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid customer ID';
    END IF;
    
    IF (SELECT COUNT(*) FROM Employee WHERE employee_id = NEW.employee_id) = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid employee ID';
    END IF;
END;
//


CREATE TRIGGER after_order_item_insert
AFTER INSERT ON Order_Item
FOR EACH ROW
BEGIN
    
    DECLARE new_total DECIMAL(10, 2);
    SELECT SUM(Menu.price * Order_Item.quantity)
    INTO new_total
    FROM Order_Item
    JOIN Menu ON Order_Item.menu_id = Menu.menu_id
    WHERE Order_Item.order_id = NEW.order_id;
    
    
    UPDATE `Order`
    SET total_amount = new_total
    WHERE order_id = NEW.order_id;
END;
//


CREATE TRIGGER before_menu_update
BEFORE UPDATE ON Menu
FOR EACH ROW
BEGIN
    
    INSERT INTO Menu_Log (menu_id, old_price, new_price, old_description, new_description, changed_at)
    VALUES (OLD.menu_id, OLD.price, NEW.price, OLD.description, NEW.description, NOW());
END;
//


CREATE TRIGGER after_menu_update
AFTER UPDATE ON Menu
FOR EACH ROW
BEGIN
    
    UPDATE Menu
    SET last_updated = NOW()
    WHERE menu_id = NEW.menu_id;
END;
//

DELIMITER ;
