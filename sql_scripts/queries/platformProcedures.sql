-- INSERT
DELIMITER //
CREATE PROCEDURE insertPlatform (IN pName VARCHAR(230), IN pUrl VARCHAR(260))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to add a new platform' AS message;
    END;

    DECLARE EXIT HANDLER FOR SQLSTATE '23000'
    BEGIN
        ROLLBACK;
        SELECT 'Platform already exists' AS message;
    END;

    START TRANSACTION;

    INSERT INTO platform (url, name)
    VALUES (pUrl, pName);

    COMMIT;
END //
DELIMITER ;

-- EDIT
DELIMITER //
CREATE PROCEDURE editPlatform (IN pId INT, IN pName VARCHAR(230), IN pUrl VARCHAR(260))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to edit the platform' AS message;
    END;

    START TRANSACTION;

    UPDATE platform
    SET name = pName, url = pUrl
    WHERE id = pId;

    COMMIT;
END //
DELIMITER ;

-- GET ALL DATA
DELIMITER //
CREATE PROCEDURE getPlatformsData()
BEGIN
    SELECT id, url, name FROM platform;
END //
DELIMITER ;
