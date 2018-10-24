import _ from 'lodash';
import fs from 'fs';
import { cleanTables, readFile, toBool, dateToJs } from './helpers';

import Importer from './Importer';

export default class BestellingenImporter extends Importer {
  constructor() {
    super('bestellingen.xlsx', [
      'klant',
      'pizza_samenstelling_ingredient',
      'bestelregel',
      'bestelling',
      'pizza_samenstelling',
    ]);

    this.insertedKlanten = [];
  }

  parseLine(bestelling) {
    console.log(bestelling)
    const { klantnaam } = bestelling;

    // Klant gevens
    if (klantnaam && !_.includes(this.insertedKlanten, klantnaam)) {
      this.parseKlant(bestelling);
      this.insertedKlanten.push(klantnaam);
    }

    // Bestelling
    if (bestelling.besteldatum) {
      // Nieuwe bestelling

      console.log(dateToJs(bestelling.besteldatum));

      this.addSql(`
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
        this.addSql(`
          
        `);
      } else {
        // Het is een product
      }
    }
  }

  parseKlant(klantGegevens) {
    const huisInclToevoeging = klantGegevens['Huisnr incl. toevoeging'];

    let huisnummer = '';
    let toevoeging = '';
    if (Number.isInteger(huisInclToevoeging)) {
      huisnummer = huisInclToevoeging;
    } else {
      let i = 0;
      for (; /[0-9]/.test(huisInclToevoeging[i]); i++) {
        huisnummer += huisInclToevoeging[i];
      }
      toevoeging = huisInclToevoeging.substr(i, huisInclToevoeging.length);
    }
    this.addSql(`
              INSERT INTO adres SET 
                  postcode="${klantGegevens.Postcode}", 
                  huisnummer="${huisnummer}", 
                  toevoeging="${toevoeging}",
                  woonplaats='';
              SET @klant_adres_id = LAST_INSERT_ID();
          `);

    let voornaam = '';
    let achternaam = '';

    const { klantnaam } = klantGegevens;
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

    this.addSql(`
              INSERT INTO klant 
              SET adres_id=@klant_adres_id, 
                  telefoonnummer="${klantGegevens.Telefoonnummer}", 
                  voornaam="${voornaam}", 
                  achternaam="${achternaam}";
              SET @bestelling_klant_id = LAST_INSERT_ID();
          `);
  }
}
