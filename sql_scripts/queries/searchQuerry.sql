DELIMITER $$


DROP PROCEDURE IF EXISTS getGenders$$
CREATE PROCEDURE getGenders ()
BEGIN
		SELECT gender.name, count(*) quantity
        FROM gender
        INNER JOIN person
        on person.gender = gender.id 
        Inner join userr
        on userr.id = person.id
        group by gender.name;
END $$

DROP PROCEDURE IF EXISTS getAgeDistribution$$
CREATE PROCEDURE getAgeDistribution ()
BEGIN
    SELECT EXTRACT(YEAR FROM person.birthdate) - EXTRACT(YEAR FROM sysdate) age, count(*) quantity
    from person
    inner join userr
    on person.id = userr.id
    group by EXTRACT(YEAR FROM person.birthdate) - EXTRACT(YEAR FROM sysdate);
END $$

DROP PROCEDURE IF EXISTS getGenreDistribution$$
CREATE PROCEDURE getGenreDistribution ()
BEGIN
    SELECT genre.name, count(*)
    FROM genre
    LEFT JOIN genre_by_prod
    ON genre_by_prod.id_genre = genre.id
    INNER JOIN production
    ON production.id = genre_by_prod.id_production
    group by genre.name; -- Me da miedo este procedimiento D:, funcionara correctamente?
    
END $$

-- Ahora los querries... dios mio hay muchos.



-- ----------------------------------------------------------------------------------------------------------Todo esto se puede lograr en java.
/*n cantidad de productos más comprados
CREATE OR REPLACE PROCEDURE getMostBougth (N IN number, pCursor OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN pCursor FOR
    SELECT production.title, RANK() OVER(ORDER BY pricelog.
    FROM price_log
    ;   Esto se puede hacer en java.
    
END getMostBougth;
/
*/
-- ----------------------------------------------------------------------------------------------------------
-- Busqueda de producciones

-- Top N de 250 productos más populares, contiene el review

DELIMITER ;