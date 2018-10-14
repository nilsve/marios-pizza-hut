DELIMITER $$

DROP TRIGGER IF EXISTS bu_coupon;

CREATE TRIGGER bu_coupon BEFORE UPDATE ON coupon
FOR EACH ROW
BEGIN
    CALL check_coupon(new.kortingspercentage, new.korting, new.beschikbaar);
END$$   
DELIMITER ; 