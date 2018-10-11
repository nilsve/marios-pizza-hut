
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS bestelregel ;
DROP TABLE IF EXISTS product ;
DROP TABLE IF EXISTS pizza_standaard_pizza_ingredient ;
DROP TABLE IF EXISTS pizza_standaard ;
DROP TABLE IF EXISTS pizza_samenstelling_ingredient ;
DROP TABLE IF EXISTS pizza_samenstelling ;
DROP TABLE IF EXISTS pizza_ingredient ;
DROP TABLE IF EXISTS pizzabodem ;
DROP TABLE IF EXISTS openingstijden ;
DROP TABLE IF EXISTS bestelling ;
DROP TABLE IF EXISTS categorie ;
DROP TABLE IF EXISTS betaaltype ;
DROP TABLE IF EXISTS prijs ;
DROP TABLE IF EXISTS klant ;
DROP TABLE IF EXISTS coupon ;
DROP TABLE IF EXISTS filiaal ;
DROP TABLE IF EXISTS adres ;
DROP TABLE IF EXISTS postcode ;

-- -----------------------------------------------------
-- Table postcode
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS postcode (
  postcode_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  postcode CHAR(6) NOT NULL,
  reeks INT(1) NOT NULL,
  eerste_huis INT(11) NOT NULL,
  laatste_huis INT(11) NOT NULL,
  woonplaats VARCHAR(75) NOT NULL,
  straatnaam VARCHAR(125) NOT NULL,
  PRIMARY KEY (postcode_id)
  );

-- -----------------------------------------------------
-- Table adres
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS adres (
  adres_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  postcode_id INT UNSIGNED NOT NULL,
  huisnummer INT(12) NOT NULL,
  toevoeging VARCHAR(12) NOT NULL,
  woonplaats VARCHAR(75) NOT NULL,
  straatnaam VARCHAR(125) NOT NULL,
  PRIMARY KEY (adres_id),
  FOREIGN KEY (postcode_id) REFERENCES postcode ( postcode_id )
);

-- -----------------------------------------------------
-- Table prijs
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS prijs (
  prijs_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  bedrag DECIMAL(4,2) NOT NULL
    CHECK ( bedrag >= 0 ),
  begindatum DATETIME NOT NULL DEFAULT NOW(),
  einddatum DATETIME NULL,
  PRIMARY KEY (prijs_id),
  
);

-- -----------------------------------------------------
-- Table betaaltype
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS betaaltype (
  betaaltype_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  type VARCHAR(45) NOT NULL,
  omschrijving VARCHAR(300) NULL,
  PRIMARY KEY (betaaltype_id)
);

-- -----------------------------------------------------
-- Table categorie
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS categorie (
  categorie_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  naam VARCHAR(100) NULL,
  hoofdcategorie_id INT UNSIGNED NULL,
  PRIMARY KEY (categorie_id),
  FOREIGN KEY (hoofdcategorie_id) REFERENCES categorie (categorie_id)
);


-- -----------------------------------------------------
-- Table filiaal
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS filiaal (
  filiaal_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  adres_id INT UNSIGNED NOT NULL,
  naam VARCHAR(45) NOT NULL,
  telefoonnummer INT(8) NOT NULL,
  PRIMARY KEY (filiaal_id),
  FOREIGN KEY (adres_id) REFERENCES adres (adres_id)
);

-- -----------------------------------------------------
-- Table coupon
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS coupon (
  coupon_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  filiaal_id INT UNSIGNED NULL,
  couponcode INT(5) NULL,
  omschrijving VARCHAR(300) NOT NULL,
  type ENUM("percentage", "bedrag") NOT NULL,
  kortingspercentage DECIMAL NULL 
    CHECK ( kortingspercentage > 0 ),
  korting INT NULL 
    CHECK ( korting > 0 ),
  beschikbaar TINYINT(1) NOT NULL DEFAULT 1 
    CHECK ( beschikbaar IN (0, 1) ),
  PRIMARY KEY (coupon_id),
  FOREIGN KEY (filiaal_id) REFERENCES filiaal (filiaal_id)
);

-- -----------------------------------------------------
-- Table klant
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS klant (
  klant_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  adres_id INT UNSIGNED NULL,
  telefoonnummer VARCHAR(10) NOT NULL,
  postcode VARCHAR(6) NULL,
  huisnummer VARCHAR(10) NULL,
  voornaam VARCHAR(25) NOT NULL,
  achternaam VARCHAR(55) NOT NULL,
  PRIMARY KEY (klant_id),
  FOREIGN KEY (adres_id) REFERENCES adres (adres_id)
);


-- -----------------------------------------------------
-- Table openingstijden
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS openingstijden (
  openingstijden_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  filiaal_id INT UNSIGNED NOT NULL,
  dagnaam ENUM("maandag", "dinsdag", "woensdag", "donderdag", "vrijdag", "zaterdag", "zondag") NOT NULL,
  dagnummer INT NOT NULL
    CHECK ( dagnummer BETWEEN 1 AND 7 ),
  open VARCHAR(15) NULL,
  dicht VARCHAR(15) NULL,
  PRIMARY KEY (openingstijden_id),
  FOREIGN KEY (filiaal_id) REFERENCES filiaal (filiaal_id)
);


-- -----------------------------------------------------
-- Table pizzabodem
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS pizzabodem (
  pizzabodem_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  categorie_id INT UNSIGNED NOT NULL,
  prijs_id INT UNSIGNED NULL,
  naam VARCHAR(45) NOT NULL,
  diameter INT NOT NULL,
  omschrijving VARCHAR(300) NULL,
  beschikbaar TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (pizzabodem_id),
  FOREIGN KEY (categorie_id) REFERENCES categorie (categorie_id),
  FOREIGN KEY (prijs_id) REFERENCES prijs (prijs_id)
);

-- -----------------------------------------------------
-- Table pizza_ingredient
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS pizza_ingredient (
  pizza_ingredient_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  categorie_id INT UNSIGNED NOT NULL,
  prijs_id INT UNSIGNED NULL,
  naam VARCHAR(255) NULL,
  omschrijving TEXT(1) NULL,
  beschikbaar TINYINT(1) NOT NULL DEFAULT 1
    CHECK ( beschikbaar IN (0, 1) ),
  type ENUM("saus", "topping") NULL,
  PRIMARY KEY (pizza_ingredient_id),
  FOREIGN KEY (categorie_id) REFERENCES categorie (categorie_id),
  FOREIGN KEY (prijs_id) REFERENCES prijs (prijs_id)
);

-- -----------------------------------------------------
-- Table pizza_samenstelling
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS pizza_samenstelling (
  pizza_samenstelling_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  bestelling_id INT UNSIGNED NOT NULL,
  pizzabodem_id INT UNSIGNED NOT NULL,
  naam VARCHAR(45) NOT NULL,
  omschrijving VARCHAR(45) NULL,
  spicy TINYINT(1) NOT NULL
    CHECK ( spicy IN (0, 1) ),
  vegetarisch TINYINT(1) NOT NULL
    CHECK ( vegetarisch IN (0, 1) ),
  beschikbaar TINYINT(1) NOT NULL DEFAULT 1
    CHECK ( beschikbaar IN (0, 1) ),
  pizza_standaard_prijs_id INT UNSIGNED NULL,
  pizza_standaard_bezorgtoeslag_id INT UNSIGNED NULL,
  PRIMARY KEY (pizza_samenstelling_id),
  FOREIGN KEY (pizzabodem_id) REFERENCES pizzabodem (pizzabodem_id),
  FOREIGN KEY (pizza_standaard_bezorgtoeslag_id) REFERENCES prijs (prijs_id),
  FOREIGN KEY (pizza_standaard_prijs_id) REFERENCES prijs (prijs_id)
);

-- -----------------------------------------------------
-- Table pizza_samenstelling_ingredient
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS pizza_samenstelling_ingredient (
  pizza_samenstelling_id INT UNSIGNED NOT NULL,
  pizza_ingredient_id INT UNSIGNED NOT NULL,
  prijs_id INT UNSIGNED NOT NULL,
  is_standaard TINYINT(1) NULL
    CHECK ( is_standaard IN (0, 1) ),
  PRIMARY KEY (pizza_samenstelling_id, pizza_ingredient_id),
  FOREIGN KEY (prijs_id) REFERENCES prijs (prijs_id),
  FOREIGN KEY (pizza_ingredient_id) REFERENCES pizza_ingredient (pizza_ingredient_id),
  FOREIGN KEY (pizza_samenstelling_id) REFERENCES pizza_samenstelling (pizza_samenstelling_id)
);


-- -----------------------------------------------------
-- Table pizza_standaard
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS pizza_standaard (
  pizza_standaard_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  prijs_id INT UNSIGNED NULL,
  bezorgtoeslag_id INT UNSIGNED NULL,
  pizzabodem_id INT UNSIGNED NOT NULL,
  naam VARCHAR(45) NOT NULL,
  omschrijving VARCHAR(45) NULL,
  spicy TINYINT(1) NOT NULL
    CHECK ( spicy IN (0, 1) ),
  vegetarisch TINYINT(1) NOT NULL
    CHECK ( vegetarisch IN (0, 1) ),
  beschikbaar TINYINT(1) NOT NULL DEFAULT 1
    CHECK ( beschikbaar IN (0, 1) ),
  categorie_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (pizza_standaard_id),
  FOREIGN KEY (pizzabodem_id) REFERENCES pizzabodem (pizzabodem_id),
  FOREIGN KEY (prijs_id) REFERENCES prijs (prijs_id),
  FOREIGN KEY (bezorgtoeslag_id) REFERENCES prijs (prijs_id),
  FOREIGN KEY (categorie_id) REFERENCES categorie (categorie_id)  
);


-- -----------------------------------------------------
-- Table pizza_standaard_pizza_ingredient
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS pizza_standaard_pizza_ingredient (
  pizza_standaard_id INT UNSIGNED NOT NULL,
  pizza_ingredient_id INT UNSIGNED NOT NULL,
  aantal INT(2) NOT NULL DEFAULT 1
    CHECK ( aantal BETWEEN 1 AND 11 ),
  PRIMARY KEY (pizza_standaard_id, pizza_ingredient_id),
  FOREIGN KEY (pizza_standaard_id) REFERENCES pizza_standaard (pizza_standaard_id),
  FOREIGN KEY (pizza_ingredient_id) REFERENCES pizza_ingredient (pizza_ingredient_id)
);

-- -----------------------------------------------------
-- Table product
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS product (
  product_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  hoofd_product_id INT UNSIGNED,
  categorie_id INT UNSIGNED DEFAULT NULL,
  prijs_id INT UNSIGNED NULL,
  naam VARCHAR(255) NOT NULL,
  omschrijving TEXT(1) NULL,
  spicy TINYINT(1) NULL
    CHECK ( spicy IN (0, 1) ),
  vegetarisch TINYINT(1) NULL
    CHECK ( vegetarisch IN (0, 1) ),
  beschikbaar TINYINT(1) NOT NULL DEFAULT 1
    CHECK ( beschikbaar IN (0, 1) ),
  PRIMARY KEY (product_id),
  FOREIGN KEY (hoofd_product_id) REFERENCES product (product_id),
  FOREIGN KEY (prijs_id) REFERENCES prijs (prijs_id),
  FOREIGN KEY (categorie_id) REFERENCES categorie (categorie_id)
);

-- -----------------------------------------------------
-- Table bestelling
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS bestelling (
  bestelling_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  betaaltype_id INT UNSIGNED,
  filiaal_id INT UNSIGNED NOT NULL,
  klant_id INT UNSIGNED NOT NULL,
  besteldatum DATETIME NULL,
  afhaal_bezorgen ENUM("afhalen", "bezorgen") NULL,
  afhaal_bezorg_tijd DATETIME NULL,
  coupon_id INT UNSIGNED NULL,
  totaalprijs INT NOT NULL,
  PRIMARY KEY (bestelling_id),
  FOREIGN KEY (filiaal_id) REFERENCES filiaal (filiaal_id),
  FOREIGN KEY (betaaltype_id) REFERENCES betaaltype (betaaltype_id),
  FOREIGN KEY (klant_id) REFERENCES klant (klant_id),
  FOREIGN KEY (coupon_id) REFERENCES coupon (coupon_id)
);

-- -----------------------------------------------------
-- Table bestelling
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS bestelregel (
  bestelregel_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  bestelling_id INT UNSIGNED NOT NULL,
  product_id INT UNSIGNED NOT NULL,
  prijs_id INT UNSIGNED NULL,
  prijs_optie_id INT UNSIGNED NULL,
  aantal INT (3) NOT NULL
    CHECK ( aantal >= 1 ),
  PRIMARY KEY (bestelregel_id),
  FOREIGN KEY (bestelling_id) REFERENCES bestelling (bestelling_id),
  FOREIGN KEY (product_id) REFERENCES product (product_id),
  FOREIGN KEY (prijs_id) REFERENCES prijs (prijs_id),
  FOREIGN KEY (prijs_optie_id) REFERENCES prijs (prijs_id)
);

ALTER TABLE pizza_samenstelling ADD FOREIGN KEY (bestelling_id) REFERENCES bestelling (bestelling_id);

SET FOREIGN_KEY_CHECKS = 1;