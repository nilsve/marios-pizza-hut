insert into klant(adres_id, telefoonnummer, postcode, huisnummer, voornaam, achternaam) values(null, '0401234567', '5612MA', '3', 'Jan', 'de Vries');

insert into coupon(filiaal_id, couponcode, omschrijving, type, kortingspercentage, korting, beschikbaar)
values(
	( select filiaal_id from filiaal where upper(naam) = upper('Eindhoven Tongelre') ),
	null,
	'2 euro korting bij afhalen',
	'KORTINGSBEDRAG',
	null,
	2,
	0
);

insert into coupon(filiaal_id, couponcode, omschrijving, type, kortingspercentage, korting, beschikbaar)
values(
	null,
	null,
	'10% korting bij 2 Chicken Combobox',
	'KORTINGSPERCENTAGE',
	10,
	null,
	0
);

insert into bestelling( 
    filiaal_id,
    klant_id,
    besteldatum,
    afhaal_bezorgen, 
    afhaal_bezorg_tijd,
    coupon_id,
    coupon_korting,
    totaalprijs
) values (
	( select filiaal_id from filiaal where upper(naam) = upper('Eindhoven Tongelre') ),
	( select klant_id from klant where upper(voornaam) = upper('Jan') and upper(achternaam) = upper('de Vries') ),
	STR_TO_DATE('01-01-18 18:15', '%d-%m-%Y %T'),
	'BEZORGEN',
	STR_TO_DATE('01-01-18 19:45', '%d-%m-%Y %T'),
	null,
	0,
	44.75
);

insert into bestelregel( 
    product_id,
    pizzabodem_id,
    pizzasaus_id,
    prijs,
    smaak,
    optie_id,
    aantal,
    extra_ingredienten_id,
    extra_aantal,
    extra_prijs
) values (
	( select product_id from product where upper(naam) = upper('Bacon Gorgonzola') ),
	( select pizzabodem_id from pizzabodem where upper(naam) = upper('Medium Pizza') ),
	( select ingredient_id from ingredient where upper(naam) = upper('Tomatensaus') ),
	8.95,
	null,
	null,
	2,
	null,
	null,
	null
);

insert into bestelling_bestelregel( 
    bestelling_id,
    bestelregel_id
) values (
	1,
	1
);

insert into bestelregel( 
    product_id,
    pizzabodem_id,
    pizzasaus_id,
    prijs,
    smaak,
    optie_id,
    aantal,
    extra_ingredienten_id,
    extra_aantal,
    extra_prijs
) values (
	( select product_id from product where upper(naam) = upper('Pollo Pomodore') ),
	( select pizzabodem_id from pizzabodem where upper(naam) = upper('Medium Pizza') ),
	( select ingredient_id from ingredient where upper(naam) = upper('Creme Fraiche') ),
	8.95,
	null,
	null,
	3,
	null,
	null,
	null
);

insert into bestelling_bestelregel( 
    bestelling_id,
    bestelregel_id
) values (
	1,
	2
);

insert into bestelling( 
    filiaal_id,
    klant_id,
    besteldatum,
    afhaal_bezorgen, 
    afhaal_bezorg_tijd,
    coupon_id,
    coupon_korting,
    totaalprijs
) values (
	( select filiaal_id from filiaal where upper(naam) = upper('Eindhoven Tongelre') ),
	( select klant_id from klant where upper(voornaam) = upper('Jan') and upper(achternaam) = upper('de Vries') ),
	STR_TO_DATE('21-01-18 21:15', '%d-%m-%Y %T'),
	'AFHALEN',
	STR_TO_DATE('22-01-18 18:00', '%d-%m-%Y %T'),
	( select coupon_id from coupon where upper(omschrijving) = upper('2 euro korting bij afhalen') ),
	2,
	16.65
);

insert into bestelregel( 
    product_id,
    pizzabodem_id,
    pizzasaus_id,
    prijs,
    smaak,
    optie_id,
    aantal,
    extra_ingredienten_id,
    extra_aantal,
    extra_prijs
) values (
	( select product_id from product where upper(naam) = upper('BBQ Mixed Grill') ),
	( select pizzabodem_id from pizzabodem where upper(naam) = upper('Medium Pizza') ),
	( select ingredient_id from ingredient where upper(naam) = upper('Barbecue Saus') ),
	7.95,
	null,
	null,
	1,
	1,
	'Bacon',
	1
);

insert into bestelling_bestelregel( 
    bestelling_id,
    bestelregel_id
) values (
	2,
	1
);

insert into bestelregel( 
    product_id,
    pizzabodem_id,
    pizzasaus_id,
    prijs,
    smaak,
    optie_id,
    aantal,
    extra_ingredienten_id,
    extra_aantal,
    extra_prijs
) values (
	( select product_id from product where upper(naam) = upper('Pollo Pomodore') ),
	( select pizzabodem_id from pizzabodem where upper(naam) = upper('Medium Pizza') ),
	( select ingredient_id from ingredient where upper(naam) = upper('Barbecue Saus') ),
	8.95,
	null,
	null,
	1,
	1,
	'Zon gedroogde tomaten',
	0.75
);

insert into bestelling_bestelregel( 
    bestelling_id,
    bestelregel_id
) values (
	2,
	2
);

insert into bestelling( 
    filiaal_id,
    klant_id,
    besteldatum,
    afhaal_bezorgen, 
    afhaal_bezorg_tijd,
    coupon_id,
    coupon_korting,
    totaalprijs
) values (
	( select filiaal_id from filiaal where upper(naam) = upper('Eindhoven Tongelre') ),
	( select klant_id from klant where upper(voornaam) = upper('Jan') and upper(achternaam) = upper('de Vries') ),
	STR_TO_DATE('23-01-18 21:15', '%d-%m-%Y %T'),
	'AFHALEN',
	STR_TO_DATE('23-01-18 22:15', '%d-%m-%Y %T'),
	( select coupon_id from coupon where upper(omschrijving) = upper('2 euro korting bij afhalen') ),
	2,
	25.65
);

insert into bestelregel( 
    product_id,
    pizzabodem_id,
    pizzasaus_id,
    prijs,
    smaak,
    optie_id,
    aantal,
    extra_ingredienten_id,
    extra_aantal,
    extra_prijs
) values (
	( select product_id from product where upper(naam) = upper('BBQ Mixed Grill') ),
	( select pizzabodem_id from pizzabodem where upper(naam) = upper('Large Pizza') ),
	( select ingredient_id from ingredient where upper(naam) = upper('Barbecue Saus') ),
	11.95,
	null,
	null,
	1,
	2,
	'Bacon',
	2.0
);

insert into bestelling_bestelregel( 
    bestelling_id,
    bestelregel_id
) values (
	3,
	1
);

insert into bestelregel( 
    product_id,
    pizzabodem_id,
    pizzasaus_id,
    prijs,
    smaak,
    optie_id,
    aantal,
    extra_ingredienten_id,
    extra_aantal,
    extra_prijs
) values (
	( select product_id from product where upper(naam) = upper('Pollo Pomodore') ),
	( select pizzabodem_id from pizzabodem where upper(naam) = upper('Large Pizza') ),
	( select ingredient_id from ingredient where upper(naam) = upper('Barbecue Saus') ),
	12.95,
	null,
	null,
	1,
	1,
	'Zon gedroogde tomaten',
	0.75
);

insert into bestelling_bestelregel( 
    bestelling_id,
    bestelregel_id
) values (
	3,
	2
);

insert into klant(adres_id, telefoonnummer, postcode, huisnummer, voornaam, achternaam) values(null, '0407654321', '5611NN', '11a', 'Piet', 'Paulusma');

insert into bestelling( 
    filiaal_id,
    klant_id,
    besteldatum,
    afhaal_bezorgen, 
    afhaal_bezorg_tijd,
    coupon_id,
    coupon_korting,
    totaalprijs
) values (
	( select filiaal_id from filiaal where upper(naam) = upper('Eindhoven Woensel') ),
	( select klant_id from klant where upper(voornaam) = upper('Piet') and upper(achternaam) = upper('Paulusma') ),
	STR_TO_DATE('24-01-18 18:20', '%d-%m-%Y %T'),
	'AFHALEN',
	STR_TO_DATE('25-01-18 18:45', '%d-%m-%Y %T'),
	null,
	0,
	13.95
);

insert into bestelregel( 
    product_id,
    pizzabodem_id,
    pizzasaus_id,
    prijs,
    smaak,
    optie_id,
    aantal,
    extra_ingredienten_id,
    extra_aantal,
    extra_prijs
) values (
	( select product_id from product where upper(naam) = upper('Shoarma') ),
	( select pizzabodem_id from pizzabodem where upper(naam) = upper('Italian Pizza') ),
	( select ingredient_id from ingredient where upper(naam) = upper('Barbecue Saus') ),
	8.95,
	null,
	null,
	1,
	null,
	null,
	null
);

insert into bestelling_bestelregel( 
    bestelling_id,
    bestelregel_id
) values (
	4,
	1
);

insert into bestelregel( 
    product_id,
    pizzabodem_id,
    pizzasaus_id,
    prijs,
    smaak,
    optie_id,
    aantal,
    extra_ingredienten_id,
    extra_aantal,
    extra_prijs
) values (
	( select product_id from product where upper(naam) = upper('Fresh Salad') ),
	null,
	null,
	2.5,
	null,
	null,
	2,
	null,
	null,
	null
);

insert into bestelling_bestelregel( 
    bestelling_id,
    bestelregel_id
) values (
	4,
	2
);

insert into bestelling( 
    filiaal_id,
    klant_id,
    besteldatum,
    afhaal_bezorgen, 
    afhaal_bezorg_tijd,
    coupon_id,
    coupon_korting,
    totaalprijs
) values (
	( select filiaal_id from filiaal where upper(naam) = upper('Eindhoven Woensel') ),
	( select klant_id from klant where upper(voornaam) = upper('Piet') and upper(achternaam) = upper('Paulusma') ),
	STR_TO_DATE('27-01-18 17:15', '%d-%m-%Y %T'),
	'BEZORGEN',
	'Zo snel mogelijk',
	( select coupon_id from coupon where upper(omschrijving) = upper('10% korting bij 2 Chicken Combobox') ),
	2.635,
	23.714999999999996
);

insert into bestelregel( 
    product_id,
    pizzabodem_id,
    pizzasaus_id,
    prijs,
    smaak,
    optie_id,
    aantal,
    extra_ingredienten_id,
    extra_aantal,
    extra_prijs
) values (
	( select product_id from product where upper(naam) = upper('Chicken Combobox') ),
	null,
	null,
	5.95,
	null,
	null,
	2,
	null,
	null,
	null
);

insert into bestelling_bestelregel( 
    bestelling_id,
    bestelregel_id
) values (
	5,
	1
);

insert into bestelregel( 
    product_id,
    pizzabodem_id,
    pizzasaus_id,
    prijs,
    smaak,
    optie_id,
    aantal,
    extra_ingredienten_id,
    extra_aantal,
    extra_prijs
) values (
	( select product_id from product where upper(naam) = upper('0.33 liter Coca Cola') ),
	null,
	null,
	1.5,
	null,
	null,
	1,
	null,
	null,
	null
);

insert into bestelling_bestelregel( 
    bestelling_id,
    bestelregel_id
) values (
	5,
	2
);

insert into bestelregel( 
    product_id,
    pizzabodem_id,
    pizzasaus_id,
    prijs,
    smaak,
    optie_id,
    aantal,
    extra_ingredienten_id,
    extra_aantal,
    extra_prijs
) values (
	( select product_id from product where upper(naam) = upper('500ml B & J Ice Cream') ),
	null,
	null,
	6.5,
	ifnull(( select smaak from product where upper(naam) = upper('500ml B & J Ice Cream') ), null),
	null,
	1,
	null,
	null,
	null
);

insert into bestelling_bestelregel( 
    bestelling_id,
    bestelregel_id
) values (
	5,
	3
);

insert into bestelregel( 
    product_id,
    pizzabodem_id,
    pizzasaus_id,
    prijs,
    smaak,
    optie_id,
    aantal,
    extra_ingredienten_id,
    extra_aantal,
    extra_prijs
) values (
	( select product_id from product where upper(naam) = upper('Dessert Box') ),
	null,
	null,
	6.45,
	null,
	( select product_id from product where upper(naam) = upper('Sweet Icing Saus' and optie = 1)),
	1,
	null,
	null,
	null
);

insert into bestelling_bestelregel( 
    bestelling_id,
    bestelregel_id
) values (
	5,
	4
);

