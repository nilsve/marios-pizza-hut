import _ from 'lodash';
import fs from 'fs';
import { cleanTables, readFile, toBool, dateToJs } from './helpers';

import Importer from './Importer';

export default class BestellingenImporter extends Importer {
  constructor() {
    super('bestellingen.xlsx', [
      'klant',
      'pizza_samenstelling_pizza_ingredient',
      'bestelregel',
      'bestelling',
      'pizza_samenstelling',
    ]);

    this.insertedKlanten = [];
  }

  parseLine(data) {
    const { klantnaam } = data;

    // Klant gevens
    if (klantnaam && !_.includes(this.insertedKlanten, klantnaam)) {
      this.parseKlant(data);
      this.insertedKlanten.push(klantnaam);
    }

    // Bestelling
    if (data.besteldatum) {
      // Nieuwe bestelling

      const formattedBesteldatum = dateToJs(data.besteldatum);
      const afhaalBezorgtijd = data['Afhaal/Bezorgtijd'];

      const formattedAfhaalBezorgtijd = afhaalBezorgtijd !== 'Zo snel mogelijk' ? `'${dateToJs(afhaalBezorgtijd)}'` : 'NULL';

      const filiaal = data['Winkelnaam (uniek)'];
      this.addSql(`
        SET @filiaal_id = (SELECT filiaal_id FROM filiaal WHERE naam="${filiaal}");
        
        INSERT INTO bestelling
        SET betaaltype = 'cash',
            filiaal_id = @filiaal_id,
            besteldatum = '${formattedBesteldatum}',
            afhaal_bezorgen = '${data['Afhalen/Bezorgen']}',
            afhaal_bezorg_tijd = ${formattedAfhaalBezorgtijd},
            klant_id = @bestelling_klant_id,
            totaalprijs=${data.totaalPrijs};
        SET @bestelling_id = LAST_INSERT_ID();
        `);
    }

    const productNaam = data['Product naam'];
    const pizzabodem = data['Gekozen pizzabodem'];

    let formattedPizzabodem = null;
    if (pizzabodem) {
      formattedPizzabodem = pizzabodem.substr(0, pizzabodem.indexOf('(') - 1);
    }

    const pizzasaus = data['Gekozen Pizzasaus'];

    if (productNaam) {
      // In de product kolom kan je geen onderscheid maken of het een pizza is of bvb een toetje.
      // Je kan dit aan de gekozen pizzabodem zien

      this.addSql(`
        INSERT INTO prijs SET bedrag=${data['Betaalde Product Prijs']}, begindatum=NOW(), einddatum=NOW();
        SET @betaalde_prijs_id = LAST_INSERT_ID();
      `);
      if (pizzabodem) {
        // Het is een pizza
        this.addSql(`
          SET @pizza_standaard_id = (
            SELECT pizza_standaard_id FROM pizza_standaard WHERE naam="${productNaam}"
          );
        `);

        if (data['Extra ingredienten']) {
          const ingredientPrijs = data['Betaalde Prijs extra ingredienten'];

          this.addSql(`
            INSERT INTO prijs SET bedrag=${ingredientPrijs}, begindatum=NOW(), einddatum=NOW();
            SET @ingredient_prijs_id = LAST_INSERT_ID();
          `);
        }

        for (let i = 0; i < data.Aantal; i++) {
          this.addSql(`
            INSERT INTO pizza_samenstelling
            SET bestelling_id = @bestelling_id,
                pizzabodem_id = (SELECT pizzabodem_id FROM pizzabodem WHERE naam="${formattedPizzabodem}"),
                naam = (SELECT naam FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                omschrijving = (SELECT omschrijving FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                spicy = (SELECT spicy FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                vegetarisch = (SELECT vegetarisch FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id),
                pizza_standaard_prijs_id = @betaalde_prijs_id,
                pizza_standaard_bezorgtoeslag_id = (SELECT bezorgtoeslag_id FROM pizza_standaard WHERE pizza_standaard_id = @pizza_standaard_id);
            SET @pizza_samenstelling_id = LAST_INSERT_ID();
            
            CALL copyIngredienten(@pizza_standaard_id, @pizza_samenstelling_id);
          `);

          if (data['Extra ingredienten']) {
            const extra = data['Extra ingredienten'];
            const aantalExtra = parseInt(extra.substr(0, extra.indexOf('x')), 10);
            const ingredient = extra.substr(extra.indexOf(' ') + 1, extra.length);
            for (let x = 0; x < aantalExtra; x++) {
              this.addSql(`
                INSERT INTO pizza_samenstelling_pizza_ingredient 
                SET pizza_samenstelling_id=@pizza_samenstelling_id,
                    pizza_ingredient_id=(SELECT pizza_ingredient_id FROM pizza_ingredient WHERE naam='${ingredient}'),
                    prijs_id=@ingredient_prijs_id,
                    is_standaard=0;
              `);
            }
          }
        }
      } else {
        // Het is een product
        this.addSql(`
          INSERT INTO bestelregel
          SET bestelling_id=@bestelling_id,
              product_id=(SELECT product_id FROM product WHERE naam="${data['Product naam']}"),
              prijs_id=@betaalde_prijs_id,
              aantal=${data.Aantal};

        `);
      }
    }
  }

  parseKlant(klantGegevens) {
    const huisInclToevoeging = klantGegevens['Huisnr incl. toevoeging'];
    const postcode = klantGegevens.Postcode;

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
                  achternaam="${achternaam}",
                  huisnummer='${huisInclToevoeging}',
                  postcode='${postcode}';
              SET @bestelling_klant_id = LAST_INSERT_ID();
          `);
  }
}
