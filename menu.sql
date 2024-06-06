CREATE VIEW MenuView AS
SELECT 
    d.dish_id AS DishID,
    d.name AS DishName,
    d.price AS Price,
    d.description AS Description
FROM 
    dishes d
JOIN 
    categories c ON d.category_id = c.category_id;