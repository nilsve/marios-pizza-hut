insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1059NJ' ),
	14,
	null,
	'Aalsmeerweg',
	'AMSTERDAM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Amsterdam Aalsmeerweg',
	'0204122131'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1055DT' ),
	215,
	null,
	'Bos en Lommerweg',
	'AMSTERDAM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Amsterdam Bos en Lommerweg',
	'0206847676'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1072GL' ),
	314,
	null,
	'Ceintuurbaan',
	'AMSTERDAM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Amsterdam Ceintuurbaan',
	'0204705292'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1032HP' ),
	40,
	null,
	'Kamperfoelieweg',
	'AMSTERDAM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Amsterdam Noord',
	'0203340008'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1019BP' ),
	142,
	null,
	'Oostelijke Handelskade',
	'AMSTERDAM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Amsterdam Oostelijke Handelskade',
	'0204350660'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1054HC' ),
	71,
	null,
	'Overtoom',
	'AMSTERDAM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Amsterdam Overtoom',
	'0204122131'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1069LA' ),
	212,
	'E',
	'Pieter Calandlaan',
	'OSDORP'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Osdorp',
	'0206673880'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2565GH' ),
	3,
	null,
	'Goudenregenplein',
	'DEN HAAG'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Den Haag Goudenregenplein',
	'0703616111'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2552EP' ),
	36,
	null,
	'Oude Haagweg',
	'DEN HAAG'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Den Haag Oude Haagweg',
	'0704400020'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2513BW' ),
	140,
	null,
	'Torenstraat',
	'DEN HAAG'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Den Haag Torenstraat',
	'0703467757'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2583DR' ),
	6,
	null,
	'Zeesluisweg',
	'SCHEVENINGEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Scheveningen',
	'0703060022'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '9402BG' ),
	199,
	'A',
	'Troelstralaan',
	'ASSEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Assen',
	'0592350060'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '7811GC' ),
	6,
	null,
	'Spoorstraat',
	'EMMEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Emmen',
	'0591724400'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '7941KD' ),
	13,
	null,
	'Prinsengracht',
	'MEPPEL'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Meppel',
	'0522743110'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1325ES' ),
	238,
	null,
	'Cinemadreef',
	'ALMERE'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Almere',
	'0365359494'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1335HW' ),
	209,
	null,
	'Makassarweg',
	'ALMERE BUITEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Almere Buiten',
	'0365213990'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '8223AC' ),
	26,
	null,
	'Weverstraat',
	'LELYSTAD'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Lelystad',
	'0320213018'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '9203CE' ),
	56,
	null,
	'Noordkade',
	'DRACHTEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Drachten',
	'0512510015'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '8441BH' ),
	11,
	null,
	'Trambaan',
	'HEERENVEEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Heerenveen',
	'0513625635'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '8921AA' ),
	5,
	null,
	'Oostergrachtswal',
	'LEEUWARDEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Leeuwarden',
	'0582120026'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '8601BZ' ),
	32,
	null,
	'Gedempte Pol',
	'SNEEK'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Sneek',
	'0515411045'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '7333NA' ),
	251,
	null,
	'Arnhemseweg',
	'APELDOORN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Apeldoorn',
	'0555761188'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '6832AP' ),
	65,
	null,
	'Middelgraaflaan',
	'ARNHEM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Arnhem',
	'0263883993'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '6811AL' ),
	27,
	null,
	'Jansbinnensingel',
	'ARNHEM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Arnhem Centrum',
	'0263510100'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '6713EN' ),
	62,
	null,
	'Rozenplein',
	'EDE'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Ede',
	'0318504100'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3842EJ' ),
	90,
	null,
	'Vondellaan',
	'HARDERWIJK'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Harderwijk',
	'0341410010'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '6531HJ' ),
	243,
	null,
	'Groenestraat',
	'NIJMEGEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Nijmegen',
	'0243500670'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '4001LH' ),
	53,
	null,
	'Plein',
	'TIEL'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Tiel',
	'0344610004'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '6883AR' ),
	71,
	null,
	'Churchillplein',
	'VELP'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Velp',
	'0263610001'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '6701AL' ),
	34,
	null,
	'Stadsbrink',
	'WAGENINGEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Wageningen',
	'0317410040'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '6602AH' ),
	7,
	'B',
	'Touwslagersbaan',
	'WIJCHEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Wijchen',
	'0242100100'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '9933KM' ),
	7,
	null,
	'De Wending',
	'DELFZIJL'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Delfzijl',
	'0596743101'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '9712LH' ),
	1,
	null,
	'Boterdiep',
	'GRONINGEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Groningen Boterdiep',
	'0505266600'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '9742BG' ),
	281,
	'A',
	'Zonnelaan',
	'GRONINGEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Groningen Paddepoel',
	'0505710012'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '9727BX' ),
	322,
	null,
	'Paterswoldseweg',
	'GRONINGEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Groningen Paterswoldseweg',
	'0505250300'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '9603 AC' ),
	76,
	null,
	'Gorecht-Oost',
	'HOOGEZAND'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Hoogezand',
	'0598743103'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5975NV' ),
	29,
	null,
	'Kleefdijkseweg',
	'SEVENUM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'AC Sevenum',
	'0774672895'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '6441CN' ),
	15,
	17,
	'Schiffelerstraat',
	'BRUNSSUM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Brunssum',
	'0452100121'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '6161EH' ),
	68,
	null,
	'Rijksweg Centrum',
	'GELEEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Geleen',
	'0462100106'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '6373HW' ),
	54,
	null,
	'Hoogstraat',
	'LANDGRAAF'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Landgraaf',
	'0452100120'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '6211NG' ),
	18,
	null,
	'Koningin Emmaplein',
	'MAASTRICHT'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Maastricht',
	'0433216747'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '6041GN' ),
	14,
	null,
	'Stationsplein',
	'ROERMOND'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Roermond',
	'0475310012'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '6131AX' ),
	49,
	null,
	'Stationsstraat',
	'SITTARD'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Sittard',
	'0464000143'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5911KG' ),
	80,
	null,
	'Koninginnensingel',
	'VENLO'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Venlo',
	'0773510000'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '6006HS' ),
	8,
	null,
	'Dries',
	'WEERT'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Weert',
	'0495520030'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '4611AG' ),
	2,
	null,
	'Antwerpsestraat',
	'BERGEN OP ZOOM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Bergen op Zoom',
	'0164247030'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '4819CK' ),
	51,
	null,
	'Graaf Hendrik III plein',
	'BREDA'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Breda Graaf Hendrik III Plein',
	'0765200345'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '4822WK' ),
	170,
	null,
	'Kesterenlaan',
	'BREDA'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Breda Kesterenlaan',
	'0765422113'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5223DR' ),
	44,
	null,
	'Leonardo da Vinciplein',
	'DEN BOSCH'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Den Bosch',
	'0736233111'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5236AC' ),
	42,
	null,
	'Burg.Godschalxstraat',
	'DEN BOSCH'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Den Bosch Empel',
	'0736444222'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5101VW' ),
	53,
	null,
	'Europaplein',
	'DONGEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Dongen',
	'0162749101'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5654NN' ),
	351,
	null,
	'Karel de Grotelaan',
	'EINDHOVEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Eindhoven Gestel',
	'0402570999'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5642RK' ),
	97,
	null,
	'Dirigentplein',
	'EINDHOVEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Eindhoven Tongelre',
	'0404100121'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5625EP' ),
	77,
	null,
	'Elckerlyclaan',
	'EINDHOVEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Eindhoven Woensel',
	'0402483060'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '4875CD' ),
	99,
	'B',
	'Markt',
	'ETTEN LEUR'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Etten Leur',
	'0765081111'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5664RP' ),
	2,
	'B',
	'Dommeldalseweg',
	'GELDROP'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Geldrop',
	'0402854087'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5701NJ' ),
	23,
	null,
	'Noord Koninginnewal',
	'HELMOND'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Helmond',
	'0492552878'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5708ZK' ),
	91,
	null,
	'De Plaetse',
	'HELMOND'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Helmond Brandevoort',
	'0492743013'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '4901LL' ),
	13,
	null,
	'Heuveleind',
	'OOSTERHOUT'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Oosterhout',
	'0162433838'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5341CH' ),
	5,
	'A',
	'Klaphekkenstraat',
	'OSS'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Oss',
	'0412-655066'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '4701EV' ),
	8,
	null,
	'Boulevard',
	'ROOSENDAAL'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Roosendaal',
	'0165565300'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5025VJ' ),
	1,
	null,
	'Laarstraat',
	'TILBURG'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Tilburg Laarstraat',
	'0134686866'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5042HA' ),
	37,
	null,
	'Thomas van Aquinostraat',
	'TILBURG'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Tilburg Thomas van Aquinostraat',
	'0134637638'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5401CB' ),
	1921,
	'/',
	'Oranjestraat',
	'UDEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Uden',
	'0413245009'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5554NL' ),
	5,
	null,
	'Dommelseweg',
	'VALKENSWAARD'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Valkenswaard',
	'0404100110'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5461HH' ),
	910,
	'/',
	'Bolkenplein',
	'VEGHEL'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Veghel',
	'0413320403'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5503BK' ),
	67,
	null,
	'Burgemeester van Hoofflaan',
	'VELDHOVEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Veldhoven',
	'0402556636'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '5144AG' ),
	138,
	null,
	'St. Antoniusstraat',
	'WAALWIJK'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Waalwijk',
	'0416566088'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1813BA' ),
	61,
	null,
	'Vondelstraat',
	'ALKMAAR'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Alkmaar',
	'0722100160'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1185HH' ),
	4,
	null,
	'Hueseplein',
	'AMSTELVEEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Amstelveen',
	'0203457666'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1784AT' ),
	172,
	null,
	'Marsdiepstraat',
	'DEN HELDER'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Den Helder',
	'0223610040'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1111GJ' ),
	13,
	null,
	'Burgemeester de Kievietstraat',
	'DIEMEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Diemen',
	'0204162800'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2026SV' ),
	1,
	null,
	'Tesselschadeplein',
	'HAARLEM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Haarlem Tesselschadeplein',
	'0235400555'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2037AJ' ),
	10,
	null,
	'Nice Passage',
	'HAARLEM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Haarlem Zuid',
	'0235404455'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1962CE' ),
	21,
	null,
	'Bachplein',
	'HEEMSKERK'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Heemskerk',
	'0251242226'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1701EK' ),
	14,
	null,
	'Raadhuisstraat',
	'HEERHUGOWAARD'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Heerhugowaard',
	'0725762940'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2134DR' ),
	2,
	null,
	'Almkerkplein',
	'HOOFDDORP'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Hoofddorp',
	'0235620388'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1621JB' ),
	45,
	47,
	'Veemarkt',
	'HOORN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Hoorn',
	'0229210318'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1972EJ' ),
	77,
	null,
	'Kennemerlaan',
	'IJMUIDEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'IJmuiden',
	'0255545910'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2201KN' ),
	40,
	null,
	'Kerkstraat',
	'NOORDWIJK'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Noordwijk',
	'0713610979'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1442CD' ),
	89,
	null,
	'Wormerplein',
	'PURMEREND'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Purmerend',
	'0299420009'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1501CB' ),
	45,
	null,
	'Zuiddijk',
	'ZAANDAM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Zaandam',
	'0756705501'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '7606HP' ),
	12,
	null,
	'Vincent van Goghplein',
	'ALMELO'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Almelo',
	'0546459996'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '7413AE' ),
	80,
	82,
	'Brinkgeverweg',
	'DEVENTER'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Deventer',
	'0570621100'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '7512CA' ),
	3,
	'B',
	'Kuipersdijk',
	'ENSCHEDE'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Enschede',
	'0534824000'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '7521EE' ),
	223,
	null,
	'G.J. van Heekstraat',
	'ENSCHEDE'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Enschede West',
	'0534300081'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '7553DK' ),
	11,
	null,
	'Boekeloseweg',
	'HENGELO'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Hengelo',
	'0742420203'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '8261AP' ),
	9,
	null,
	'Buitennieuwstraat',
	'KAMPEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Kampen',
	'0383331517'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '8021CW' ),
	5,
	null,
	'Diezerkade',
	'ZWOLLE'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Zwolle',
	'0384531339'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '8031HR' ),
	8,
	null,
	'Bachplein',
	'ZWOLLE'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Zwolle Bachplein',
	'0384210080'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3192HD' ),
	90,
	null,
	'In de Fuik',
	'ROTTERDAM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Rotterdam Hoogvliet',
	'0102160075'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3011NS' ),
	70,
	'A',
	'Mariniersweg',
	'ROTTERDAM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Rotterdam Mariniersweg',
	'0104118070'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3039CG' ),
	72,
	'A',
	'Stadhoudersweg',
	'ROTTERDAM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Rotterdam Noord',
	'0104667411'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3053GE' ),
	93,
	'A',
	'Peppelweg',
	'ROTTERDAM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Rotterdam Schiebroek',
	'0102184703'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3071AR' ),
	328,
	330,
	'Vuurplaat',
	'ROTTERDAM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Rotterdam Vuurplaat',
	'0102150370'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3068HG' ),
	303,
	'B',
	'Zevenkampsering',
	'ROTTERDAM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Rotterdam Zevenkamp',
	'0102205151'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3083 CN' ),
	117,
	null,
	'Zuidplein',
	'ROTTERDAM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Rotterdam Zuidplein',
	'010-3100700'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3811NM' ),
	3,
	null,
	'Prinses Julianaplein',
	'AMERSFOORT'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Amersfoort',
	'0334220422'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3825MA' ),
	11,
	null,
	'Wouda',
	'AMERSFOORT'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Amersfoort Vathorst',
	'0332588883'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1401EV' ),
	1,
	null,
	'De Clinge',
	'BUSSUM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Bussum',
	'0356914377'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3453HA' ),
	137,
	null,
	'Zandweg',
	'DE MEERN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'De Meern',
	'0306667737'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '1211KL' ),
	12,
	null,
	'Havenstraat',
	'HILVERSUM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Hilversum',
	'0356289888'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3991AP' ),
	13,
	'B',
	'Lange Schaft',
	'HOUTEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Houten',
	'0306390830'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3605KX' ),
	1190,
	null,
	'Bisonspoor',
	'MAARSSEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Maarssen',
	'0346283008'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3438AA' ),
	7,
	null,
	'Nedereindseweg',
	'NIEUWEGEIN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Nieuwegein',
	'0306072727'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3764BL' ),
	16,
	null,
	'Steenhoffstraat',
	'SOEST'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Soest',
	'0356921783'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3514CC' ),
	69,
	null,
	'Adelaarstraat',
	'UTRECHT'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Utrecht Adelaarstraat',
	'0302430777'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3552HB' ),
	21,
	null,
	'Marnixlaan',
	'UTRECHT'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Utrecht Marnixlaan',
	'0302452170'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3522BN' ),
	6,
	'A',
	'Rijnlaan',
	'UTRECHT'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Utrecht Rijnlaan',
	'0302888712'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3905LH' ),
	87,
	null,
	'Nieuweweg',
	'VEENENDAAL'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Veenendaal',
	'0318517055'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3443BV' ),
	12,
	null,
	'Leidsestraatweg',
	'WOERDEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Woerden',
	'0348411194'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3701HN' ),
	251,
	null,
	'Montaubanstraat',
	'ZEIST'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Zeist',
	'0306932266'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '4461JA' ),
	7,
	null,
	'Zusterstraat',
	'GOES'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Goes',
	'0113748110'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '4331NA' ),
	10,
	null,
	'Pottenbakkerssingel',
	'MIDDELBURG'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Middelburg',
	'0118673040'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '4537AL' ),
	68,
	null,
	'Axelsestraat',
	'TERNEUZEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Terneuzen',
	'0115622220'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '4381LM' ),
	1,
	null,
	'Badhuisstraat',
	'VLISSINGEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Vlissingen',
	'0118430334'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2402JG' ),
	5,
	null,
	'Concertweg',
	'ALPHEN AAN DEN RIJN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Alphen aan den Rijn',
	'0172417327'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2991EP' ),
	10,
	null,
	't Vlak',
	'BARENDRECHT'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Barendrecht',
	'0180439004'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2651DL' ),
	14,
	null,
	'Wilhelministraat',
	'BERKEL EN RODENRIJS'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Berkel en Rodenrijs',
	'0105110002'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2902HP' ),
	22,
	null,
	'Slotplein',
	'CAPELLE A/D YSSEL'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Capelle a/d Yssel',
	'0104502373'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2611BK' ),
	12,
	'A',
	'Binnenwatersloot',
	'DELFT'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Delft Binnenwatersloot',
	'0152148124'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2624AK' ),
	123,
	'B',
	'Papsouwselaan',
	'DELFT'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Delft Papsouwselaan',
	'0152855666'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3319GS' ),
	40,
	null,
	'Bamendaweg',
	'DORDRECHT'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Dordrecht Bamendaweg',
	'0786219200'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3317ES' ),
	73,
	null,
	'Van Oldenbarneveltplein',
	'DORDRECHT'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Dordrecht Van Oldenbarneveltplein',
	'0786515230'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '4201MB' ),
	21,
	null,
	'Kazerneplein',
	'GORINCHEM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Gorinchem',
	'0183653070'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2805BM' ),
	21,
	null,
	'Van Hogendorpplein',
	'GOUDA'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Gouda',
	'0182551110'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3221AV' ),
	45,
	null,
	'Westkade',
	'HELLEVOETSLUIS'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Hellevoetsluis',
	'0181338807'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2312AS' ),
	17,
	null,
	'Stationsweg',
	'LEIDEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Leiden',
	'0715141428'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2352VR' ),
	11,
	'A',
	'Laan van Berendrecht',
	'LEIDERDORP'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Leiderdorp',
	'0712100240'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2265AC' ),
	16,
	null,
	'Damplein',
	'LEIDSCHENDAM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Leidschendam',
	'0703275959'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3142GH' ),
	8,
	null,
	'PC Hooftlaan',
	'MAASSLUIS'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Maassluis',
	'0102540555'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2671JN' ),
	18,
	null,
	's Gravenzandseweg',
	'NAALDWIJK'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Naaldwijk',
	'0174200000'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2631BM' ),
	24,
	null,
	'Koningin Julianastraat',
	'NOOTDORP'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Nootdorp',
	'0153109491'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3262VR' ),
	3,
	null,
	'Beijerse Hof',
	'OUD BEIJERLAND'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Oud Beijerland',
	'0186610050'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3354BW' ),
	64,
	null,
	'P S Gerbrandystraat',
	'PAPENDRECHT'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Papendrecht',
	'0786416666'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2981BN' ),
	4,
	null,
	'Irisstraat',
	'RIDDERKERK'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Ridderkerk',
	'0180497527'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2284XV' ),
	4,
	null,
	'Generaal Eisenhouwerplein',
	'RIJSWIJK'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Rijswijk',
	'0703948039'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3111AM' ),
	7,
	null,
	'Oranjestraat',
	'SCHIEDAM'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Schiedam',
	'0104269414'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3201DB' ),
	16,
	null,
	'Gorsstraat',
	'SPIJKENISSE'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Spijkenisse',
	'0181619000'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3135BB' ),
	19,
	'A',
	'Van Hogendorplaan',
	'VLAARDINGEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Vlaardingen',
	'0104719877'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2274JR' ),
	234,
	null,
	'Koningin Julianalaan',
	'VOORBURG'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Voorburg',
	'0703864044'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2253TS' ),
	26,
	'B',
	'Planciusplantsoen',
	'VOORSCHOTEN'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Voorschoten',
	'0715762211'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2242NE' ),
	37,
	null,
	'Oostdorperweg',
	'WASSENAAR'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Wassenaar',
	'0705115556'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '2713RB' ),
	10,
	null,
	'van Leeuwenhoeklaan',
	'ZOETERMEER'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Zoetermeer',
	'0793160211'
);

insert into adres( postcode_id, huisnummer, toevoeging, straatnaam, woonplaats)
values(
	( select postcode_id from postcode where postcode = '3331HD' ),
	49,
	null,
	'Burgemeester Jansenlaan',
	'ZWIJNDRECHT'
);

insert into filiaal( adres_id, naam, telefoonnummer )
values(
	last_insert_id(),
	'Zwijndrecht',
	'0786126131'
);

