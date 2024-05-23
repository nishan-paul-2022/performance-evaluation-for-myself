DO $$
DECLARE
    year INTEGER:= 2024;
    start_date DATE:= DATE '2024-05-12';
    end_date DATE:= DATE '2024-12-31';
    num_days INTEGER;
    i INTEGER:= 0;

BEGIN
    num_days:= end_date - start_date;
    FOR i IN 0..num_days LOOP
        INSERT INTO main_legend(id, day, devotion, breaking, yoga, fueling, healing)
        VALUES(DEFAULT, TO_CHAR((start_date + i), 'DD Mon, YYYY'), '', '', '', '', '');
    END LOOP;
END;
$$ LANGUAGE plpgsql;