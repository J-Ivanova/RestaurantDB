DROP ROLE IF EXISTS restaurant_admin;
CREATE ROLE restaurantAdmin;
GRANT ALL PRIVILEGES ON RestaurantDB.*  TO restaurantAdmin;

drop user if exists restaurant_admin;
create user restaurant_admin;
grant restaurantAdmin to restaurant_admin; 


DROP ROLE IF EXISTS waiter;
CREATE ROLE waiter;
GRANT SELECT, INSERT, UPDATE, DELETE ON RestaurantDB.Order TO waiter;
GRANT SELECT, INSERT, UPDATE, DELETE ON RestaurantDB.Order_Type TO waiter;

drop user if exists waiter_user;
create user waiter_user;
grant waiter to waiter_user;


DROP ROLE IF EXISTS cook;
CREATE ROLE cook;
GRANT SELECT (order_id, order_type_id) ON RestaurantDB.Order TO cook;
GRANT SELECT ON RestaurantDB.Order_Type TO cook;
GRANT SELECT ON RestaurantDB.Order_Item TO cook;
GRANT SELECT (menu_id, name) ON RestaurantDB.Menu TO cook;

drop user if exists cook_user;
create user cook_user;
grant cook to cook_user;