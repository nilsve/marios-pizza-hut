DELIMITER $$
CREATE PROCEDURE copyIngredienten(_standaard_id INT, _samenstelling_id INT)
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE _ingredient_id INT;
  DECLARE _aantal INT;
  DECLARE rec CURSOR FOR SELECT pizza_ingredient_id, aantal FROM pizza_standaard_pizza_ingredient WHERE pizza_standaard_id = _standaard_id;

  OPEN rec;

  rec_loop: LOOP
    FETCH rec INTO _ingredient_id, _aantal;
	  SET @aantal = _aantal;

    insert_loop: LOOP
      SET @aantal = @aantal - 1;

      SET @prijs_id = (SELECT prijs_id FROM pizza_ingredient WHERE pizza_ingredient_id = _ingredient_id);
	    INSERT INTO pizza_samenstelling_pizza_ingredient SET 
        pizza_samenstelling_id = _samenstelling_id, 
        pizza_ingredient_id=_ingredient_id, 
        prijs_id = @prijs_id,
        is_standaard = 1;
        
      SELECT 0; -- vreemde mysql bug, zonder dit werkt het niet...

      IF @aantal <= 0 THEN
        LEAVE insert_loop;
      END IF;
    END LOOP insert_loop;
      
  END LOOP rec_loop;
  
  CLOSE rec;

END


DROP PROCEDURE copyIngredienten;

CALL copyIngredienten(2, 1)
