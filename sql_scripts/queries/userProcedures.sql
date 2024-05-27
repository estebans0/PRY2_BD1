-- INSERT USER
DELIMITER //
CREATE PROCEDURE insertUser (
    IN pUsername VARCHAR(230),
    IN pPassword VARCHAR(220),
    IN pEmail VARCHAR(220),
    IN pIdType INT,
    IN pLegalId VARCHAR(208)
)
BEGIN
    DECLARE pLastPersonId INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to add a new user' AS message;
    END;

    DECLARE EXIT HANDLER FOR SQLSTATE '23000'
    BEGIN
        ROLLBACK;
        SELECT 'User already exists' AS message;
    END;

    START TRANSACTION;
    -- Obtener el ID de la última persona insertada
    SELECT LAST_INSERT_ID() INTO pLastPersonId;

    -- Insertar un nuevo usuario con el ID de la última persona insertada
    INSERT INTO userr (id, username, password, email, legal_id, id_type, user_type)
    VALUES (pLastPersonId, pUsername, HEX(AES_ENCRYPT(pPassword, 'key1234')), pEmail, pLegalId, pIdType, 0);
    COMMIT;
END //
DELIMITER ;

-- GET ALL USERS DATA
DELIMITER //
CREATE PROCEDURE getUsersData ()
BEGIN
    SELECT id, username, CAST(AES_DECRYPT(UNHEX(password), 'key1234') AS CHAR), email, legal_id, id_type, user_type FROM userr;
END //
DELIMITER ;

-- MAKE OR REMOVE ADMIN
DELIMITER //
CREATE PROCEDURE makeOrRemoveAdmin (
    IN pId INT,
    IN pType INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to make or remove an admin' AS message;
    END;

    START TRANSACTION;
    
    UPDATE userr
    SET user_type = pType
    WHERE id = pId;
    
    IF ROW_COUNT() = 0 THEN
        SELECT 'User with the specified ID not found' AS message;
    ELSE
        COMMIT;
    END IF;
END //
DELIMITER ;
