DELIMITER $$
CREATE TRIGGER bi_pizza_ingredient BEFORE INSERT ON pizza_ingredient
FOR EACH ROW
BEGIN
    CALL check_pizza_ingredient(new.beschikbaar);
END$$   
DELIMITER ; 