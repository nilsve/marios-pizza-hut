import _ from 'lodash';
import fs from 'fs';

import {cleanTables, readFile, toBool} from './helpers';

// We willen alle tables opschonen, maar categorie refereerd naar zichzelf, dus een DELETE FROM categorie gaat fout  
let sql = `
    UPDATE categorie SET hoofdcategorie_id = NULL;
`;

// Alle tables opschonen
addSql(cleanTables([
    'pizza_standaard_pizza_ingredient',
    'pizza_standaard',
    'pizzabodem',
    'pizza_ingredient',
    'categorie',
    'prijs',
]));

const pizzas = readFile('pizza_ingredienten.xlsx');
 
sql += `
    INSERT INTO categorie SET naam = "Pizza's";
    SET @hoofdcategorie_id = LAST_INSERT_ID();
`;

sql += `
    INSERT INTO categorie SET naam = "Pizzabodems";
    SET @pizzabodems_categorie_id = LAST_INSERT_ID();
`;

sql += `
    INSERT INTO categorie SET naam = "Alle ingredienten";
    SET @ingredienten_categorie_id = LAST_INSERT_ID();
`;

sql += `
    INSERT INTO prijs SET bedrag=1, begindatum=NOW();
    SET @pizzabodem_prijs_id = LAST_INSERT_ID();
`;

sql += `
    INSERT INTO pizzabodem SET naam = "Pizza's", omschrijving = "Alle pizza's", categorie_id = @pizzabodems_categorie_id, diameter=10, beschikbaar = 1, prijs_id = @pizzabodem_prijs_id;
    SET @standaard_pizzabodem_id = LAST_INSERT_ID();
`;

const insertedCategorien = [];
const insertedPizzas = [];
const insertedIngredienten = [];
const insertedSauzen = [];

pizzas.forEach(parsePizza);

function parsePizza(pizza) {
    const {aantalkeer_ingredient, subcategorie, productnaam: naam, spicy, bezorgtoeslag, vegetarisch, ingredientnaam: ingredient, pizzasaus_standaard: saus, prijs} = pizza;

    if (!_.includes(insertedCategorien, subcategorie)) {
        addSql(`INSERT INTO categorie SET hoofdcategorie_id = @hoofdcategorie_id, naam="${subcategorie}";`);
        insertedCategorien.push(subcategorie);
    }

    if (!_.includes(insertedSauzen, saus)) {
        addSql(`
            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="${saus}";
        `);
        insertedSauzen.push(saus);
    }

    if (!_.includes(insertedPizzas, naam)) {
        if (bezorgtoeslag) {
            addSql(`
                INSERT INTO prijs SET bedrag=${bezorgtoeslag}, begindatum=NOW();
                SET @pizza_bezorgtoeslag_id = LAST_INSERT_ID();
            `)
        }
        addSql(`INSERT INTO prijs SET bedrag=${prijs}, begindatum=NOW();
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
        addSql(`INSERT INTO pizza_standaard_pizza_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="${naam}"),
            pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="${saus}");`);

        insertedPizzas.push(naam);
    }

    if (!_.includes(insertedIngredienten, ingredient)) {
        addSql(`
            INSERT INTO prijs SET bedrag=1, begindatum=NOW();
            INSERT INTO pizza_ingredient SET categorie_id = @ingredienten_categorie_id, prijs_id = LAST_INSERT_ID(), naam="${ingredient}";
        `);
        insertedIngredienten.push(ingredient);
    }

    addSql(`INSERT INTO pizza_standaard_pizza_ingredient
        SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="${naam}"),
        pizza_ingredient_id = (SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam="${ingredient}"),
        aantal=${aantalkeer_ingredient};`);
}

function addSql(_sql) {
    sql += _sql + "\n";
}

fs.writeFileSync('./output.sql', sql, {encoding: 'utf8'})