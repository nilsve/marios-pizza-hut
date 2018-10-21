
SET FOREIGN_KEY_CHECKS = 0;

-- -----------------------------------------------------
-- Table `postcode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `postcode` ;

CREATE TABLE IF NOT EXISTS `postcode` (
  `postcode_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `postcode` CHAR(6) NOT NULL,
  `reeks` INT(1) NOT NULL,
  `eerste_huis` INT(11) NOT NULL,
  `laatste_huis` INT(11) NOT NULL,
  `woonplaats` VARCHAR(75) NOT NULL,
  `straatnaam` VARCHAR(125) NOT NULL,
  PRIMARY KEY (`postcode_id`)
);

-- -----------------------------------------------------
-- Table `adres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adres` ;

CREATE TABLE IF NOT EXISTS `adres` (
  `adres_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `postcode` VARCHAR(12) NOT NULL,
  `huisnummer` INT(12) NOT NULL,
  `toevoeging` VARCHAR(12) NULL,
  `woonplaats` VARCHAR(75) NOT NULL,
  `straatnaam` VARCHAR(125) NOT NULL,
  PRIMARY KEY (`adres_id`)
);

-- -----------------------------------------------------
-- Table `prijs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prijs` ;

CREATE TABLE IF NOT EXISTS `prijs` (
  `prijs_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `bedrag` DECIMAL(4,2) NOT NULL
      CHECK ( bedrag >= 0 ),
  `begindatum` DATETIME NOT NULL,
  `einddatum` DATETIME NULL,
  PRIMARY KEY (`prijs_id`)
);

-- -----------------------------------------------------
-- Table `categorie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `categorie` ;

CREATE TABLE IF NOT EXISTS `categorie` (
  `categorie_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `naam` VARCHAR(100) NULL,
  `hoofdcategorie_id` INT UNSIGNED NULL,
  PRIMARY KEY (`categorie_id`),
  CONSTRAINT FOREIGN KEY (`hoofdcategorie_id`) REFERENCES `categorie` (`categorie_id`)
);


-- -----------------------------------------------------
-- Table `filiaal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `filiaal` ;

CREATE TABLE IF NOT EXISTS `filiaal` (
  `filiaal_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `adres_id` INT UNSIGNED NOT NULL,
  `naam` VARCHAR(45) NOT NULL,
  `telefoonnummer` VARCHAR (50) NOT NULL,
  PRIMARY KEY (`filiaal_id`),
  CONSTRAINT FOREIGN KEY (`adres_id`) REFERENCES `adres` (`adres_id`)
);

-- -----------------------------------------------------
-- Table `coupon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coupon` ;

CREATE TABLE IF NOT EXISTS `coupon` (
  `coupon_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `filiaal_id` INT UNSIGNED NULL,
  `couponcode` INT(5) NULL,
  `omschrijving` VARCHAR(300) NOT NULL,
  `type` ENUM("percentage", "bedrag") NOT NULL,
  `kortingspercentage` DECIMAL NULL
    CHECK ( kortingspercentage > 0 ),
  `korting` INT NULL
    CHECK ( korting > 0 ),
  `beschikbaar` TINYINT(1) NOT NULL DEFAULT 1
    CHECK ( beschikbaar IN (0, 1) ),
  PRIMARY KEY (`coupon_id`),
  CONSTRAINT FOREIGN KEY (`filiaal_id`) REFERENCES `filiaal` (`filiaal_id`),
  CHECK (`type` in (`KORTINGSPERCENTAGE`, `KORTINGSBEDRAG`))
);

-- -----------------------------------------------------
-- Table `klant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `klant` ;

CREATE TABLE IF NOT EXISTS `klant` (
  `klant_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `adres_id` INT UNSIGNED NULL,
  `telefoonnummer` VARCHAR (50) NOT NULL,
  `postcode` VARCHAR(6) NULL,
  `huisnummer` VARCHAR(10) NULL,
  `voornaam` VARCHAR(25) NOT NULL,
  `achternaam` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`klant_id`),
  CONSTRAINT FOREIGN KEY (`adres_id`) REFERENCES `adres` (`adres_id`)
);


-- -----------------------------------------------------
-- Table `openingstijden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openingstijden` ;

CREATE TABLE IF NOT EXISTS `openingstijden` (
  `openingstijden_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `filiaal_id` INT UNSIGNED NOT NULL,
  `dagnaam` ENUM("maandag", "dinsdag", "woensdag", "donderdag", "vrijdag", "zaterdag", "zondag") NOT NULL,
  `dagnummer` INT NOT NULL
    CHECK ( dagnummer BETWEEN 1 AND 7 ),    
  `open` VARCHAR(15) NULL,
  `dicht` VARCHAR(15) NULL,
  PRIMARY KEY (`openingstijden_id`),
  CONSTRAINT FOREIGN KEY (`filiaal_id`) REFERENCES `filiaal` (`filiaal_id`)
);


-- -----------------------------------------------------
-- Table `pizzabodem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pizzabodem` ;

CREATE TABLE IF NOT EXISTS `pizzabodem` (
  `pizzabodem_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `categorie_id` INT UNSIGNED NOT NULL,
  `prijs_id` INT UNSIGNED NULL,
  `naam` VARCHAR(45) NOT NULL,
  `diameter` DECIMAL(4,2) NOT NULL,
  `omschrijving` VARCHAR(300) NULL,
  `beschikbaar` TINYINT(1) NOT NULL DEFAULT 1
    CHECK ( beschikbaar IN (0, 1) ),
  PRIMARY KEY (`pizzabodem_id`),
  CONSTRAINT FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`categorie_id`),
  CONSTRAINT FOREIGN KEY (`prijs_id`) REFERENCES `prijs` (`prijs_id`)
);

-- -----------------------------------------------------
-- Table `pizza_ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pizza_ingredient` ;

CREATE TABLE IF NOT EXISTS `pizza_ingredient` (
  `pizza_ingredient_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `categorie_id` INT UNSIGNED NOT NULL,
  `prijs_id` INT UNSIGNED NULL,
  `naam` VARCHAR(255) NULL,
  `omschrijving` TEXT(1) NULL,
  `beschikbaar` TINYINT(1) NOT NULL DEFAULT 1
    CHECK ( beschikbaar IN (0, 1) ),
  `type` ENUM("saus", "topping") NULL,
  PRIMARY KEY (`pizza_ingredient_id`),
  CONSTRAINT FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`categorie_id`),
  CONSTRAINT FOREIGN KEY (`prijs_id`) REFERENCES `prijs` (`prijs_id`)
);

-- -----------------------------------------------------
-- Table `pizza_samenstelling`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pizza_samenstelling` ;

CREATE TABLE IF NOT EXISTS `pizza_samenstelling` (
  `pizza_samenstelling_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `bestelling_id` INT UNSIGNED NOT NULL,
  `pizzabodem_id` INT UNSIGNED NOT NULL,
  `naam` VARCHAR(45) NOT NULL,
  `omschrijving` VARCHAR(45) NULL,
  `spicy` TINYINT(1) NOT NULL
    CHECK ( spicy IN (0, 1) ),
  `vegetarisch` TINYINT(1) NOT NULL
    CHECK ( vegetarisch IN (0, 1) ),
  `beschikbaar` TINYINT(1) NOT NULL DEFAULT 1
    CHECK ( beschikbaar IN (0, 1) ),
  `pizza_standaard_prijs_id` INT UNSIGNED NULL,
  `pizza_standaard_bezorgtoeslag_id` INT UNSIGNED NULL,
  PRIMARY KEY (`pizza_samenstelling_id`),
  CONSTRAINT FOREIGN KEY (`pizzabodem_id`) REFERENCES `pizzabodem` (`pizzabodem_id`),
  CONSTRAINT FOREIGN KEY (`bestelling_id`) REFERENCES `bestelling` (`bestelling_id`),
  CONSTRAINT FOREIGN KEY (`pizza_standaard_bezorgtoeslag_id`) REFERENCES `prijs` (`prijs_id`),
  CONSTRAINT FOREIGN KEY (`pizza_standaard_prijs_id`) REFERENCES `prijs` (`prijs_id`)
);

-- -----------------------------------------------------
-- Table `pizza_samenstelling_ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pizza_samenstelling_ingredient` ;

CREATE TABLE IF NOT EXISTS `pizza_samenstelling_ingredient` (
  `pizza_samenstelling_id` INT UNSIGNED NOT NULL,
  `pizza_ingredient_id` INT UNSIGNED NOT NULL,
  `prijs_id` INT UNSIGNED NOT NULL,
  `is_standaard` TINYINT(1) NULL
    CHECK ( is_standaard IN (0, 1) ),    
  PRIMARY KEY (`pizza_samenstelling_id`, `pizza_ingredient_id`),
  CONSTRAINT FOREIGN KEY (`prijs_id`) REFERENCES `prijs` (`prijs_id`),
  CONSTRAINT FOREIGN KEY (`pizza_ingredient_id`) REFERENCES `pizza_ingredient` (`pizza_ingredient_id`),
  CONSTRAINT FOREIGN KEY (`pizza_samenstelling_id`) REFERENCES `pizza_samenstelling` (`pizza_samenstelling_id`)
);


-- -----------------------------------------------------
-- Table `pizza_standaard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pizza_standaard` ;

CREATE TABLE IF NOT EXISTS `pizza_standaard` (
  `pizza_standaard_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `prijs_id` INT UNSIGNED NULL,
  `bezorgtoeslag_id` INT UNSIGNED NULL,
  `pizzabodem_id` INT UNSIGNED NOT NULL,
  `naam` VARCHAR(45) NOT NULL,
  `omschrijving` VARCHAR(45) NULL,
  `spicy` TINYINT(1) NOT NULL
    CHECK ( spicy IN (0, 1) ),
  `vegetarisch` TINYINT(1) NOT NULL
    CHECK ( vegetarisch IN (0, 1) ),    
  `beschikbaar` TINYINT(1) NOT NULL DEFAULT 1
    CHECK ( beschikbaar IN (0, 1) ),
  `categorie_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`pizza_standaard_id`),
  CONSTRAINT FOREIGN KEY (`pizzabodem_id`) REFERENCES `pizzabodem` (`pizzabodem_id`),
  CONSTRAINT FOREIGN KEY (`prijs_id`) REFERENCES `prijs` (`prijs_id`),
  CONSTRAINT FOREIGN KEY (`bezorgtoeslag_id`) REFERENCES `prijs` (`prijs_id`),
  CONSTRAINT FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`categorie_id`)

);


-- -----------------------------------------------------
-- Table `pizza_standaard_pizza_ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pizza_standaard_pizza_ingredient` ;

CREATE TABLE IF NOT EXISTS `pizza_standaard_pizza_ingredient` (
  `pizza_standaard_id` INT UNSIGNED NOT NULL,
  `pizza_ingredient_id` INT UNSIGNED NOT NULL,
  `aantal` INT NOT NULL DEFAULT 1
    CHECK ( aantal BETWEEN 1 AND 11 ),
  PRIMARY KEY (`pizza_standaard_id`, `pizza_ingredient_id`),
  CONSTRAINT FOREIGN KEY (`pizza_standaard_id`) REFERENCES `pizza_standaard` (`pizza_standaard_id`),
  CONSTRAINT FOREIGN KEY (`pizza_ingredient_id`) REFERENCES `pizza_ingredient` (`pizza_ingredient_id`)
);

-- -----------------------------------------------------
-- Table `product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product` ;

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `hoofd_product_id` INT UNSIGNED,
  `categorie_id` INT UNSIGNED DEFAULT NULL,
  `prijs_id` INT UNSIGNED NULL,
  `naam` VARCHAR(255) NOT NULL,
  `omschrijving` TEXT(1) NULL,
  `spicy` TINYINT(1) NULL
    CHECK ( spicy IN (0, 1) ),
  `vegetarisch` TINYINT(1) NULL
    CHECK ( vegetarisch IN (0, 1) ),
  `beschikbaar` TINYINT(1) NOT NULL DEFAULT 1
    CHECK ( beschikbaar IN (0, 1) ),
  PRIMARY KEY (`product_id`),
  CONSTRAINT FOREIGN KEY (`hoofd_product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT FOREIGN KEY (`prijs_id`) REFERENCES `prijs` (`prijs_id`),
  CONSTRAINT FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`categorie_id`)
);

-- -----------------------------------------------------
-- Table `bestelling`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bestelling` ;

CREATE TABLE IF NOT EXISTS `bestelling` (
  `bestelling_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `betaaltype` ENUM("ideal", "pin", "cash"),
  `filiaal_id` INT UNSIGNED NOT NULL,
  `klant_id` INT UNSIGNED NOT NULL,
  `besteldatum` DATETIME NULL,
  `afhaal_bezorgen` ENUM("afhalen", "bezorgen") NULL,
  `afhaal_bezorg_tijd` DATETIME NULL,
  `coupon_id` INT UNSIGNED NULL,
  `totaalprijs` INT NOT NULL,
  PRIMARY KEY (`bestelling_id`),
  CONSTRAINT FOREIGN KEY (`filiaal_id`) REFERENCES `filiaal` (`filiaal_id`),
  CONSTRAINT FOREIGN KEY (`betaaltype_id`) REFERENCES `betaaltype` (`betaaltype_id`),
  CONSTRAINT FOREIGN KEY (`klant_id`) REFERENCES `klant` (`klant_id`),
  CONSTRAINT FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`coupon_id`)
);

-- -----------------------------------------------------
-- Table `bestelling`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bestelregel` ;

CREATE TABLE IF NOT EXISTS `bestelregel` (
  `bestelregel_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `bestelling_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `prijs_id` INT UNSIGNED NULL,
  `prijs_optie_id` INT UNSIGNED NULL,
  `aantal` INT (3) NOT NULL
    CHECK ( aantal >= 1 ),
  PRIMARY KEY (`bestelregel_id`),
  CONSTRAINT FOREIGN KEY (`bestelling_id`) REFERENCES `bestelling` (`bestelling_id`),
  CONSTRAINT FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT FOREIGN KEY (`prijs_id`) REFERENCES `prijs` (`prijs_id`),
  CONSTRAINT FOREIGN KEY (`prijs_optie_id`) REFERENCES `prijs` (`prijs_id`)
);

SET FOREIGN_KEY_CHECKS = 1;