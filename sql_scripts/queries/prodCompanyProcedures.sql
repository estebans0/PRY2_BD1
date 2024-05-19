-- INSERT
DELIMITER //
CREATE PROCEDURE insertProdCompany (IN pName VARCHAR(230))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to add a new prod company' AS message;
    END;

    DECLARE EXIT HANDLER FOR SQLSTATE '23000'
    BEGIN
        ROLLBACK;
        SELECT 'ProdCompany already exists' AS message;
    END;

    START TRANSACTION;

    INSERT INTO prod_company (name)
    VALUES (pName);

    COMMIT;
END //
DELIMITER ;

-- EDIT
DELIMITER //
CREATE PROCEDURE editProdCompany (IN pId INT, IN pName VARCHAR(230))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Unexpected error when trying to edit the prod company' AS message;
    END;

    START TRANSACTION;

    UPDATE prod_company
    SET name = pName
    WHERE id = pId;

    COMMIT;
END //
DELIMITER ;

-- GET ALL DATA
DELIMITER //
CREATE PROCEDURE getProdCompanyData()
BEGIN
    SELECT id, name FROM prod_company;
END //
DELIMITER ;
