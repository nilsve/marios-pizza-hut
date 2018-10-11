DELIMITER $$
 
CREATE PROCEDURE check_pizza_standaard_pizza_ingredient (IN aantal INT(2))
BEGIN
    IF aantal NOT BETWEEN 1 AND 11 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Check constraint on pizza_standaard_pizza_ingredient.aantal failed.\Aantal moet minimaal 1 maximaam 11 zijn';
    END IF;
 
END$$
 
DELIMITER ;