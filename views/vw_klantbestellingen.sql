create or replace view vw_klantbestellingen
as
select      concat(k.voornaam, " ", k.achternaam)   as klant,
            b.bestelling_id,
            b.filiaal_id,
            f.naam                                  as filiaalnaam,
            b.besteldatum,
            b.afhaal_bezorgen,
            b.afhaal_bezorg_tijd,
            b.totaalprijs,
            b.coupon_id,
            c.omschrijving                          as coupon_omschrijving,
            br.bestelregel_id,
            br.product_id,
            pr.naam                                 as productnaam,
            ps.pizza_samenstelling_id,
            ps.naam                                 as pizzanaam,
            br.prijs_id,
            p.bedrag                                as product_pizza_prijs,
            br.prijs_id                             as prijs_optie_id,
            po.bedrag                               as optieprijs
from        bestelling b,
            klant k,
            filiaal f,
            coupon c,
            bestelregel br,
            product pr,
            pizza_samenstelling ps,
            prijs p,
            prijs po
where       b.klant_id        = k.klant_id
and         b.filiaal_id      = f.filiaal_id
and         b.coupon_id       = c.coupon_id
and         b.bestelling_id   = br.bestelling_id
and         br.product_id     = pr.product_id
and         b.bestelling_id   = ps.bestelling_id
and         br.prijs_id       = p.prijs_id
and         br.prijs_id       = po.prijs_id
order by    b.besteldatum desc;