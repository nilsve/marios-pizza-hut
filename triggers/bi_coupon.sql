DELIMITER $$
CREATE TRIGGER bi_coupon BEFORE INSERT ON coupon
FOR EACH ROW
BEGIN
    CALL check_coupon(new.kortingspercentage, new.korting, new.beschikbaar);
END$$   
DELIMITER ; 