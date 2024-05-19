-- INSERT
DELIMITER //
CREATE PROCEDURE insertGenre (IN pName VARCHAR(230), IN pDescription VARCHAR(290))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to add a new genre' AS message;
    END;

    DECLARE EXIT HANDLER FOR SQLSTATE '23000'
    BEGIN
        ROLLBACK;
        SELECT 'Genre already exists' AS message;
    END;

    START TRANSACTION;

    INSERT INTO genre (name, characteristics)
    VALUES (pName, pDescription);

    COMMIT;
END //
DELIMITER ;

-- EDIT
DELIMITER //
CREATE PROCEDURE editGenre (IN pId INT, IN pName VARCHAR(230), IN pDescription VARCHAR(290))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to edit the genre' AS message;
    END;

    START TRANSACTION;

    UPDATE genre
    SET name = pName, characteristics = pDescription
    WHERE id = pId;

    COMMIT;
END //
DELIMITER ;

-- GET ALL DATA
DELIMITER //
CREATE PROCEDURE getGenresData()
BEGIN
    SELECT id, name, characteristics FROM genre;
END //
DELIMITER ;
