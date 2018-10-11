DELIMITER $$
CREATE TRIGGER bu_product BEFORE UPDATE ON product
FOR EACH ROW
BEGIN
    CALL check_product(new.spicy, new.vegetarisch, new.beschikbaar);
END$$   
DELIMITER ; 