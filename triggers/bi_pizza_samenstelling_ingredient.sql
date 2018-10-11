DELIMITER $$
CREATE TRIGGER bi_pizza_samenstelling_ingredient BEFORE INSERT ON pizza_samenstelling_ingredient
FOR EACH ROW
BEGIN
    CALL check_pizza_samenstelling_ingredient(new.is_standaard);
END$$   
DELIMITER ; 