
  UPDATE categorie SET hoofdcategorie_id = NULL;

  SET FOREIGN_KEY_CHECKS=0;

        DELETE FROM pizzabodem;
        ALTER TABLE pizzabodem AUTO_INCREMENT = 1;


        DELETE FROM categorie;
        ALTER TABLE categorie AUTO_INCREMENT = 1;


        DELETE FROM bestelregel;
        ALTER TABLE bestelregel AUTO_INCREMENT = 1;


        DELETE FROM product;
        ALTER TABLE product AUTO_INCREMENT = 1;


        DELETE FROM pizza_standaard_pizza_ingredient;
        ALTER TABLE pizza_standaard_pizza_ingredient AUTO_INCREMENT = 1;


        DELETE FROM pizza_standaard;
        ALTER TABLE pizza_standaard AUTO_INCREMENT = 1;


        DELETE FROM pizza_ingredient;
        ALTER TABLE pizza_ingredient AUTO_INCREMENT = 1;


        DELETE FROM prijs;
        ALTER TABLE prijs AUTO_INCREMENT = 1;


        DELETE FROM klant;
        ALTER TABLE klant AUTO_INCREMENT = 1;


        DELETE FROM pizza_samenstelling_pizza_ingredient;
        ALTER TABLE pizza_samenstelling_pizza_ingredient AUTO_INCREMENT = 1;


        DELETE FROM bestelling;
        ALTER TABLE bestelling AUTO_INCREMENT = 1;


        DELETE FROM pizza_samenstelling;
        ALTER TABLE pizza_samenstelling AUTO_INCREMENT = 1;

  SET FOREIGN_KEY_CHECKS=1;

      INSERT INTO categorie SET naam = "Pizzabodems";
      SET @pizzabodems_categorie_id = LAST_INSERT_ID();


    INSERT INTO prijs SET bedrag=2, begindatum=NOW();
    SET @pizzabodem_prijs_id = LAST_INSERT_ID();

    INSERT INTO pizzabodem
    SET naam = "Medium Cheesy Crust Pizza",
        omschrijving = "Ambachtelijk uitgeslagen bodem van vers deeg (25 cm). De rand van deze pizza is gevuld met smakelijke gesmolten kaas met kruiden.",
        categorie_id = @pizzabodems_categorie_id,
        diameter=25,
        beschikbaar = 1,
        prijs_id = @pizzabodem_prijs_id;


    INSERT INTO prijs SET bedrag=0, begindatum=NOW();
    SET @pizzabodem_prijs_id = LAST_INSERT_ID();

    INSERT INTO pizzabodem
    SET naam = "Medium Pizza",
        omschrijving = "Deze klassieke bodem van Domino’s worden ambachtelijk uitgeslagen van ons verse deeg. Met de hand gevormd tot een perfecte bodem.",
        categorie_id = @pizzabodems_categorie_id,
        diameter=25,
        beschikbaar = 1,
        prijs_id = @pizzabodem_prijs_id;


    INSERT INTO prijs SET bedrag=4, begindatum=NOW();
    SET @pizzabodem_prijs_id = LAST_INSERT_ID();

    INSERT INTO pizzabodem
    SET naam = "Large Pizza",
        omschrijving = "Deze klassieke bodem van Domino’s worden ambachtelijk uitgeslagen van ons verse deeg. Met de hand gevormd tot een perfecte bodem.",
        categorie_id = @pizzabodems_categorie_id,
        diameter=35,
        beschikbaar = 1,
        prijs_id = @pizzabodem_prijs_id;


    INSERT INTO prijs SET bedrag=5, begindatum=NOW();
    SET @pizzabodem_prijs_id = LAST_INSERT_ID();

    INSERT INTO pizzabodem
    SET naam = "Family XXL Pizza",
        omschrijving = "Deze klassieke bodem van Domino’s worden ambachtelijk uitgeslagen van ons verse deeg. Met de hand gevormd tot een perfecte bodem.",
        categorie_id = @pizzabodems_categorie_id,
        diameter=40,
        beschikbaar = 1,
        prijs_id = @pizzabodem_prijs_id;


    INSERT INTO prijs SET bedrag=1, begindatum=NOW();
    SET @pizzabodem_prijs_id = LAST_INSERT_ID();

    INSERT INTO pizzabodem
    SET naam = "Italian Pizza",
        omschrijving = "Traditioneel dun uitgeslagen 30 centimeter bodem van vers Domino’s deeg. Lekker dun en krokant gebakken. Met oregano.",
        categorie_id = @pizzabodems_categorie_id,
        diameter=30,
        beschikbaar = 1,
        prijs_id = @pizzabodem_prijs_id;


    INSERT INTO prijs SET bedrag=1, begindatum=NOW();
    SET @pizzabodem_prijs_id = LAST_INSERT_ID();

    INSERT INTO pizzabodem
    SET naam = "Medium Fresh Pan Pizza",
        omschrijving = "De panpizza van Domino’s is een dikke, luchtige bodem van 25 centimeter met een knapperig korstje van boter en kruiden. In een pannetje gebakken.",
        categorie_id = @pizzabodems_categorie_id,
        diameter=25,
        beschikbaar = 1,
        prijs_id = @pizzabodem_prijs_id;


INSERT INTO categorie SET naam="Specials & Pasta's";
SET @hoofdcategorie_id = (SELECT categorie_id FROM categorie WHERE naam="Specials & Pasta's" LIMIT 1);
      INSERT INTO categorie
                  SET naam="Pasta's",
                      hoofdcategorie_id = @hoofdcategorie_id;
INSERT INTO prijs SET bedrag=6.95, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Pasta Pollo",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Pasta's" LIMIT 1),
                      omschrijving = "Verse pasta met alfredo saus, mozzarella, gegrilde kip, basilicum & oregano",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=6.95, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Pasta Bolognese",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Pasta's" LIMIT 1),
                      omschrijving = "Verse pasta met traditionele tomatensaus, gehakt, mozzarella & oregano.",
                      spicy=0,
                      vegetarisch = 0;

SET @hoofdcategorie_id = (SELECT categorie_id FROM categorie WHERE naam="Specials & Pasta's" LIMIT 1);
      INSERT INTO categorie
                  SET naam="Kip, Wedges & Sausjes",
                      hoofdcategorie_id = @hoofdcategorie_id;
INSERT INTO prijs SET bedrag=3.95, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Buffalo Wings",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Kip, Wedges & Sausjes" LIMIT 1),
                      omschrijving = "8 Gemarineerde kippenkluifjes. Kies uw saus (inclusief)",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=3.95, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Kick'n Chicken",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Kip, Wedges & Sausjes" LIMIT 1),
                      omschrijving = "8 Pittig gekruide kipstukjes. Kies uw saus (inclusief)",
                      spicy=1,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=3.95, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Chicken Strippers",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Kip, Wedges & Sausjes" LIMIT 1),
                      omschrijving = "8 Malse kipstukjes in een krokant jasje. Kies uw saus (inclusief)",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=2.95, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Potato Wedges",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Kip, Wedges & Sausjes" LIMIT 1),
                      omschrijving = "Versgebakken aardappelpartjes. Kies uw saus (inclusief)",
                      spicy=0,
                      vegetarisch = 1;

INSERT INTO prijs SET bedrag=0.25, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="BBQ Saus",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Kip, Wedges & Sausjes" LIMIT 1),
                      omschrijving = "undefined",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=0.25, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Chili Saus",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Kip, Wedges & Sausjes" LIMIT 1),
                      omschrijving = "undefined",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=0.25, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Mayonaise Saus",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Kip, Wedges & Sausjes" LIMIT 1),
                      omschrijving = "undefined",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=1, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Zakje Knoflooksaus",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Kip, Wedges & Sausjes" LIMIT 1),
                      omschrijving = "undefined",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=5.95, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Chicken Combobox",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Kip, Wedges & Sausjes" LIMIT 1),
                      omschrijving = "4 Buffalo Wings, 4 Chicken Strippers & 4 Kick'n Chicken",
                      spicy=0,
                      vegetarisch = 0;

SET @hoofdcategorie_id = (SELECT categorie_id FROM categorie WHERE naam="Specials & Pasta's" LIMIT 1);
      INSERT INTO categorie
                  SET naam="Broodproducten",
                      hoofdcategorie_id = @hoofdcategorie_id;
INSERT INTO prijs SET bedrag=1.95, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Stokbrood Kruidenboter",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Broodproducten" LIMIT 1),
                      omschrijving = "Versgebakken stokbroodje gevuld met kruidenboter",
                      spicy=0,
                      vegetarisch = 1;

INSERT INTO prijs SET bedrag=1, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Cheese Bites",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Broodproducten" LIMIT 1),
                      omschrijving = "Versgebakken deegrolletjes met Emmentaler-kaas",
                      spicy=0,
                      vegetarisch = 1;

INSERT INTO prijs SET bedrag=1.95, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Cheesy Bread",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Broodproducten" LIMIT 1),
                      omschrijving = "Versgebakken kaasbroodje",
                      spicy=0,
                      vegetarisch = 1;

SET @hoofdcategorie_id = (SELECT categorie_id FROM categorie WHERE naam="Specials & Pasta's" LIMIT 1);
      INSERT INTO categorie
                  SET naam="Salade",
                      hoofdcategorie_id = @hoofdcategorie_id;
INSERT INTO prijs SET bedrag=2.5, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Fresh Salad",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Salade" LIMIT 1),
                      omschrijving = "Met Ceasar dressing",
                      spicy=0,
                      vegetarisch = 1;

INSERT INTO categorie SET naam="Drinks & Desserts";
SET @hoofdcategorie_id = (SELECT categorie_id FROM categorie WHERE naam="Drinks & Desserts" LIMIT 1);
      INSERT INTO categorie
                  SET naam="Desserts",
                      hoofdcategorie_id = @hoofdcategorie_id;
INSERT INTO prijs SET bedrag=2.95, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Cinnastix",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Desserts" LIMIT 1),
                      omschrijving = "Vergebakken kaneelbroodje, inclusief sweet vanilla icing dipsaus.",
                      spicy=0,
                      vegetarisch = 1;

INSERT INTO prijs SET bedrag=1.95, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Poffertjes",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Desserts" LIMIT 1),
                      omschrijving = "Poffertjes met poedersuiker & boter",
                      spicy=0,
                      vegetarisch = 1;

INSERT INTO prijs SET bedrag=1.95, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Hot Choco Cakes",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Desserts" LIMIT 1),
                      omschrijving = "Versgebakken chocolade cakejes met zachte vulling",
                      spicy=0,
                      vegetarisch = 1;

INSERT INTO prijs SET bedrag=1.95, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Roomsoesjes",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Desserts" LIMIT 1),
                      omschrijving = "6 Soesjes gevuld met banketbakkersroom",
                      spicy=0,
                      vegetarisch = 1;

INSERT INTO prijs SET bedrag=0.5, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Sweet Icing Saus",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Desserts" LIMIT 1),
                      omschrijving = "undefined",
                      spicy=0,
                      vegetarisch = 1;

INSERT INTO prijs SET bedrag=5.95, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Dessert Box",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Desserts" LIMIT 1),
                      omschrijving = "10 Poffertjes, 6 Cinnabites & 4 Hot Choco Cakes. Heerlijk met Sweet Icing Dipsaus (bij te bestellen voor €0,50)",
                      spicy=0,
                      vegetarisch = 1;

INSERT INTO prijs SET bedrag=1.95, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="Cinnabites",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Desserts" LIMIT 1),
                      omschrijving = "Cinnabites





Verse deegbolletjes bestrooid met kaneelsuiker. Heerlijk met Sweet Icing Dipsaus (optioneel +€0,50)",
                      spicy=0,
                      vegetarisch = 0;

SET @hoofdcategorie_id = (SELECT categorie_id FROM categorie WHERE naam="Drinks & Desserts" LIMIT 1);
      INSERT INTO categorie
                  SET naam="Drinks",
                      hoofdcategorie_id = @hoofdcategorie_id;
INSERT INTO prijs SET bedrag=1.5, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="0.5 liter Chaudfontaine",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Drinks" LIMIT 1),
                      omschrijving = "0.5 liter Chaudfontaine",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=2.25, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="0.25 liter Red Bull Regular",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Drinks" LIMIT 1),
                      omschrijving = "0.25 liter Red Bull Regular",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=1.5, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="0.33 liter Coca Cola",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Drinks" LIMIT 1),
                      omschrijving = "0.33 liter Coca Cola",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=1.5, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="0.33 liter Coca-Cola Zero",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Drinks" LIMIT 1),
                      omschrijving = "0.33 liter Coca-Cola Zero",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=1.5, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="0.33 liter Coca-Cola Light",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Drinks" LIMIT 1),
                      omschrijving = "0.33 liter Coca-Cola Light",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=1.5, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="0.33 liter Sprite",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Drinks" LIMIT 1),
                      omschrijving = "0.33 liter Sprite",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=1.5, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="0.33 liter Fanta",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Drinks" LIMIT 1),
                      omschrijving = "0.33 liter Fanta",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=1.5, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="0.33 liter Nestea Sparkling Lemon",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Drinks" LIMIT 1),
                      omschrijving = "0.33 liter Nestea Sparkling Lemon",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=3.25, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="1.5 liter Coca-Cola",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Drinks" LIMIT 1),
                      omschrijving = "1.5 liter Coca-Cola",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=6.5, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="500ml B & J Ice Cream",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Desserts" LIMIT 1),
                      omschrijving = "undefined",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=1.5, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="0.33 liter Fernandes",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Drinks" LIMIT 1),
                      omschrijving = "undefined",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=1, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="0.2 liter Capri Sonne",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Drinks" LIMIT 1),
                      omschrijving = "undefined",
                      spicy=0,
                      vegetarisch = 0;

INSERT INTO prijs SET bedrag=3.5, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();

                  INSERT INTO product
                  SET naam="1.5 liter Fanta",
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="Drinks" LIMIT 1),
                      omschrijving = "1.5 liter Fanta",
                      spicy=0,
                      vegetarisch = 0;



      INSERT INTO categorie SET naam = "Pizza's";
      SET @hoofdcategorie_id = LAST_INSERT_ID();

      INSERT INTO categorie SET naam = "Alle ingredienten";
      SET @ingredienten_categorie_id = LAST_INSERT_ID();

      INSERT INTO prijs SET bedrag=0, begindatum=NOW();
      SET @pizzabodem_prijs_id = LAST_INSERT_ID();

      SET @standaard_pizzabodem_id = (SELECT pizzabodem_id FROM pizzabodem WHERE naam='Medium Pizza');

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


              INSERT INTO klant
              SET adres_id=@klant_adres_id,
                  telefoonnummer="040-1234567",
                  voornaam="Jan",
                  achternaam="de Vries",
                  huisnummer='3',
                  postcode='5612MA';
              SET @bestelling_klant_id = LAST_INSERT_ID();


        SET @filiaal_id = (SELECT filiaal_id FROM filiaal WHERE naam="Eindhoven Tongelre");

        INSERT INTO bestelling
        SET betaaltype = 'cash',
            filiaal_id = @filiaal_id,
            besteldatum = '2018-01-01 18-14-59',
            afhaal_bezorgen = 'Bezorgen',
            afhaal_bezorg_tijd = '2018-01-01 19-44-59',
            klant_id = @bestelling_klant_id,
            totaalprijs=44.75;
        SET @bestelling_id = LAST_INSERT_ID();


        INSERT INTO prijs SET bedrag=8.95, begindatum=NOW(), einddatum=NOW();
        SET @betaalde_prijs_id = LAST_INSERT_ID();


          SET @pizza_standaard_id = (
            SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Bacon Gorgonzola"
          );


            INSERT INTO pizza_samenstelling
            SET bestelling_id = @bestelling_id,
                pizzabodem_id = (SELECT pizzabodem_id FROM pizzabodem WHERE naam="Medium Pizza"),
                naam = (SELECT naam FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                omschrijving = (SELECT omschrijving FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                spicy = (SELECT spicy FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                vegetarisch = (SELECT vegetarisch FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                pizza_standaard_prijs_id = @betaalde_prijs_id,
                pizza_standaard_bezorgtoeslag_id = (SELECT bezorgtoeslag_id FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id);
            SET @pizza_samenstelling_id = LAST_INSERT_ID();

            CALL copyIngredienten(@pizza_standaard_id, @pizza_samenstelling_id);


            INSERT INTO pizza_samenstelling
            SET bestelling_id = @bestelling_id,
                pizzabodem_id = (SELECT pizzabodem_id FROM pizzabodem WHERE naam="Medium Pizza"),
                naam = (SELECT naam FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                omschrijving = (SELECT omschrijving FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                spicy = (SELECT spicy FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                vegetarisch = (SELECT vegetarisch FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                pizza_standaard_prijs_id = @betaalde_prijs_id,
                pizza_standaard_bezorgtoeslag_id = (SELECT bezorgtoeslag_id FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id);
            SET @pizza_samenstelling_id = LAST_INSERT_ID();

            CALL copyIngredienten(@pizza_standaard_id, @pizza_samenstelling_id);


        INSERT INTO prijs SET bedrag=8.95, begindatum=NOW(), einddatum=NOW();
        SET @betaalde_prijs_id = LAST_INSERT_ID();


          SET @pizza_standaard_id = (
            SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Pollo Pomodore"
          );


            INSERT INTO pizza_samenstelling
            SET bestelling_id = @bestelling_id,
                pizzabodem_id = (SELECT pizzabodem_id FROM pizzabodem WHERE naam="Medium Pizza"),
                naam = (SELECT naam FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                omschrijving = (SELECT omschrijving FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                spicy = (SELECT spicy FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                vegetarisch = (SELECT vegetarisch FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                pizza_standaard_prijs_id = @betaalde_prijs_id,
                pizza_standaard_bezorgtoeslag_id = (SELECT bezorgtoeslag_id FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id);
            SET @pizza_samenstelling_id = LAST_INSERT_ID();

            CALL copyIngredienten(@pizza_standaard_id, @pizza_samenstelling_id);


            INSERT INTO pizza_samenstelling
            SET bestelling_id = @bestelling_id,
                pizzabodem_id = (SELECT pizzabodem_id FROM pizzabodem WHERE naam="Medium Pizza"),
                naam = (SELECT naam FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                omschrijving = (SELECT omschrijving FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                spicy = (SELECT spicy FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                vegetarisch = (SELECT vegetarisch FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                pizza_standaard_prijs_id = @betaalde_prijs_id,
                pizza_standaard_bezorgtoeslag_id = (SELECT bezorgtoeslag_id FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id);
            SET @pizza_samenstelling_id = LAST_INSERT_ID();

            CALL copyIngredienten(@pizza_standaard_id, @pizza_samenstelling_id);


            INSERT INTO pizza_samenstelling
            SET bestelling_id = @bestelling_id,
                pizzabodem_id = (SELECT pizzabodem_id FROM pizzabodem WHERE naam="Medium Pizza"),
                naam = (SELECT naam FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                omschrijving = (SELECT omschrijving FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                spicy = (SELECT spicy FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                vegetarisch = (SELECT vegetarisch FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                pizza_standaard_prijs_id = @betaalde_prijs_id,
                pizza_standaard_bezorgtoeslag_id = (SELECT bezorgtoeslag_id FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id);
            SET @pizza_samenstelling_id = LAST_INSERT_ID();

            CALL copyIngredienten(@pizza_standaard_id, @pizza_samenstelling_id);


        SET @filiaal_id = (SELECT filiaal_id FROM filiaal WHERE naam="Eindhoven Tongelre");

        INSERT INTO bestelling
        SET betaaltype = 'cash',
            filiaal_id = @filiaal_id,
            besteldatum = '2018-01-21 21-14-59',
            afhaal_bezorgen = 'Afhalen',
            afhaal_bezorg_tijd = '2018-01-22 18-00-00',
            klant_id = @bestelling_klant_id,
            totaalprijs=18.65;
        SET @bestelling_id = LAST_INSERT_ID();


        INSERT INTO prijs SET bedrag=7.95, begindatum=NOW(), einddatum=NOW();
        SET @betaalde_prijs_id = LAST_INSERT_ID();


          SET @pizza_standaard_id = (
            SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Mixed Grill"
          );


            INSERT INTO prijs SET bedrag=1, begindatum=NOW(), einddatum=NOW();
            SET @ingredient_prijs_id = LAST_INSERT_ID();


            INSERT INTO pizza_samenstelling
            SET bestelling_id = @bestelling_id,
                pizzabodem_id = (SELECT pizzabodem_id FROM pizzabodem WHERE naam="Medium Pizza"),
                naam = (SELECT naam FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                omschrijving = (SELECT omschrijving FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                spicy = (SELECT spicy FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                vegetarisch = (SELECT vegetarisch FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                pizza_standaard_prijs_id = @betaalde_prijs_id,
                pizza_standaard_bezorgtoeslag_id = (SELECT bezorgtoeslag_id FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id);
            SET @pizza_samenstelling_id = LAST_INSERT_ID();

            CALL copyIngredienten(@pizza_standaard_id, @pizza_samenstelling_id);


                INSERT INTO pizza_samenstelling_pizza_ingredient
                SET pizza_samenstelling_id=@pizza_samenstelling_id,
                    pizza_ingredient_id=(SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam='Bacon'),
                    prijs_id=@ingredient_prijs_id,
                    is_standaard=0;


        INSERT INTO prijs SET bedrag=8.95, begindatum=NOW(), einddatum=NOW();
        SET @betaalde_prijs_id = LAST_INSERT_ID();


          SET @pizza_standaard_id = (
            SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Pollo Pomodore"
          );


            INSERT INTO prijs SET bedrag=0.75, begindatum=NOW(), einddatum=NOW();
            SET @ingredient_prijs_id = LAST_INSERT_ID();


            INSERT INTO pizza_samenstelling
            SET bestelling_id = @bestelling_id,
                pizzabodem_id = (SELECT pizzabodem_id FROM pizzabodem WHERE naam="Medium Pizza"),
                naam = (SELECT naam FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                omschrijving = (SELECT omschrijving FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                spicy = (SELECT spicy FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                vegetarisch = (SELECT vegetarisch FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                pizza_standaard_prijs_id = @betaalde_prijs_id,
                pizza_standaard_bezorgtoeslag_id = (SELECT bezorgtoeslag_id FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id);
            SET @pizza_samenstelling_id = LAST_INSERT_ID();

            CALL copyIngredienten(@pizza_standaard_id, @pizza_samenstelling_id);


                INSERT INTO pizza_samenstelling_pizza_ingredient
                SET pizza_samenstelling_id=@pizza_samenstelling_id,
                    pizza_ingredient_id=(SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam='Zon gedroogde tomaten'),
                    prijs_id=@ingredient_prijs_id,
                    is_standaard=0;


        SET @filiaal_id = (SELECT filiaal_id FROM filiaal WHERE naam="Eindhoven Tongelre");

        INSERT INTO bestelling
        SET betaaltype = 'cash',
            filiaal_id = @filiaal_id,
            besteldatum = '2018-01-23 21-14-59',
            afhaal_bezorgen = 'Afhalen',
            afhaal_bezorg_tijd = '2018-01-23 22-15-00',
            klant_id = @bestelling_klant_id,
            totaalprijs=27.65;
        SET @bestelling_id = LAST_INSERT_ID();


        INSERT INTO prijs SET bedrag=11.95, begindatum=NOW(), einddatum=NOW();
        SET @betaalde_prijs_id = LAST_INSERT_ID();


          SET @pizza_standaard_id = (
            SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="BBQ Mixed Grill"
          );


            INSERT INTO prijs SET bedrag=2, begindatum=NOW(), einddatum=NOW();
            SET @ingredient_prijs_id = LAST_INSERT_ID();


            INSERT INTO pizza_samenstelling
            SET bestelling_id = @bestelling_id,
                pizzabodem_id = (SELECT pizzabodem_id FROM pizzabodem WHERE naam="Large Pizza"),
                naam = (SELECT naam FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                omschrijving = (SELECT omschrijving FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                spicy = (SELECT spicy FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                vegetarisch = (SELECT vegetarisch FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                pizza_standaard_prijs_id = @betaalde_prijs_id,
                pizza_standaard_bezorgtoeslag_id = (SELECT bezorgtoeslag_id FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id);
            SET @pizza_samenstelling_id = LAST_INSERT_ID();

            CALL copyIngredienten(@pizza_standaard_id, @pizza_samenstelling_id);


                INSERT INTO pizza_samenstelling_pizza_ingredient
                SET pizza_samenstelling_id=@pizza_samenstelling_id,
                    pizza_ingredient_id=(SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam='Bacon'),
                    prijs_id=@ingredient_prijs_id,
                    is_standaard=0;


                INSERT INTO pizza_samenstelling_pizza_ingredient
                SET pizza_samenstelling_id=@pizza_samenstelling_id,
                    pizza_ingredient_id=(SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam='Bacon'),
                    prijs_id=@ingredient_prijs_id,
                    is_standaard=0;


        INSERT INTO prijs SET bedrag=12.95, begindatum=NOW(), einddatum=NOW();
        SET @betaalde_prijs_id = LAST_INSERT_ID();


          SET @pizza_standaard_id = (
            SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Pollo Pomodore"
          );


            INSERT INTO prijs SET bedrag=0.75, begindatum=NOW(), einddatum=NOW();
            SET @ingredient_prijs_id = LAST_INSERT_ID();


            INSERT INTO pizza_samenstelling
            SET bestelling_id = @bestelling_id,
                pizzabodem_id = (SELECT pizzabodem_id FROM pizzabodem WHERE naam="Large Pizza"),
                naam = (SELECT naam FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                omschrijving = (SELECT omschrijving FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                spicy = (SELECT spicy FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                vegetarisch = (SELECT vegetarisch FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                pizza_standaard_prijs_id = @betaalde_prijs_id,
                pizza_standaard_bezorgtoeslag_id = (SELECT bezorgtoeslag_id FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id);
            SET @pizza_samenstelling_id = LAST_INSERT_ID();

            CALL copyIngredienten(@pizza_standaard_id, @pizza_samenstelling_id);


                INSERT INTO pizza_samenstelling_pizza_ingredient
                SET pizza_samenstelling_id=@pizza_samenstelling_id,
                    pizza_ingredient_id=(SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam='Zon gedroogde tomaten'),
                    prijs_id=@ingredient_prijs_id,
                    is_standaard=0;


              INSERT INTO klant
              SET adres_id=@klant_adres_id,
                  telefoonnummer="040-7654321",
                  voornaam="Piet",
                  achternaam="Paulusma",
                  huisnummer='11a',
                  postcode='5611NN';
              SET @bestelling_klant_id = LAST_INSERT_ID();


        SET @filiaal_id = (SELECT filiaal_id FROM filiaal WHERE naam="Eindhoven Woensel");

        INSERT INTO bestelling
        SET betaaltype = 'cash',
            filiaal_id = @filiaal_id,
            besteldatum = '2018-01-24 18-20-00',
            afhaal_bezorgen = 'Afhalen',
            afhaal_bezorg_tijd = '2018-01-25 18-45-00',
            klant_id = @bestelling_klant_id,
            totaalprijs=13.95;
        SET @bestelling_id = LAST_INSERT_ID();


        INSERT INTO prijs SET bedrag=8.95, begindatum=NOW(), einddatum=NOW();
        SET @betaalde_prijs_id = LAST_INSERT_ID();


          SET @pizza_standaard_id = (
            SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="Shoarma"
          );


            INSERT INTO pizza_samenstelling
            SET bestelling_id = @bestelling_id,
                pizzabodem_id = (SELECT pizzabodem_id FROM pizzabodem WHERE naam="Italian Pizza"),
                naam = (SELECT naam FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                omschrijving = (SELECT omschrijving FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                spicy = (SELECT spicy FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                vegetarisch = (SELECT vegetarisch FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                pizza_standaard_prijs_id = @betaalde_prijs_id,
                pizza_standaard_bezorgtoeslag_id = (SELECT bezorgtoeslag_id FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id);
            SET @pizza_samenstelling_id = LAST_INSERT_ID();

            CALL copyIngredienten(@pizza_standaard_id, @pizza_samenstelling_id);


        INSERT INTO prijs SET bedrag=2.5, begindatum=NOW(), einddatum=NOW();
        SET @betaalde_prijs_id = LAST_INSERT_ID();


          INSERT INTO bestelregel
          SET bestelling_id=@bestelling_id,
              product_id=(SELECT product_id FROM product WHERE naam="Fresh Salad"),
              prijs_id=@betaalde_prijs_id,
              aantal=2;



        SET @filiaal_id = (SELECT filiaal_id FROM filiaal WHERE naam="Eindhoven Woensel");

        INSERT INTO bestelling
        SET betaaltype = 'cash',
            filiaal_id = @filiaal_id,
            besteldatum = '2018-01-27 17-15-00',
            afhaal_bezorgen = 'Bezorgen',
            afhaal_bezorg_tijd = NULL,
            klant_id = @bestelling_klant_id,
            totaalprijs=26.349999999999998;
        SET @bestelling_id = LAST_INSERT_ID();


        INSERT INTO prijs SET bedrag=5.95, begindatum=NOW(), einddatum=NOW();
        SET @betaalde_prijs_id = LAST_INSERT_ID();


          INSERT INTO bestelregel
          SET bestelling_id=@bestelling_id,
              product_id=(SELECT product_id FROM product WHERE naam="Chicken Combobox"),
              prijs_id=@betaalde_prijs_id,
              aantal=2;



        INSERT INTO prijs SET bedrag=1.5, begindatum=NOW(), einddatum=NOW();
        SET @betaalde_prijs_id = LAST_INSERT_ID();


          INSERT INTO bestelregel
          SET bestelling_id=@bestelling_id,
              product_id=(SELECT product_id FROM product WHERE naam="0.33 liter Coca Cola"),
              prijs_id=@betaalde_prijs_id,
              aantal=1;



        INSERT INTO prijs SET bedrag=6.5, begindatum=NOW(), einddatum=NOW();
        SET @betaalde_prijs_id = LAST_INSERT_ID();


          INSERT INTO bestelregel
          SET bestelling_id=@bestelling_id,
              product_id=(SELECT product_id FROM product WHERE naam="500ml B & J Ice Cream"),
              prijs_id=@betaalde_prijs_id,
              aantal=1;



        INSERT INTO prijs SET bedrag=6.45, begindatum=NOW(), einddatum=NOW();
        SET @betaalde_prijs_id = LAST_INSERT_ID();


          INSERT INTO bestelregel
          SET bestelling_id=@bestelling_id,
              product_id=(SELECT product_id FROM product WHERE naam="Dessert Box"),
              prijs_id=@betaalde_prijs_id,
              aantal=1;