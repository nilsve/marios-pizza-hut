import XLSX from 'xlsx';
import { getJsDateFromExcel } from 'excel-date-to-js';

export function cleanTables(tables) {
  return tables.map(table => `
        DELETE FROM ${table};
        ALTER TABLE ${table} AUTO_INCREMENT = 1;
    `).join('\n');
}

export function readFile(fileName, opts) {
  const workbook = XLSX.readFile(`data/${fileName}`);
  const sheetList = workbook.SheetNames;
  return XLSX.utils.sheet_to_json(workbook.Sheets[sheetList[0]], opts);
}

// Ja / Nee waarden naar 1 / 0
export function toBool(nl) {
  return nl.toLowerCase() === 'ja' ? 1 : 0;
}

export function dateToJs(date) {
  // Lelijke truuk omdat de tijd een uur te ver is
  const d = getJsDateFromExcel(date);
  d.setHours(d.getHours() - 1);
  return d;
}
