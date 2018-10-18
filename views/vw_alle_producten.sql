create or replace view vw_product_per_winkel
as 
select distinct     c.naam                              as Categorie,
                    concat("Product - ", p.naam)        as Product,
                    pp.bedrag                           as Prijs
from                categorie c,
                    product p,
                    prijs pp
where               p.categorie_id = c.categorie_id
and                 p.prijs_id = pp.prijs_id
union all
select              c.naam                              as Categorie,
                    concat("Ingredient - ", i.naam)     as Product,
                    pi.bedrag                           as Prijs
from                categorie c,
                    pizza_ingredient i,
                    prijs pi
where               i.categorie_id = c.categorie_id
and                 i.prijs_id = pi.prijs_id
union all
select distinct     ps.categorienaam                    as Categorie,
                    concat("Pizza - ", ps.pizzanaam)   as Product,
                    ps.pizzaprijs                       as Prijs
from                vw_standaard_pizzas ps