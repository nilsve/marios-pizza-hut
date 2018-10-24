import Importer from './Importer';
import { toBool } from './helpers';

export default class PizzabodemsImporter extends Importer {
  constructor() {
    super('pizzabodems.xlsx', ['pizzabodem', 'categorie']);

    this.addSql(`
      INSERT INTO categorie SET naam = "Pizzabodems";
      SET @pizzabodems_categorie_id = LAST_INSERT_ID();
    `);
  }

  parseLine(data) {
    const { naam, diameter, omschrijving, toeslag, beschikbaar } = data;

    this.addSql(`
    INSERT INTO prijs SET bedrag=${toeslag}, begindatum=NOW();
    SET @pizzabodem_prijs_id = LAST_INSERT_ID();

    INSERT INTO pizzabodem 
    SET naam = "${naam}", 
        omschrijving = "${omschrijving}", 
        categorie_id = @pizzabodems_categorie_id, 
        diameter=${diameter}, 
        beschikbaar = ${toBool(beschikbaar)}, 
        prijs_id = @pizzabodem_prijs_id;
  `);
  }
}
