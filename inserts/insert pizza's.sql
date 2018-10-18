
    UPDATE categorie SET hoofdcategorie_id = NULL;

        DELETE FROM pizza_standaard_pizza_ingredient;
        ALTER TABLE pizza_standaard_pizza_ingredient AUTO_INCREMENT = 1;
    

        DELETE FROM pizza_standaard;
        ALTER TABLE pizza_standaard AUTO_INCREMENT = 1;
    

        DELETE FROM pizzabodem;
        ALTER TABLE pizzabodem AUTO_INCREMENT = 1;
    

        DELETE FROM pizza_ingredient;
        ALTER TABLE pizza_ingredient AUTO_INCREMENT = 1;
    

        DELETE FROM categorie;
        ALTER TABLE categorie AUTO_INCREMENT = 1;
    

        DELETE FROM prijs;
        ALTER TABLE prijs AUTO_INCREMENT = 1;
    

    INSERT INTO categorie SET naam = "Pizza's";
    SET @hoofdcategorie_id = LAST_INSERT_ID();

    INSERT INTO categorie SET naam = "Pizzabodems";
    SET @pizzabodems_categorie_id = LAST_INSERT_ID();

    INSERT INTO categorie SET naam = "Alle ingredienten";
    SET @ingredienten_categorie_id = LAST_INSERT_ID();

    INSERT INTO prijs SET bedrag=1, begindatum=NOW();
    SET @pizzabodem_prijs_id = LAST_INSERT_ID();

    INSERT INTO pizzabodem SET naam = "Pizza's", omschrijving = "Alle pizza's", categorie_id = @pizzabodems_categorie_id, diameter=10, beschikbaar = 1, prijs_id = @pizzabodem_prijs_id;
    SET @standaard_pizzabodem_id = LAST_INSERT_ID();
INSERT INTO categorie SET hoofdcategorie_id = @hoofdcategorie_id, naam="Famous Artisan Pizza’s";

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Tomatensaus";
        

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=8.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Bacon Gorgonzola', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Famous Artisan Pizza’s"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Bacon Gorgonzola"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Zon gedroogde tomaten";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Bacon Gorgonzola"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Zon gedroogde tomaten"),
        aantal=6;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Spinazie";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Bacon Gorgonzola"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Spinazie"),
        aantal=6;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Rode Ui";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Bacon Gorgonzola"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Rode Ui"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Champignons";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Bacon Gorgonzola"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Champignons"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Gorgonzola";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Bacon Gorgonzola"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Gorgonzola"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Kaas";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Bacon Gorgonzola"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Bacon";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Bacon Gorgonzola"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Bacon"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=8.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Pollo Pomodore', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Famous Artisan Pizza’s"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Pollo Pomodore"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Pollo Pomodore"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Zon gedroogde tomaten"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Pollo Pomodore"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Spinazie"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Pollo Pomodore"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Rode Ui"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Kip";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Pollo Pomodore"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kip"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Pollo Pomodore"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Basilicum";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Pollo Pomodore"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Basilicum"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Creme Fraiche";
        

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=8.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Tricolore', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Famous Artisan Pizza’s"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 1;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Tricolore"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Creme Fraiche");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Tricolore"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Zon gedroogde tomaten"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Tricolore"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Spinazie"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Tricolore"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Rode Ui"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Tricolore"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Champignons"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Groene Olijven";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Tricolore"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Groene Olijven"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Geitenkaas";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Tricolore"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Geitenkaas"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Tricolore"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Tricolore"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Basilicum"),
        aantal=1;
INSERT INTO categorie SET hoofdcategorie_id = @hoofdcategorie_id, naam="Top Taste Pizza's";

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=7.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Four Cheese', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 1;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Four Cheese"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Four Cheese"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Gorgonzola"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Kaasmix";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Four Cheese"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaasmix"),
        aantal=1;
INSERT INTO categorie SET hoofdcategorie_id = @hoofdcategorie_id, naam="BBQ Specials";

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Barbecue Saus";
        

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=7.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='BBQ Mixed Grill', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="BBQ Specials"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Mixed Grill"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Barbecue Saus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Mixed Grill"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Rode Ui"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Paprikamix";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Mixed Grill"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Paprikamix"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Ham";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Mixed Grill"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Ham"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Gehakt";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Mixed Grill"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Gehakt"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Mixed Grill"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kip"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Mixed Grill"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Mixed Grill"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Bacon"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=7.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Creamy Bacon', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Creamy Bacon"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Creme Fraiche");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Creamy Bacon"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Rode Ui"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Creamy Bacon"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Champignons"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Creamy Bacon"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Ham"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Creamy Bacon"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Creamy Bacon"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Bacon"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=7.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Extravaganzza', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Extravaganzza"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Extravaganzza"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Rode Ui"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Pepperoni";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Extravaganzza"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Pepperoni"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Extravaganzza"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Paprikamix"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Extravaganzza"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Champignons"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Extravaganzza"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Ham"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Extravaganzza"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Gehakt"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Extravaganzza"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Groene Olijven"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Extravaganzza"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=7.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Chicken Kebab', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Chicken Kebab"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Chicken Kebab"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Rode Ui"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Knoflooksaus Swirl";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Chicken Kebab"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Knoflooksaus Swirl"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Chicken Kebak";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Chicken Kebab"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Chicken Kebak"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Chicken Kebab"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=7.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Shoarma', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Shoarma"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Shoarma";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Shoarma"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Shoarma"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Shoarma"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=7.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Supreme', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="BBQ Specials"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Supreme"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Barbecue Saus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Supreme"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Ham"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Supreme"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Gehakt"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Chorizo";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Supreme"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Chorizo"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Supreme"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Chicken Kebak"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Supreme"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Supreme"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Bacon"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=6.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Vier Seizoenen', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Vier Seizoenen"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Vier Seizoenen"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Pepperoni"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Vier Seizoenen"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Paprikamix"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Vier Seizoenen"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Champignons"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Vier Seizoenen"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Ham"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Vier Seizoenen"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=6.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='BBQ Chicken Hawaii', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="BBQ Specials"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Chicken Hawaii"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Barbecue Saus");

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Ananas";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Chicken Hawaii"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Ananas"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Chicken Hawaii"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kip"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Chicken Hawaii"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=6.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Americana', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Americana"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Americana"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Pepperoni"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Americana"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Ham"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Americana"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Gehakt"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Americana"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=6.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Beenham', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Beenham"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Honing Mosterdsaus";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Beenham"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Honing Mosterdsaus"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Beenham"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Beenham";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Beenham"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Beenham"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=6.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Chicken Supreme', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Chicken Supreme"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Chicken Supreme"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Rode Ui"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Chicken Supreme"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Paprikamix"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Verse Tomaat";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Chicken Supreme"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Verse Tomaat"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Chicken Supreme"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kip"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Chicken Supreme"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=6.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Deluxe', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Deluxe"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Deluxe"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Rode Ui"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Deluxe"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Pepperoni"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Deluxe"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Paprikamix"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Deluxe"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Champignons"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Deluxe"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Gehakt"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Deluxe"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Deluxe"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Bacon"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=6.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Hawaii', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Hawaii"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Hawaii"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Ananas"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Hawaii"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Ham"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Hawaii"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=6.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Hot & Spicy', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=1, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Hot & Spicy"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Hot & Spicy"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Rode Ui"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Hot & Spicy"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Pepperoni"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Hot & Spicy"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Paprikamix"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Spaanse Pepers";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Hot & Spicy"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Spaanse Pepers"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Hot & Spicy"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=6.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Salame Speciale', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Salame Speciale"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Salami";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Salame Speciale"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Salami"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Salame Speciale"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Paprikamix"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Salame Speciale"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=6.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Tonno', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Tonno"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Tonijn";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Tonno"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tonijn"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Tonno"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Rode Ui"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Tonno"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=6.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Veggi', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 1;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Veggi"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Veggi"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Spinazie"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Veggi"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Rode Ui"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Veggi"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Paprikamix"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Veggi"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Champignons"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Veggi"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Groene Olijven"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Veggi"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Verse Tomaat"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Veggi"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=4.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Caprese', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 1;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Caprese"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Caprese"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Verse Tomaat"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Caprese"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Caprese"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Basilicum"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=4.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Funghi', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 1;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Funghi"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Funghi"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Champignons"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Funghi"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=4.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Margaritha', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 1;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Margaritha"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Margaritha"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=4.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='Perfect Pepperoni', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Top Taste Pizza's"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 1;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Perfect Pepperoni"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Tomatensaus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Perfect Pepperoni"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Pepperoni"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Perfect Pepperoni"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kaas"),
        aantal=1;

                INSERT INTO prijs SET bedrag=2, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            
INSERT INTO prijs SET bedrag=4.95, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='BBQ Cannibale', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="BBQ Specials"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=0, 
                    vegetarisch = 0;
        
INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Cannibale"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Barbecue Saus");
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Cannibale"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Kip"),
        aantal=1;

            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="Merguez";
        
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Cannibale"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Merguez"),
        aantal=1;
INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Cannibale"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="Gehakt"),
        aantal=1;
