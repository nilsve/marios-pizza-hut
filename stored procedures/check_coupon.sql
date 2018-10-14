DELIMITER $$

DROP PROCEDURE IF EXISTS check_coupon;
 
CREATE PROCEDURE check_coupon (IN kortingspercentage DECIMAL, korting INT, beschikbaar TINYINT(3))
BEGIN
    IF kortingspercentage <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Check constraint on coupon.kortingspercentage failed.\nKortingspercentage moet meer dan 0 zijn';
    END IF;
    IF korting <= 0 THEN
        SIGNAL SQLSTATE '45001'
            SET MESSAGE_TEXT = 'Check constraint on coupon.korting failed.\nKorting moet meer dan 0 zijn';
    END IF;
    IF beschikbaar NOT IN (0, 1) THEN
        SIGNAL SQLSTATE '45002'
            SET MESSAGE_TEXT = 'Check constraint on coupon.beschikbaar failed.\nBeschikbaar moet 1 of 0 zijn';
    END IF;
END$$
 
DELIMITER ;