import _ from 'lodash';
import fs from 'fs';

import { cleanTables, readFile, toBool } from './helpers';

console.log('hoi')

// We willen alle tables opschonen, maar categorie refereerd naar zichzelf, dus een DELETE FROM categorie gaat fout  
let sql = `
`;

// Alle tables opschonen
addSql(cleanTables([
    'klant',
    'pizza_samenstelling_pizza_ingredient',
    'bestel_regel',
    'bestelling',
    'pizza_samenstelling',
]));

const ingredienten = readFile('bestellingen.xlsx');

const insertedKlanten = [];

ingredienten.forEach(parsePizza);

function parsePizza(pizza) {
    console.log(pizza)
    const { klantnaam } = pizza;

    if (!_.includes(insertedKlanten, klantnaam)) {
        addSql(`
            INSERT INTO adres SET postcode=${postcode}
        `);
        addSql(`INSERT INTO klant adres_id=`);
        insertedKlanten.push(klantnaam);
    }
}

function addSql(_sql) {
    sql += _sql + "\n";
}

fs.writeFileSync('./output.sql', sql, { encoding: 'utf8' })