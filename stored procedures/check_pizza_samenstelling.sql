DELIMITER $$

DROP PROCEDURE IF EXISTS check_pizza_samenstelling;
 
CREATE PROCEDURE check_pizza_samenstelling (IN spicy TINYINT(3), vegetarisch TINYINT(3), beschikbaar TINYINT(3))
BEGIN
    IF spicy NOT IN (0, 1) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Check constraint on pizza_samenstelling.spicy failed.\nSpicy moet 1 of 0 zijn';
    END IF;
    IF vegetarisch NOT IN (0, 1) THEN
        SIGNAL SQLSTATE '45001'
            SET MESSAGE_TEXT = 'Check constraint on pizza_samenstelling.vegetarisch failed.\nVegetarisch moet 1 of 0 zijn';
    END IF;
    IF beschikbaar NOT IN (0, 1) THEN
        SIGNAL SQLSTATE '45002'
            SET MESSAGE_TEXT = 'Check constraint on pizza_samenstelling.beschikbaar failed.\nBeschikbaar moet 1 of 0 zijn';
    END IF;
END$$
 
DELIMITER ;