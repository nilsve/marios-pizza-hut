create or replace view vw_pizza_prijs_avg_max
as
select  p1.*
from    vw_standaard_pizzas p1
where   p1.pizzaprijs
        between
            (select avg(p2.pizzaprijs) from vw_standaard_pizzas p2)
        and
            (select max(p3.pizzaprijs) from vw_standaard_pizzas p3);