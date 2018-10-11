import XLSX from 'xlsx';

export function cleanTables(tables) {
    return tables.map(table => `
        DELETE FROM ${table};
        ALTER TABLE ${table} AUTO_INCREMENT = 1;
    `).join('\n');
}

export function readFile(fileName) {
    const workbook = XLSX.readFile(`data/${fileName}`);
    const sheetList = workbook.SheetNames;
    return XLSX.utils.sheet_to_json(workbook.Sheets[sheetList[0]]);
}

// Ja / Nee waarden naar 1 / 0
export function toBool(nl) {
    return nl.toLowerCase() === 'ja' ? 1 : 0;
}