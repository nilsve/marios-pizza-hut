use mario;
CREATE OR REPLACE VIEW klantVerschilBestellingen AS
SELECT
    k.*,
    (
        SELECT 
            DATEDIFF(b.besteldatum, (
                SELECT b2.besteldatum FROM bestelling b2
                WHERE b2.besteldatum < (
                    SELECT b3.besteldatum FROM bestelling b3
                    WHERE b3.klant_id = k.klant_id
                    ORDER BY b3.besteldatum DESC 
                    LIMIT 1
                )
                ORDER BY besteldatum DESC 
                LIMIT 1
            )) as verschil
        FROM bestelling b
        WHERE b.klant_id = k.klant_id
        ORDER BY b.besteldatum DESC
        LIMIT 1
    ) as verschil
FROM klant k