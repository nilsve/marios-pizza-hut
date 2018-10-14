DELIMITER $$

DROP PROCEDURE IF EXISTS check_pizza_ingredient;
 
CREATE PROCEDURE check_pizza_ingredient (IN beschikbaar TINYINT(3))
BEGIN
    IF beschikbaar NOT IN (0, 1) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Check constraint on pizza_ingredient.beschikbaar failed.\beschikbaar moet 0 of 1 zijn';
    END IF;
 
END$$
 
DELIMITER ;