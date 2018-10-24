/* eslint class-methods-use-this: "off" */

import { readFile } from './helpers';

export default class Importer {
  constructor(filename, tables) {
    this.sql = '';
    this.data = readFile(filename);

    this.tables = tables;
  }

  run() {
    this.data.forEach(line => this.parseLine(line));
  }

  addSql(sql) {
    this.sql += `${sql}\n`;
  }

  parseLine() {
    throw new Error('Functie niet geimplementeerd!');
  }
}
