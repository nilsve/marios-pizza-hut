DELIMITER $$
 
CREATE PROCEDURE check_bestelregel (IN aantal INT(3))
BEGIN
    IF aantal < 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Check constraint on bestelregel.aantal failed.\Aantal moet 1 of meer zijn';
    END IF;
 
END$$
 
DELIMITER ;