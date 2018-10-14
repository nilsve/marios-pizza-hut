DELIMITER $$

DROP TRIGGER IF EXISTS bi_openingstijden;

CREATE TRIGGER bi_openingstijden BEFORE INSERT ON openingstijden
FOR EACH ROW
BEGIN
    CALL check_openingstijden(new.dagnummer);
END$$   
DELIMITER ; 