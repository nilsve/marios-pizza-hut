DELIMITER $$

DROP PROCEDURE IF EXISTS check_prijs;
 
CREATE PROCEDURE check_prijs (IN bedrag DECIMAL(4,2))
BEGIN
    IF bedrag < 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Check constraint on prijs.bedrag failed.\nBedrag moet 0 of meer zijn';
    END IF;
 
END$$
 
DELIMITER ;