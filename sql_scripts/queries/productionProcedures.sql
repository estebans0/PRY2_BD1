DELIMITER $$
-- Get data from productions by id.
DROP PROCEDURE IF EXISTS getProductionData$$
CREATE PROCEDURE getProductionData (IN ProdId INT)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle error, e.g., set error flag, log error, etc.
    END;

    SELECT id, airdate, title, run_time, synopsis, trailer
    FROM production
    WHERE id = ProdId;
END$$
-- ------------------------------------------------------------------------------------
-- Get the series.																	 --
-- ------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS getSeries$$
CREATE PROCEDURE getSeries ()
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		BEGIN
			-- Handle error
		END;

    SELECT id
    FROM series;
END$$

-- ------------------------------------------------------------------------------------
-- Get the movies.																	 --
-- ------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS getMovies$$
CREATE PROCEDURE getMovies ()
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle error
    END;

    SELECT id_movie
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

    SELECT person.first_name, person.id
    FROM person
    INNER JOIN production_crew ON production_crew.id_crew_member = person.id
    WHERE production_crew.id_production = Production;
END$$
-- ------------------------------------------------------------------------------------
DELIMITER ;