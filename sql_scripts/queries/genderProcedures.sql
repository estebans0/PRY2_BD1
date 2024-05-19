-- INSERT
DELIMITER //
CREATE PROCEDURE insertGender (IN pName VARCHAR(220))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to add a new gender' AS message;
    END;

    DECLARE EXIT HANDLER FOR SQLSTATE '23000'
    BEGIN
        ROLLBACK;
        SELECT 'Gender already exists' AS message;
    END;

    START TRANSACTION;

    INSERT INTO gender (name)
    VALUES (pName);

    COMMIT;
END //
DELIMITER ;

-- EDIT
DELIMITER //
CREATE PROCEDURE editGender (IN pId INT, IN pName VARCHAR(220))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to edit the gender name' AS message;
    END;

    START TRANSACTION;

    UPDATE gender
    SET name = pName
    WHERE id = pId;

    COMMIT;
END //
DELIMITER ;

-- GET ALL DATA
DELIMITER //
CREATE PROCEDURE getGendersData()
BEGIN
    SELECT id, name FROM gender;
END //
DELIMITER ;
