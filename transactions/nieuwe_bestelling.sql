drop procedure if exists nieuwe_bestelling;

create procedure nieuwe_bestelling()
begin

    declare exit handler for sqlexception
        begin
            select @debug ROLLED_BACK;
            rollback;
        end;

    start transaction;

        -- Read only data which is commited
        set transaction isolation level read comitted;

        set @debug = 'start - ';

        -- Adres
        set @new_huisnummer = 1;
        set @new_postcode   = '5612MA';
        set @new_toevoeging = null;
        set @new_woonplaats = 'EINDHOVEN';
        set @new_straatnaam = 'Rachelsmolen';

        -- Klant
        set @new_voornaam       = 'Fontys';
        set @new_achternaam     = 'Hogeschool';
        set @new_telefoonnummer = '0612345678';

        -- Bestelling
        set @new_betaaltype_id   = 1;  -- iDeal
        set @new_filiaal_id      = 53; -- Eindhoven Tongelre
        set @new_afhaal_bezorgen = 'bezorgen';
        set @new_coupon_id       = 3;
        set @new_totaalprijs     = 99.99;

        -- Product
        set @new_prijs_optie_bedrag = 1.50;
        set @new_prijs_bedrag       = 9.95;
        set @new_product_id         = 1;
        set @new_aantal             = 1;

        -- Pizzasamenstelling
        set @new_standaard_pizza_id      = 1;

        -- Extra ingredient
        set @new_extra_ingredient_id     = 8; -- Bacon

        set @debug = concat(@debug, 'variables ok - ');

        -- Try to fetch postcode_id, adres_id and klant_id before insert the actual order
        begin
            --  Not found handler for customer
            declare continue handler for not found
                begin
                    set @v_klant_id = null;
                end;

            begin
                -- Not found handler for postal code
                declare continue handler for not found
                    begin
                        set @v_postcode_id = null;
                    end;
                -- Check if @new_huisnummer is even or odd number
                if mod(@new_huisnummer, 2) != 0 then
                    set @new_reeks = 0;
                else
                    set @new_reeks = 1;
                end if;

                -- Try to select postcode_id, if it is not available v_postcode_id is null;
                select  postcode_id
                into    @v_postcode_id
                from    postcode
                where   postcode        = @new_postcode
                and     @new_reeks      = reeks
                and     @new_huisnummer  between eerste_huis and laatste_huis;

                set @debug = concat(@debug, 'postcode ok - ');

                if @v_postcode_id is null then
                    -- Business logic for not found postal code
                    -- TODO: Hier zou je een error willen gooien vanuit de browser ofzo
                    select 'Business logic for not found postal code';
                end if;
            end;

            -- Check if address is known
            begin
                -- Not found handler for address
                declare continue handler for not found
                    begin
                        set @v_adres_id = null;
                    end;

                -- Try to select adres_id, if it is not available v_adres_id is null
                select  adres_id
                into    @v_adres_id
                from    adres
                where   postcode    = @new_postcode
                and     huisnummer  = @new_huisnummer
                and     toevoeging  = @new_toevoeging
                and     woonplaats  = @new_woonplaats
                and     straatnaam  = @new_straatnaam;

                set @debug = concat(@debug, 'adres ok - ');

                if @v_adres_id is null then
                    set @debug = concat(@debug, 'insert address - ');
                    -- If it is null (not known) insert new address
                    insert into adres(
                        postcode,
                        huisnummer,
                        toevoeging,
                        woonplaats,
                        straatnaam
                    ) values (
                        @new_postcode,
                        @new_huisnummer,
                        @new_toevoeging,
                        @new_woonplaats,
                        @new_straatnaam
                    );
                    set @debug = concat(@debug, 'ok - ');
                end if;
            end;

            -- Try to select klant_id, if it is not available v_klant_id is null
            select  klant_id
            into    @v_klant_id
            from    klant
            where   voornaam        = @new_voornaam
            and     achternaam      = @new_achternaam
            and     postcode        = @new_postcode
            and     huisnummer      = @new_huisnummer
            and     telefoonnummer  = @new_telefoonnummer;

            set @debug = concat(@debug, 'klant ok - ');

            if @v_klant_id is null then
                set @debug = concat(@debug, 'insert klant - ');

                -- If it is null (not known) insert new customer
                insert into klant (
                    adres_id,
                    telefoonnummer,
                    postcode,
                    huisnummer,
                    voornaam,
                    achternaam
                ) values (
                    cast(ifnull(@v_adres_id, last_insert_id()) as char(11)),
                    @new_telefoonnummer,
                    @new_postcode,
                    @new_huisnummer,
                    @new_voornaam,
                    @new_achternaam
                );
                set @debug = concat(@debug, 'ok - ');
            end if;
        end;

        set @debug = concat(@debug, 'insert bestelling - ');

        insert into bestelling(
            betaaltype_id,
            filiaal_id,
            klant_id,
            besteldatum,
            afhaal_bezorgen,
            afhaal_bezorg_tijd,
            coupon_id,
            totaalprijs
        ) values (
            @new_betaaltype_id,
            @new_filiaal_id,
            cast(ifnull(@v_klant_id, last_insert_id()) as char(11)),
            now(),
            @new_afhaal_bezorgen,
            null,
            @new_coupon_id,
            @new_totaalprijs
        );

        set @debug = concat(@debug, 'ok - ');

        -- Get bestelling_id from last_insert_id
        set @new_bestelling_id := last_insert_id();


        -- insert order details (multiple times)
        -- TODO: This actually should be looped for the amount of products in the order.
        begin
            begin
            -- Check if price is known
                -- Not found handler for price
                declare continue handler for not found
                    begin
                        set @v_prijs_id = null;
                    end;
                -- Try to select prijs_id, if it is not available v_prijs_id is null
                select  prijs_id
                into    @v_prijs_id
                from    prijs
                where   bedrag      = @new_prijs_bedrag
                and     einddatum   is null;

                set @debug = concat(@debug, 'prijs 1 ok - ');

                if @v_prijs_id is null then
                    -- If it is null (not known) insert new price
                    set @debug = concat(@debug, 'insert prijs 1 - ');
                    insert into prijs(
                        bedrag,
                        begindatum,
                        einddatum
                    ) values (
                        @new_prijs_bedrag,
                        now(),
                        null
                    );
                    set @debug = concat(@debug, 'ok - ');
                end if;

                set @prijs_insert_id = last_insert_id();
            end;

            -- Check if price option is known
            begin
                -- Not found handler for price option
                declare continue handler for not found
                    begin
                        set @v_prijs_optie_id = null;
                    end;
                -- Try to select prijs_id, if it is not available v_prijs_optie_id is null
                select  prijs_id
                into    @v_prijs_optie_id
                from    prijs
                where   bedrag      = @new_prijs_optie_bedrag
                and     einddatum   is null;

                set @debug = concat(@debug, 'prijs 2 ok - ');

                if @v_prijs_optie_id is null then
                    set @debug = concat(@debug, 'insert prijs 2 - ');
                    -- If it is null (not known) insert new price option
                    insert into prijs(
                        bedrag,
                        begindatum,
                        einddatum
                    ) values (
                        @new_prijs_optie_bedrag,
                        now(),
                        null
                    );
                    set @debug = concat(@debug, 'ok - ');
                end if;

                set @prijs_optie_insert_id = last_insert_id();
            end;

            begin
                set @debug = concat(@debug, 'insert bestelregel - ');
                insert into bestelregel(
                    bestelling_id,
                    product_id,
                    prijs_id,
                    prijs_optie_id,
                    aantal
                ) values (
                    @new_bestelling_id,
                    @new_product_id,
                    cast(ifnull(@v_prijs_id, @prijs_insert_id) as char(11)),
                    cast(ifnull(@v_prijs_optie_id, @prijs_optie_insert_id) as char(11)),
                    @new_aantal
                );
                set @debug = concat(@debug, 'ok - ');
            end;

        end;

        -- insert custom pizzas (multiple times)
        -- TODO: This actually should be looped for the amount of custom pizzas in the order.
        begin
            begin
                set @debug = concat(@debug, 'insert p_samenstelling - ');
                insert into pizza_samenstelling(
                    bestelling_id,
                    pizzabodem_id,
                    naam,
                    omschrijving,
                    spicy,
                    vegetarisch,
                    beschikbaar,
                    pizza_standaard_prijs_id,
                    pizza_standaard_bezorgtoeslag_id
                )
                select  @new_bestelling_id,
                        pizzabodem_id,
                        naam,
                        omschrijving,
                        spicy,
                        vegetarisch,
                        beschikbaar,
                        prijs_id,
                        bezorgtoeslag_id
                from    pizza_standaard
                where   pizza_standaard_id = @new_standaard_pizza_id;
                set @debug = concat(@debug, 'ok - ');
            end;


            set @new_pizzasamenstelling_id = last_insert_id();

            -- Insert combination of custom pizza and its ingredients
            -- This is actually a copy from the standard pizza including some extra ingredients
            begin
                set @debug = concat(@debug, 'insert p_samenstelling_ingredient - ');
                insert into pizza_samenstelling_ingredient(
                    pizza_samenstelling_id,
                    pizza_ingredient_id,
                    prijs_id,
                    is_standaard
                )
                select  @new_pizzasamenstelling_id,
                        p.pizza_ingredient_id,
                        i.prijs_id,
                        1
                from    pizza_standaard_pizza_ingredient p,
                        pizza_ingredient i
                where   p.pizza_ingredient_id = i.pizza_ingredient_id
                and     p.pizza_standaard_id  = @new_standaard_pizza_id;
                set @debug = concat(@debug, 'ok - ');

                -- begin
                -- select prijs_id from pizza_ingredient where pizza_ingredient_id = @new_extra_ingredient_id;
                --     set @debug = concat(@debug, 'insert extra p_samenstelling_ingredient - ');
                --     insert into pizza_samenstelling_ingredient(
                --         pizza_samenstelling_id,
                --         pizza_ingredient_id,
                --         prijs_id,
                --         is_standaard
                --     ) values (
                --         @new_pizzasamenstelling_id,
                --         @new_extra_ingredient_id,
                --         (select prijs_id from pizza_ingredient where pizza_ingredient_id = @new_extra_ingredient_id),
                --         0
                --     );
                --     set @debug = concat(@debug, 'ok - ');
                -- end;

            end;

        end;

    commit;
end