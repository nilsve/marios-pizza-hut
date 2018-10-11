DELIMITER $$
CREATE TRIGGER bi_prijs BEFORE INSERT ON prijs
FOR EACH ROW
BEGIN
    CALL check_prijs(new.bedrag);
END$$   
DELIMITER ; 