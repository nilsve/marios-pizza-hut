import _ from 'lodash';
import fs from 'fs';

import { cleanTables, readFile, toBool } from './helpers';

let sql = '';

// Alle tables opschonen
addSql(cleanTables([
  'bestelregel',
  'product',
]));

const producten = readFile('producten.xlsx');

const insertedCategorien = [];
const insertedProducten = [];

producten.forEach(parsePizza);

function parsePizza(pizza) {
  const { categorie, subcategorie, productnaam: naam, productomschrijving, prijs, spicy, vegetarisch } = pizza;

  if (!_.includes(insertedCategorien, categorie)) {
    addSql(`INSERT INTO categorie SET naam="${categorie}";`);
    insertedCategorien.push(categorie);
  }

  if (!_.includes(insertedCategorien, subcategorie)) {
    addSql(`SET @hoofdcategorie_id = (SELECT categorie_id FROM categorie WHERE naam="${categorie}" LIMIT 1);
    INSERT INTO categorie 
                SET naam="${subcategorie}", 
                    hoofdcategorie_id = @hoofdcategorie_id;`);
    insertedCategorien.push(subcategorie);
  }

  if (!_.includes(insertedProducten, naam)) {
    addSql(`INSERT INTO prijs SET bedrag=${prijs}, begindatum=NOW();
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

function addSql(_sql) {
  sql += `${_sql}\n`;
}

fs.writeFileSync('./output.sql', sql, { encoding: 'utf8' });
