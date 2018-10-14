DELIMITER $$

DROP TRIGGER IF EXISTS bu_pizza_samenstelling_ingredient;

CREATE TRIGGER bu_pizza_samenstelling_ingredient BEFORE UPDATE ON pizza_samenstelling_ingredient
FOR EACH ROW
BEGIN
    CALL check_pizza_samenstelling_ingredient(new.is_standaard);
END$$   
DELIMITER ; 