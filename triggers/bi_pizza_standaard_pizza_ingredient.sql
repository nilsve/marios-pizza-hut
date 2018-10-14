DELIMITER $$

DROP TRIGGER IF EXISTS bi_pizza_standaard_pizza_ingredient;

CREATE TRIGGER bi_pizza_standaard_pizza_ingredient BEFORE INSERT ON pizza_standaard_pizza_ingredient
FOR EACH ROW
BEGIN
    CALL check_pizza_standaard_pizza_ingredient(new.aantal);
END$$   
DELIMITER ; 