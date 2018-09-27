SET FOREIGN_KEY_CHECKS = 0;

-- -----------------------------------------------------
-- Table `adres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adres` ;

CREATE TABLE IF NOT EXISTS `adres` (
  `adres_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `postcode` CHAR(6) NOT NULL,
  `reeks` INT(11) NOT NULL,
  `eerste_huis` INT(11) NOT NULL,
  `laatste_huis` INT(11) NOT NULL,
  `woonplaats` VARCHAR(75) NOT NULL,
  `straatnaam` VARCHAR(125) NOT NULL,
  PRIMARY KEY (`adres_id`));


-- -----------------------------------------------------
-- Table `prijs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prijs` ;

CREATE TABLE IF NOT EXISTS `prijs` (
  `prijs_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `bedrag` DECIMAL(4,2) NOT NULL,
  `begindatum` DATETIME NOT NULL,
  `einddatum` DATETIME NULL,
  PRIMARY KEY (`prijs_id`)
);

-- -----------------------------------------------------
-- Table `betaling`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `betaling` ;

CREATE TABLE IF NOT EXISTS `betaling` (
  `betaaltype_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `omschrijving` VARCHAR(300) NULL,
  PRIMARY KEY (`betaaltype_id`)
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
  `telefoonnummer` INT(8) NOT NULL,
  `straatnaam` VARCHAR(45) NOT NULL,
  `huisnummer` VARCHAR(10) NOT NULL,
  `woonplaats` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`filiaal_id`),
  CONSTRAINT FOREIGN KEY (`adres_id`) REFERENCES `adres` (`adres_id`)
);

-- -----------------------------------------------------
-- Table `coupon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coupon` ;

CREATE TABLE IF NOT EXISTS `coupon` (
  `coupon_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `filiaal_id` INT UNSIGNED NOT NULL,
  `couponcode` INT(5) NOT NULL,
  `omschrijving` VARCHAR(300) NOT NULL,
  `type` VARCHAR(20) NOT NULL,
  `kortingspercentage` DECIMAL(2,2) NULL,
  `korting` INT NULL,
  `beschikbaar` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`coupon_id`),
  CONSTRAINT FOREIGN KEY (`filiaal_id`) REFERENCES `filiaal` (`filiaal_id`)
);

-- -----------------------------------------------------
-- Table `klant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `klant` ;

CREATE TABLE IF NOT EXISTS `klant` (
  `klant_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `adres_id` INT UNSIGNED NOT NULL,
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
  `dagnaam` VARCHAR(15) NULL,
  `dagnummer` INT NOT NULL,
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
  `beschikbaar` TINYINT(1) NOT NULL DEFAULT 1,
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
  `beschikbaar` TINYINT(1) NOT NULL DEFAULT 1,
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
  `pizzabodem_id` INT UNSIGNED NOT NULL,
  `naam` VARCHAR(45) NOT NULL,
  `omschrijving` VARCHAR(45) NULL,
  `spicy` TINYINT(1) NOT NULL,
  `vegetarisch` TINYINT(1) NOT NULL,
  `beschikbaar` TINYINT(1) NOT NULL DEFAULT 1,
  `pizza_standaard_prijs_id` INT UNSIGNED NULL,
  `pizza_standaard_bezorgtoeslag_id` INT UNSIGNED NULL,
  PRIMARY KEY (`pizza_samenstelling_id`),
  CONSTRAINT FOREIGN KEY (`pizzabodem_id`) REFERENCES `pizzabodem` (`pizzabodem_id`),
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
  `is_standaard` TINYINT(1) NULL,
  PRIMARY KEY (`pizza_samenstelling_id`, `pizza_ingredient_id`),
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
  `spicy` TINYINT(1) NOT NULL,
  `vegetarisch` TINYINT(1) NOT NULL,
  `beschikbaar` TINYINT(1) NOT NULL DEFAULT 1,
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
  `aantal` INT NOT NULL DEFAULT 1,
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
  `categorie_id` INT UNSIGNED NOT NULL,
  `prijs_id` INT UNSIGNED NULL,
  `naam` VARCHAR(255) NOT NULL,
  `omschrijving` TEXT(1) NULL,
  `vegetarisch` TINYINT(1) NULL,
  `beschikbaar` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`product_id`),
  CONSTRAINT FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`categorie_id`)
);

-- -----------------------------------------------------
-- Table `bestelling`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bestelling` ;

CREATE TABLE IF NOT EXISTS `bestelling` (
  `bestelling_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `coupon_id` INT UNSIGNED NOT NULL,
  `klant_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `pizzabodem_id` INT UNSIGNED NOT NULL,
  `prijs_id` INT UNSIGNED NOT NULL,
  `totaalprijs` INT NOT NULL,
  `afhaal_bezorgen` VARCHAR(8) NOT NULL,
  `afhaal_bezorg_tijd` DATETIME NULL,
  `pizzasaus` VARCHAR(45) NULL,
  `smaak` VARCHAR(45) NULL,
  `optie` VARCHAR(45) NULL,
  `extra_ingredienten` VARCHAR(45) NULL,
  PRIMARY KEY (`bestelling_id`),
  CONSTRAINT FOREIGN KEY (`klant_id`) REFERENCES `klant` (`klant_id`),
  CONSTRAINT FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`coupon_id`),
  CONSTRAINT FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
);

SET FOREIGN_KEY_CHECKS = 1;