create or replace view vw_standaard_pizzas
as
select		pspi.pizza_standaard_id,
			ps.beschikbaar              pizza_beschikbaar,
			case ps.beschikbaar
            	when 1 then 'ja'
                when 0 then 'nee'
            end                         pizza_beschikbaar_jn,
			ps.spicy                    pizza_spicy,
			case ps.spicy
            	when 1 then 'ja'
                when 0 then 'nee'
            end                         pizza_spicy_jn,
			ps.vegetarisch              pizza_vegetarisch,
			case ps.vegetarisch
            	when 1 then 'ja'
                when 0 then 'nee'
            end                         pizza_vegetarisch_jn,
            ps.categorie_id,
            c.naam                      categorienaam,
			ps.naam                     pizzanaam,
            pb.pizzabodem_id,
            pb.naam                     pizzabodem_naam,
            pb.omschrijving             pizzabodem_omschrijving,
            pb.diameter,
            pb.beschikbaar              pizzabodem_beschikbaar, 
			case pb.beschikbaar
            	when 1 then 'ja'
                when 0 then 'nee'
            end                         pizzabodem_beschikbaar_jn,
            prp.prijs_id                pizzaprijs_id,
            prp.begindatum              pizzaprijs_begindatum,
            prp.bedrag                  pizzaprijs,
			pspi.pizza_ingredient_id,
            pi.beschikbaar              ingredient_beschikbaar,
            case pi.beschikbaar
            	when 1 then 'ja'
                when 0 then 'nee'
            end                         ingredient_beschikbaar_jn,
            pi.type,
            pi.naam                     ingredientnaam,
            pi.omschrijving             ingredientomschrijving,
            pri.prijs_id                ingredientprijs_id,
            pri.begindatum              ingredient_begindatum,
            pri.bedrag                  ingredientprijs,
           	pspi.aantal
from		pizza_standaard_pizza_ingredient pspi,
			pizza_standaard ps,
            categorie c,
            pizzabodem pb,
            pizza_ingredient pi,
            prijs prp,
            prijs pri
where		pspi.pizza_standaard_id = ps.pizza_standaard_id
and			ps.pizzabodem_id = pb.pizzabodem_id
and			ps.categorie_id = c.categorie_id
and			pspi.pizza_ingredient_id = pi.pizza_ingredient_id
and			ps.prijs_id = prp.prijs_id
and 		pi.prijs_id = pri.prijs_id