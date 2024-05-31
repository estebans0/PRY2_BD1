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
    
    INSERT INTO film_person (id, heigth_cm, trivia, biography, nacionality, id_city, rol)
    VALUES (pLastPersonId, pHeight, pTrivia, pBiography, pNationality, NULL, pRole);
    COMMIT;
END //
DELIMITER ;

-- GET ALL FILM PEOPLE DATA
DELIMITER //
CREATE PROCEDURE getFilmPeopleData ()
BEGIN
    SELECT id, heigth_cm, trivia, biography, nacionality, rol
    FROM film_person;
END //
DELIMITER ;

-- *********************************************** RELATIONSHIPS PROCEDURES ***********************************************
-- INSERT PARTNER
DELIMITER //
CREATE PROCEDURE insertPartner (
    IN pId1 INT,
    IN pId2 INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error' AS message;
    END;

    START TRANSACTION;
    
    INSERT INTO partner_of (id_partner1, id_partner2)
    VALUES (pId1, pId2);
    COMMIT;
END //
DELIMITER;

-- GET PARTNER ID
DELIMITER //
CREATE PROCEDURE getPartnerId (IN pId1 INT)
BEGIN
	SELECT id_partner2
    FROM partner_of
    WHERE id_partner1 = pId1;
END //
DELIMITER ;

-- INSERT PARENT
DELIMITER //
CREATE PROCEDURE insertParent (
    IN pIdParent INT,
    IN pIdChild INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error' AS message;
    END;

    START TRANSACTION;
    
    INSERT INTO parent_of (id_parent, id_child)
    VALUES (pIdParent, pIdChild);
    COMMIT;
END //
DELIMITER;

-- GET PARTNER ID
DELIMITER //
CREATE PROCEDURE getParentId (IN pIdChild INT)
BEGIN
	SELECT id_parent
    FROM parent_of
    WHERE id_child = pIdChild;
END //
DELIMITER ;

-- *********************************************** PERSON PROCEDURES ***********************************************
-- INSERT
DELIMITER //
CREATE PROCEDURE insertPerson (
    IN pFirstName VARCHAR(220),
    IN pLastName VARCHAR(220),
    IN pMiddleName VARCHAR(220),
    IN pNickName VARCHAR(220),
    IN pGender INT,
    IN pDob DATE,
    IN pImage BLOB
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to add a new person' AS message;
    END;

    START TRANSACTION;
    
    INSERT INTO person (first_name, last_name, middle_name, nickname, gender, birthdate, image)
    VALUES (pFirstName, pLastName, pMiddleName, pNickName, pGender, pDob, pImage);
    
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
