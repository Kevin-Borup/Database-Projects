CREATE FUNCTION count_words(searchKey TEXT)
    RETURNS TABLE (
        id INT,
        title TEXT,
        story TEXT,
        count int
    )
    AS $$
    DECLARE
        var_r record;
    BEGIN
        FOR var_r IN(SELECT f.id, f.title, f.story, count
            FROM fairytales f
            WHERE f.story ILIKE '%' || searchKey || '%') --wildcard søgning
        LOOP
            -- Her loopes gennem alle records som matcher kriteriet
            story := var_r.story;
            id := var_r.id;
            title := var_r.title;
            -- Her laves et regulært udtryk som kigger om der et match ud fra søgenøglen.
            -- Bemærk at g er et globalt match og sættes dette ikke får du kun første forekomst.
            count := (SELECT COUNT(*) FROM regexp_matches(var_r.story, searchKey, 'g'));
            RETURN NEXT;
        END LOOP;
    END; $$
    LANGUAGE 'plpgsql';

    SELECT * FROM count_words('prinsesser')