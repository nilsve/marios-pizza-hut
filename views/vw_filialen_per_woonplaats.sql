create or replace view vw_filialen_per_woonplaats
as
select          a.woonplaats, 
                count(f.naam) filialen 
from            filiaal f, 
                adres a 
where           f.adres_id = a.adres_id 
group by        woonplaats;