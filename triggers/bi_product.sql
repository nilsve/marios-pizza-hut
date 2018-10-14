DELIMITER $$

DROP TRIGGER IF EXISTS bi_product;

CREATE TRIGGER bi_product BEFORE INSERT ON product
FOR EACH ROW
BEGIN
    CALL check_product(new.spicy, new.vegetarisch, new.beschikbaar);
END$$   
DELIMITER ; 