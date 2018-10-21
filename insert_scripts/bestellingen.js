import _ from 'lodash';
import fs from 'fs';
import {getJsDateFromExcel} from 'excel-date-to-js';
import { cleanTables, readFile, toBool } from './helpers';

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

const bestellingen = readFile('bestellingen.xlsx', {
    cellDates: true,
});

const insertedKlanten = [];

bestellingen.forEach(parseRegel);

function parseRegel(bestelling) {
    console.log(bestelling)
    const { klantnaam } = bestelling;

    // Klant gevens
    if (klantnaam && !_.includes(insertedKlanten, klantnaam)) {
        parseKlant(bestelling);
        insertedKlanten.push(klantnaam);
    }

    // Bestelling
    if (bestelling.besteldatum) {
        // Nieuwe bestelling

        console.log(dateToJs(bestelling.besteldatum));

        addSql(`
            INSERT INTO bestelling
            SET betaaltype = 'cash',
                besteldatum = '${bestelling.besteldatum}',
                afhaal_bezorgen = '${bestelling['Afhalen/Bezorgen']}',
                afhaal_bezorg_tijd = '${bestelling['Afhaal/Bezorgtijd']}',
                klant_id = @bestelling_klant_id;
            SET @bestelling_id = LAST_INSERT_ID();
        `);
    }

    const productNaam = bestelling['Product naam'];
    const pizzabodem = bestelling['Gekozen pizzabodem'];
    const pizzasaus = bestelling['Gekozen Pizzasaus'];

    if (productNaam) {
        // In de product kolom kan je geen onderscheid maken of het een pizza is of bvb een toetje.
        // Je kan dit aan de gekozen pizzabodem zien
        if (pizzabodem) {
            // Het is een pizza
            
        } else {
            // Het is een product
        }
    }
}

function parseKlant(klantGegevens) {
    const huisInclToevoeging = klantGegevens["Huisnr incl. toevoeging"];

        let huisnummer = "";
        let toevoeging = "";
        if (Number.isInteger(huisInclToevoeging)) {
            huisnummer = huisInclToevoeging;
        } else {
            let i = 0;
            for (; /[0-9]/.test(huisInclToevoeging[i]); i++) {
                huisnummer += huisInclToevoeging[i];
            }
            toevoeging = huisInclToevoeging.substr(i, huisInclToevoeging.length);
        }
        addSql(`
            INSERT INTO adres SET 
                postcode="${klantGegevens.Postcode}", 
                huisnummer="${huisnummer}", 
                toevoeging="${toevoeging}";
            SET @klant_adres_id = LAST_INSERT_ID();
        `);

        let voornaam = "";
        let achternaam = "";

        const {klantnaam} = klantGegevens;
        let foundSpace = false;
        for (let i = 0; i < klantnaam.length; i++) {
            if (!foundSpace) {
                if (klantnaam[i] === ' ') {
                    foundSpace = true;
                } else {
                    voornaam += klantnaam[i];
                }
            } else {
                foundSpace = true;
                achternaam += klantnaam[i];
            }
        }

        addSql(`
            INSERT INTO klant 
            SET adres_id=@klant_adres_id, 
                telefoonnummer="${klantGegevens.Telefoonnummer}", 
                voornaam="${voornaam}", 
                achternaam="${achternaam}";
            SET @bestelling_klant_id = LAST_INSERT_ID();
        `);
}

function addSql(_sql) {
    sql += _sql + "\n";
}

function dateToJs(date) {
    // Lelijke truuk omdat de tijd een uur te ver is
    const d = getJsDateFromExcel(date);
    d.setHours(d.getHours() - 1);
    return d;
}

fs.writeFileSync('./output.sql', sql, { encoding: 'utf8' })