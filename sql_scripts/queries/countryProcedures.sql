-- INSERT
DELIMITER //
CREATE PROCEDURE insertCountry (IN pName VARCHAR(230))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to add a new country' AS message;
    END;

    START TRANSACTION;

    INSERT INTO country (name)
    VALUES (pName);

    COMMIT;
END //
DELIMITER ;

-- EDIT
DELIMITER //
CREATE PROCEDURE editCountryName (IN pId INT, IN pName VARCHAR(230))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to edit the country name' AS message;
    END;

    START TRANSACTION;

    UPDATE country
    SET name = pName
    WHERE id = pId;

    COMMIT;
END //
DELIMITER ;

-- GET ALL DATA
DELIMITER //
CREATE PROCEDURE getCountriesData()
BEGIN
    SELECT id, name FROM country;
END //
DELIMITER ;
