import XLSX from 'xlsx';
import _ from 'lodash';
import fs from 'fs';

// Alle tables opschonen
let sql = `
    TRUNCATE TABLE pizza_standaard_pizza_ingredient;
    TRUNCATE TABLE pizza_standaard;
    TRUNCATE TABLE pizza_ingredient;
    TRUNCATE TABLE categorie;
    TRUNCATE TABLE prijs;

`;

const pizzas = readFile('pizza_ingredienten.xlsx');
 
sql += `
    INSERT INTO categorie naam = "Pizza's", omschrijving = "Alle pizza's";
    SET @hoofdcategorie_id = LAST_INSERT_ID();
`;

sql += `
    INSERT INTO categorie naam = "Pizzabodems", omschrijving = "Alle pizza bodems";
    SET @pizzabodems_categorie_id = LAST_INSERT_ID();
`;

sql += `
    INSERT INTO prijs naam = "Standaard pizzabodemprijs", bedrag=1, begindatum=DATE();
    SET @pizzabodem_prijs_id = LAST_INSERT_ID();
`;

sql += `
    INSERT INTO pizzabodem naam = "Pizza's", omschrijving = "Alle pizza's", prijs_id = @pizzabodem_prijs_id;
    SET @standaard_pizzabodem_id = LAST_INSERT_ID();
`;

const insertedCategorien = [];
const insertedPizzas = [];
const insertedIngredienten = [];
const insertedSauzen = [];

pizzas.forEach(parsePizza);

function parsePizza(pizza) {
    const {aantalkeer_ingredient, subcategorie, productnaam: naam, spicy, vegetarisch, ingredientnaam: ingredient, pizzasaus_standaard: saus, prijs} = pizza;

    if (!_.includes(insertedCategorien, subcategorie)) {
        addSql(`INSERT INTO categorie SET hoofdcategorie_id = @hoofdcategorie_id, naam="${subcategorie}";`);
        insertedCategorien.push(subcategorie);
    }

    if (!_.includes(insertedPizzas, naam)) {
        addSql(`INSERT INTO prijs naam = "${naam} prijs", bedrag=${prijs}, begindatum=DATE();
                SET @pizzabodem_prijs_id = LAST_INSERT_ID();

                INSERT INTO pizza 
                SET naam='${naam}', 
                    prijs_id=LAST_INSERT_ID(),
                    categorie_id = (SELECT categorie_id FROM categorie WHERE naam="${subcategorie}"),
                    pizzabodem_id = @standaard_pizzabodem_id, 
                    spicy=${toBool(spicy)}, 
                    vegetarisch = ${toBool(vegetarisch)};
        `);
        insertedPizzas.push(naam);
    }

    if (!_.includes(insertedIngredienten, ingredient)) {
        addSql(`
            INSERT INTO prijs SET naam="${ingredient} prijs", bedrag=1, begindatum=DATE();
            INSERT INTO pizza_ingredient prijs_id = LAST_INSERT_ID(), naam="${ingredient}";
        `);
        insertedIngredienten.push(ingredient);
    }

    for (let i = 0; i < aantalkeer_ingredient; i++) {
        addSql(`INSERT INTO pizza_standaard_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="${naam}"),
            ingredient_id = (SELECT ingredient_id FROM pizza_ingredient WHERE naam="${ingredient}")`);
    }

    if (!_.includes(insertedSauzen, saus)) {
        addSql(`
            INSERT INTO prijs SET naam="${saus} prijs", bedrag=1, begindatum=DATE();
            INSERT INTO pizza_ingredient prijs_id = LAST_INSERT_ID(), naam="${saus}";
        `);
        insertedSauzen.push(saus);
    }

    addSql(`INSERT INTO pizza_standaard_ingredient
            SET pizza_standaard_id = (SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="${saus}"),
            ingredient_id = (SELECT ingredient_id FROM pizza_ingredient WHERE naam="${saus}")`);


}

// Ja / Nee waarden naar 1 / 0
function toBool(nl) {
    return nl.toLowerCase() === 'ja' ? 1 : 0;
}

function formatIngredient(ingredient) {
    return `INSERT INTO `;
}

function addSql(_sql) {
    sql += _sql + "\n";
}

function readFile(fileName) {
    const workbook = XLSX.readFile(`data/${fileName}`);
    const sheetList = workbook.SheetNames;
    return XLSX.utils.sheet_to_json(workbook.Sheets[sheetList[0]]);
}

fs.writeFileSync('./output.sql', sql, {encoding: 'utf8'})