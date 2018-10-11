DELIMITER $$
CREATE TRIGGER bi_bestelregel BEFORE INSERT ON bestelregel
FOR EACH ROW
BEGIN
    CALL check_bestelregel(new.aantal);
END$$   
DELIMITER ; 