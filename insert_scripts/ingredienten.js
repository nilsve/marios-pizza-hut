import _ from 'lodash';
import Importer from './Importer';
import { toBool } from './helpers';

export default class ProductenImporter extends Importer {
  constructor() {
    super('pizza_ingredienten.xlsx', [
      'pizza_standaard_pizza_ingredient',
      'pizza_standaard',
      'pizza_ingredient',
      'categorie',
      'prijs',
    ]);

    this.addSql(`
      INSERT INTO categorie SET naam = "Pizza's";
      SET @hoofdcategorie_id = LAST_INSERT_ID();

      INSERT INTO categorie SET naam = "Alle ingredienten";
      SET @ingredienten_categorie_id = LAST_INSERT_ID();

      INSERT INTO prijs SET bedrag=0, begindatum=NOW();
      SET @pizzabodem_prijs_id = LAST_INSERT_ID();

      INSERT INTO pizzabodem SET naam = "Medium Pizza", omschrijving = "Medium Pizza", categorie_id = @pizzabodems_categorie_id, diameter=10, beschikbaar = 1, prijs_id = @pizzabodem_prijs_id;
      SET @standaard_pizzabodem_id = LAST_INSERT_ID();
    `);

    this.insertedCategorien = [];
    this.insertedPizzas = [];
    this.insertedIngredienten = [];
    this.insertedSauzen = [];
  }

  parseLine(data) {
    const { aantalkeer_ingredient, subcategorie, productnaam: naam, spicy, bezorgtoeslag, vegetarisch, ingredientnaam: ingredient, pizzasaus_standaard: saus, prijs } = data;

    if (!_.includes(this.insertedCategorien, subcategorie)) {
      this.addSql(`INSERT INTO categorie SET hoofdcategorie_id = @hoofdcategorie_id, naam="${subcategorie}";`);
      this.insertedCategorien.push(subcategorie);
    }

    if (!_.includes(this.insertedSauzen, saus)) {
      this.addSql(`
            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="${saus}";
        `);
      this.insertedSauzen.push(saus);
    }

    if (!_.includes(this.insertedPizzas, naam)) {
      if (bezorgtoeslag) {
        this.addSql(`
                INSERT INTO prijs SET bedrag=${bezorgtoeslag}, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            `)
      }
      this.addSql(`INSERT INTO prijs SET bedrag=${prijs}, begindatum=NOW();
                SET @pizza_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza_standaard 
                SET naam='${naam}', 
                    prijs_id=@pizza_prijs_id,
                    bezorgtoeslag_id=@pizza_bezorgtoeslag_id,
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="${subcategorie}"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=${toBool(spicy)}, 
                    vegetarisch = ${toBool(vegetarisch)};
        `);

      // Saus
      this.addSql(`INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="${naam}"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="${saus}");`);

      this.insertedPizzas.push(naam);
    }

    if (!_.includes(this.insertedIngredienten, ingredient)) {
      this.addSql(`
            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="${ingredient}";
        `);
      this.insertedIngredienten.push(ingredient);
    }

    this.addSql(`INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="${naam}"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="${ingredient}"),
        aantal=${aantalkeer_ingredient};`);
  }
}
