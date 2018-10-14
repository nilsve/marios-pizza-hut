DELIMITER $$

DROP PROCEDURE IF EXISTS check_product;
 
CREATE PROCEDURE check_product (IN spicy TINYINT(3), vegetarisch TINYINT(3), beschikbaar TINYINT(3))
BEGIN
    IF spicy NOT IN (0, 1) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Check constraint on product.spicy failed.\nSpicy moet 1 of 0 zijn';
    END IF;
    IF vegetarisch NOT IN (0, 1) THEN
        SIGNAL SQLSTATE '45001'
            SET MESSAGE_TEXT = 'Check constraint on product.vegetarisch failed.\nVegetarisch moet 1 of 0 zijn';
    END IF;
    IF beschikbaar NOT IN (0, 1) THEN
        SIGNAL SQLSTATE '45002'
            SET MESSAGE_TEXT = 'Check constraint on product.beschikbaar failed.\nBeschikbaar moet 1 of 0 zijn';
    END IF;
END$$
 
DELIMITER ;