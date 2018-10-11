DELIMITER $$
CREATE TRIGGER bi_pizza_samenstelling BEFORE INSERT ON pizza_samenstelling
FOR EACH ROW
BEGIN
    CALL check_pizza_samenstelling(new.spicy, new.vegetarisch, new.beschikbaar);
END$$   
DELIMITER ; 