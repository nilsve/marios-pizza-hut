DELIMITER $$
CREATE TRIGGER bi_openingstijden BEFORE INSERT ON openingstijden
FOR EACH ROW
BEGIN
    CALL check_openingstijden(new.dagnummer);
END$$   
DELIMITER ; 