DELIMITER $$

DROP TRIGGER IF EXISTS bu_pizza_samenstelling;

CREATE TRIGGER bu_pizza_samenstelling BEFORE UPDATE ON pizza_samenstelling
FOR EACH ROW
BEGIN
    CALL check_pizza_samenstelling(new.spicy, new.vegetarisch, new.beschikbaar);
END$$   
DELIMITER ; 