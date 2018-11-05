import _ from 'lodash';
import Importer from './Importer';
import { toBool } from './helpers';

export default class ProductenImporter extends Importer {
  constructor() {
    super('producten.xlsx', ['bestelregel', 'product']);

    this.insertedCategorien = [];
    this.insertedProducten = [];
  }

  parseLine(data) {
    const { categorie, subcategorie, productnaam: naam, productomschrijving, prijs, spicy, vegetarisch } = data;

    if (!_.includes(this.insertedCategorien, categorie)) {
      this.addSql(`INSERT INTO categorie SET naam="${categorie}";`);
      this.insertedCategorien.push(categorie);
    }

    if (!_.includes(this.insertedCategorien, subcategorie)) {
      this.addSql(`SET @hoofdcategorie_id = (SELECT categorie_id FROM categorie WHERE naam="${categorie}" LIMIT 1);
      INSERT INTO categorie 
                  SET naam="${subcategorie}", 
                      hoofdcategorie_id = @hoofdcategorie_id;`);
      this.insertedCategorien.push(subcategorie);
    }

    if (!_.includes(this.insertedProducten, naam)) {
      this.addSql(`INSERT INTO prijs SET bedrag=${prijs}, begindatum=NOW();
                  SET @product_prijs_id = LAST_INSERT_ID();
  
                  INSERT INTO product 
                  SET naam="${naam}", 
                      prijs_id=@product_prijs_id,
                      categorie_id = (SELECT categorie_id FROM categorie WHERE naam="${subcategorie}" LIMIT 1),
                      omschrijving = "${productomschrijving}",
                      spicy=${toBool(spicy)}, 
                      vegetarisch = ${toBool(vegetarisch)};
          `);
    }
  }
}
