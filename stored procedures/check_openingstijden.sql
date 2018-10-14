DELIMITER $$

DROP PROCEDURE IF EXISTS check_openingstijden;
 
CREATE PROCEDURE check_openingstijden (IN dagnummer INT)
BEGIN
    IF dagnummer NOT IN (1, 2, 3, 4, 5, 6, 7) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Check constraint on openingstijden.dagnummer failed.\nDagnummer moet minimaal 1 maximaal 7 zijn.';
    END IF;
 
END$$
 
DELIMITER ;