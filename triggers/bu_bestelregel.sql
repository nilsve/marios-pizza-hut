DELIMITER $$
CREATE TRIGGER bu_bestelregel BEFORE UPDATE ON bestelregel
FOR EACH ROW
BEGIN
    CALL check_bestelregel(new.aantal);
END$$   
DELIMITER ; 