DELIMITER $$
CREATE TRIGGER bu_pizza_standaard BEFORE UPDATE ON pizza_standaard
FOR EACH ROW
BEGIN
    CALL pizza_standaard(new.spicy, new.vegetarisch, new.beschikbaar);
END$$   
DELIMITER ; 