DELIMITER $$

DROP TRIGGER IF EXISTS bu_openingstijden;

CREATE TRIGGER bu_openingstijden BEFORE UPDATE ON openingstijden
FOR EACH ROW
BEGIN
    CALL check_openingstijden(new.dagnummer);
END$$   
DELIMITER ; 