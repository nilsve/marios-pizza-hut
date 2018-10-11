DELIMITER $$
CREATE TRIGGER bu_pizza_standaard_pizza_ingredient BEFORE UPDATE ON pizza_standaard_pizza_ingredient
FOR EACH ROW
BEGIN
    CALL check_pizza_standaard_pizza_ingredient(new.aantal);
END$$   
DELIMITER ; 