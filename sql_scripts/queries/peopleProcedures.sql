-- *********************************************** PERSON PROCEDURES ***********************************************
-- INSERT
DELIMITER //
CREATE PROCEDURE insertPerson (
    IN pFirstName VARCHAR(220),
    IN pLastName VARCHAR(220),
    IN pMiddleName VARCHAR(220),
    IN pNickName VARCHAR(220),
    IN pGender INT,
    IN pDob DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to add a new person' AS message;
    END;

    START TRANSACTION;
    
    INSERT INTO person (first_name, last_name, middle_name, nickname, gender, birthdate)
    VALUES (pFirstName, pLastName, pMiddleName, pNickName, pGender, pDob);
    
    COMMIT;
END //
DELIMITER ;

-- GET ALL PEOPLE DATA
DELIMITER //
CREATE PROCEDURE getPeopleData ()
BEGIN
    SELECT id, birthdate, first_name, last_name, middle_name, nickname, image, gender
    FROM person;
END //
DELIMITER ;
-- *********************************************** FILM PERSON PROCEDURES ***********************************************
-- INSERT
DELIMITER //
CREATE PROCEDURE insertFilmPerson (
    IN pHeight INT,
    IN pTrivia VARCHAR(1200),
    IN pBiography VARCHAR(1200),
    IN pNationality INT,
    IN pRole INT
)
BEGIN
	DECLARE pLastPersonId INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to add a new film person' AS message;
    END;

    START TRANSACTION;
    -- Obtener el ID de la última persona insertada
    SELECT LAST_INSERT_ID() INTO pLastPersonId;
    
    INSERT INTO film_person (id, height_cm, trivia, biography, nacionality, id_city, rol)
    VALUES (pLastPersonId, pHeight, pTrivia, pBiography, pNationality, NULL, pRole);
    
    COMMIT;
END //
DELIMITER ;

-- GET ALL FILM PEOPLE DATA
DELIMITER //
CREATE PROCEDURE getFilmPeopleData ()
BEGIN
    SELECT id, height_cm, trivia, biography, nacionality, rol
    FROM film_person;
END //
DELIMITER ;
