import _ from 'lodash';
import fs from 'fs';
import { cleanTables } from './helpers';

import PizzabodemsImporter from './pizzabodems';
import ProductenImporter from './producten';
import IngredientenImporter from './ingredienten';
import BestellingenImporter from './bestellingen';

const importers = [
  new PizzabodemsImporter(),
  new ProductenImporter(),
  new IngredientenImporter(),
  new BestellingenImporter(),
];

importers.forEach(importer => importer.run());

const tables = _(importers)
  .flatMap(importer => importer.tables)
  .uniq()
  .value();

const sql = `
  UPDATE categorie SET hoofdcategorie_id = NULL;

  SET FOREIGN_KEY_CHECKS=0;
  ${cleanTables(tables)}
  SET FOREIGN_KEY_CHECKS=1;
  ${importers.map(importer => importer.sql).join('\n')}
`;

fs.writeFileSync('./output.sql', sql, { encoding: 'utf8' });
