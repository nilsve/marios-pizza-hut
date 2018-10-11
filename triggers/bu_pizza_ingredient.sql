DELIMITER $$
CREATE TRIGGER bu_pizza_ingredient BEFORE UPDATE ON pizza_ingredient
FOR EACH ROW
BEGIN
    CALL check_pizza_ingredient(new.beschikbaar);
END$$   
DELIMITER ; 