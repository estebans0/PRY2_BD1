-- INSERT
DELIMITER //
CREATE PROCEDURE insertProduction (
    IN pAirdate DATE,
    IN pTitle VARCHAR(260),
    IN pRunTime INT,
    IN pSynopsis VARCHAR(2000),
    IN pTrailer VARCHAR(700),
    IN pPrice DECIMAL(8,2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to add a new production' AS message;
    END;

    START TRANSACTION;
    INSERT INTO production (airdate, title, run_time, synopsis, trailer, price)
    VALUES (pAirdate, pTitle, pRunTime, pSynopsis, pTrailer, pPrice);
    COMMIT;
END //
DELIMITER ;

-- INSERT MOVIE
DELIMITER //
CREATE PROCEDURE insertMovie ()
BEGIN
    DECLARE pLastProdId INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to add a new movie' AS message;
    END;

    START TRANSACTION;
    SELECT LAST_INSERT_ID() INTO pLastProdId; 
    IF pLastProdId IS NULL OR pLastProdId = 0 THEN
        ROLLBACK;
        SELECT 'No production ID found' AS message;
    END IF;

    INSERT INTO movie (id)
    VALUES (pLastProdId);
    COMMIT;
END //
DELIMITER ;
-- INSERT SERIES
DELIMITER //
CREATE PROCEDURE insertMovie ()
BEGIN
    DECLARE pLastProdId INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to add a new movie' AS message;
    END;

    START TRANSACTION;
    SELECT LAST_INSERT_ID() INTO pLastProdId; 
    IF pLastProdId IS NULL OR pLastProdId = 0 THEN
        ROLLBACK;
        SELECT 'No production ID found' AS message;
    END IF;

    INSERT INTO series (id)
    VALUES (pLastProdId);
    COMMIT;
END //
DELIMITER ;

-- GET ALL PRODUCTIONS DATA
DELIMITER //
CREATE PROCEDURE getAllProdsData ()
BEGIN
    SELECT id, airdate, title, run_time, synopsis, trailer, price
    FROM production;
END //
DELIMITER ;

-- GET ROLES DATA
DELIMITER //
CREATE PROCEDURE getRolesData()
BEGIN
    SELECT type, name, character_name FROM rol;
END //
DELIMITER ;

-- TOP N PRODUCTIONS ------------------------------------------------------------------------------------------------------------------------
-- INSERT 
DELIMITER //
CREATE PROCEDURE getTopRatedProductions(IN pTopN INT)
BEGIN
    TRUNCATE TABLE top_rated_productions;

    INSERT INTO top_rated_productions (id, title, avg_rating)
    SELECT 
        p.id,
        p.title,
        AVG(r.raiting) AS average_rating
    FROM 
        production p
    JOIN 
        review r ON p.id = r.id_production
    GROUP BY 
        p.id, p.title
    ORDER BY 
        average_rating DESC
    LIMIT 
        pTopN;
END //
DELIMITER ;

-- GET ALL DATA
DELIMITER //
CREATE PROCEDURE getTopProdsData ()
BEGIN
    SELECT id, title, avg_rating
    FROM top_rated_productions;
END //
DELIMITER ;
-- FIN TOP N PRODUCTIONS -----------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$
-- ------------------------------------------------------------------------------------
-- Get data from productions by id.													 --
-- ------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS getProductionData$$
CREATE PROCEDURE getProductionData (IN ProdId INT)
BEGIN
    SELECT DATE_FORMAT(production.airdate, '%d/%m/%Y') AS airdate, 
		   production.title, production.run_time, production.synopsis, production.trailer
    FROM production
    WHERE production.id = ProdId;
END$$

DROP PROCEDURE IF EXISTS getRaitings$$ -- Esto podia ser parte de getProductionData si lo anidaba, nimodo. 
CREATE PROCEDURE getRaitings (IN ProdId INT)
BEGIN
	SELECT COUNT(*) amount, ifnull(AVG(review.raiting),0) average
    FROM review
    where review.id = ProdId;
END$$

-- ------------------------------------------------------------------------------------
-- Get the series.																	 --
-- ------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS getSeries$$
CREATE PROCEDURE getSeries ()
BEGIN
    SELECT id
    FROM series;
END$$

-- ------------------------------------------------------------------------------------
-- Get the movies.																	 --
-- ------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS getMovies$$
CREATE PROCEDURE getMovies ()
BEGIN
    SELECT movie.id_movie id_movie
    FROM movie;
END$$

-- ------------------------------------------------------------------------------------
-- For getting all reviews of a production.											--
-- ------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS getProductionReviews$$
CREATE PROCEDURE getProductionReviews (IN Production INT)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle error
    END;

    SELECT review.raiting AS raiting, review.title AS title, userr.username AS username
    FROM review
    INNER JOIN userr ON userr.id = review.author
    WHERE review.id_production = Production;
END$$

-- ------------------------------------------------------------------------------------
-- For getting all the prices the production had.									 --
-- ------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS pricingFromProduction$$
CREATE PROCEDURE pricingFromProduction (IN Production INT)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle error
    END;

    SELECT log_date, price
    FROM price_log
    WHERE id_production = Production
    ORDER BY log_date ASC;
END$$

-- ------------------------------------------------------------------------------------
-- Get all images from a production.												 --
-- ------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS imagesForProduction$$
CREATE PROCEDURE imagesForProduction (IN Production INT)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle error
    END;

    SELECT image
    FROM production_image
    WHERE production_image.id_production = Production;
END$$
-- ------------------------------------------------------------------------------------
-- Gets all the genres existing in the database.									 --
-- ------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS getGenres$$
CREATE PROCEDURE getGenres()
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle error
    END;

    SELECT id, name, characteristics
    FROM genre;
END$$

-- ------------------------------------------------------------------------------------
-- Gets all genres the production has.												 --
-- ------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS get_genres_of_production$$
CREATE PROCEDURE get_genres_of_production(IN Production INT)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle error
    END;

    SELECT genre.id, genre.name, genre.characteristics
    FROM genre
    INNER JOIN genre_by_prod ON genre_by_prod.id_genre = genre.id
    WHERE genre_by_prod.id_production = Production;
END$$

-- ------------------------------------------------------------------------------------
-- For getting production company names.											 --
-- ------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS getProductionCompanyNames$$
CREATE PROCEDURE getProductionCompanyNames (IN Production INT)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle error
    END;

    SELECT prod_company.name
    FROM prod_company
    INNER JOIN prod_by_company ON prod_company.id = prod_by_company.id_company
    WHERE prod_by_company.id_production = Production;
END$$
-- ------------------------------------------------------------------------------------
-- For getting the platforms of a production.										 --
-- ------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS getPlatforms$$
CREATE PROCEDURE getPlatforms (IN Production INT)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle error
    END;

    SELECT platform.name, platform.url
    FROM platform
    INNER JOIN prod_in_platform ON platform.id = prod_in_platform.id_platform
    WHERE prod_in_platform.id_production = Production;
END$$
-- ------------------------------------------------------------------------------------
-- For getting the countries a production took place in.							 --
-- ------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS getProductionCountries$$
CREATE PROCEDURE getProductionCountries (IN Production INT)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle error
    END;

    SELECT country.name
    FROM country
    INNER JOIN prod_by_country ON prod_by_country.id_country = country.id
    WHERE prod_by_country.id_production = Production;
END$$

-- ------------------------------------------------------------------------------------
-- For getting all people that worked on a production, regardless of who they are.  --
-- ------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS getProductionFP$$
CREATE PROCEDURE getProductionFP (IN Production INT)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle error
    END;

    SELECT concat(person.first_name,' ',person.last_name) name, person.id
    FROM person
    INNER JOIN production_crew ON production_crew.id_crew_member = person.id
    WHERE production_crew.id_production = Production;
END$$
-- ------------------------------------------------------------------------------------
DELIMITER ;


CALL getMovies();
