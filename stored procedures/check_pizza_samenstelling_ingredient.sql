DELIMITER $$
 
CREATE PROCEDURE check_pizza_samenstelling_ingredient (IN is_standaard TINYINT(3))
BEGIN
    IF is_standaard NOT IN (0, 1) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Check constraint on pizza_samenstelling_ingredient.is_standaard failed.\Is_standaard moet 0 of 1 zijn';
    END IF;
 
END$$
 
DELIMITER ;