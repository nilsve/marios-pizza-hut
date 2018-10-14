DELIMITER $$

DROP TRIGGER IF EXISTS bi_pizza_standaard;

CREATE TRIGGER bi_pizza_standaard BEFORE INSERT ON pizza_standaard
FOR EACH ROW
BEGIN
    CALL check_pizza_standaard(new.spicy, new.vegetarisch, new.beschikbaar);
END$$   
DELIMITER ; 