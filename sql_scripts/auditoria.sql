-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE production
ADD COLUMN created_by1 VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_production_insert
BEFORE INSERT ON production
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by1 = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_production_update
BEFORE UPDATE ON production
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
    
    -- Insert into price_log if the price has changed
    IF NEW.price != OLD.price THEN
        INSERT INTO price_log (id_production, old_price, new_price)
        VALUES (OLD.id, OLD.price, NEW.price);
    END IF;
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE price_log
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_price_log_insert
BEFORE INSERT ON price_log
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_price_log_update
BEFORE UPDATE ON price_log
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE cart
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_cart_insert
BEFORE INSERT ON cart
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_cart_update
BEFORE UPDATE ON cart
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE cast_of_production
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_cast_of_production_insert
BEFORE INSERT ON cast_of_production
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_cast_of_production_update
BEFORE UPDATE ON cast_of_production
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE country
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_country_insert
BEFORE INSERT ON country
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_country_update
BEFORE UPDATE ON country
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE episode
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_episode_insert
BEFORE INSERT ON episode
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_episode_update
BEFORE UPDATE ON episode
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE film_person
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_film_person_insert
BEFORE INSERT ON film_person
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_film_person_update
BEFORE UPDATE ON film_person
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE gender
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_gender_insert
BEFORE INSERT ON gender
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_gender_update
BEFORE UPDATE ON gender
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE genre
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_genre_insert
BEFORE INSERT ON genre
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_genre_update
BEFORE UPDATE ON genre
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE genre_by_prod
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_genre_by_prod_insert
BEFORE INSERT ON genre_by_prod
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_genre_by_prod_update
BEFORE UPDATE ON genre_by_prod
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE movie
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_movie_insert
BEFORE INSERT ON movie
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_movie_update
BEFORE UPDATE ON movie
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE parent_of
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_parent_of_insert
BEFORE INSERT ON parent_of
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_parent_of_update
BEFORE UPDATE ON parent_of
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE partner_of
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_partner_of_insert
BEFORE INSERT ON partner_of
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_partner_of_update
BEFORE UPDATE ON partner_of
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE payment_method
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_payment_method_insert
BEFORE INSERT ON payment_method
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_payment_method_update
BEFORE UPDATE ON payment_method
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE person
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_person_insert
BEFORE INSERT ON person
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_person_update
BEFORE UPDATE ON person
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE platform
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_platform_insert
BEFORE INSERT ON platform
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_platform_update
BEFORE UPDATE ON platform
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE prod_by_company
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_prod_by_company_insert
BEFORE INSERT ON prod_by_company
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_prod_by_company_update
BEFORE UPDATE ON prod_by_company
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE prod_by_country
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_prod_by_country_insert
BEFORE INSERT ON prod_by_country
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_prod_by_country_update
BEFORE UPDATE ON prod_by_country
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE prod_company
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_prod_company_insert
BEFORE INSERT ON prod_company
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_prod_company_update
BEFORE UPDATE ON prod_company
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE prod_in_platform
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_prod_in_platform_insert
BEFORE INSERT ON prod_in_platform
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_prod_in_platform_update
BEFORE UPDATE ON prod_in_platform
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE production_crew
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_production_crew_insert
BEFORE INSERT ON production_crew
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_production_crew_update
BEFORE UPDATE ON production_crew
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE production_image
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_production_image_insert
BEFORE INSERT ON production_image
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_production_image_update
BEFORE UPDATE ON production_image
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE production_in_cart
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_production_in_cart_insert
BEFORE INSERT ON production_in_cart
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_production_in_cart_update
BEFORE UPDATE ON production_in_cart
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE purchase
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_purchase_insert
BEFORE INSERT ON purchase
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_purchase_update
BEFORE UPDATE ON purchase
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE regular_user
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_regular_user_insert
BEFORE INSERT ON regular_user
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_regular_user_update
BEFORE UPDATE ON regular_user
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE review
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_review_insert
BEFORE INSERT ON review
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_review_update
BEFORE UPDATE ON review
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE rol
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_rol_insert
BEFORE INSERT ON rol
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_rol_update
BEFORE UPDATE ON rol
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE series
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_series_insert
BEFORE INSERT ON series
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_series_update
BEFORE UPDATE ON series
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE top_rated_productions
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_top_rated_productions_insert
BEFORE INSERT ON top_rated_productions
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_top_rated_productions_update
BEFORE UPDATE ON top_rated_productions
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE userr
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_userr_insert
BEFORE INSERT ON userr
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_userr_update
BEFORE UPDATE ON userr
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;

-- Campos de auditoría -------------------------------------------------------------------------------------------------------
ALTER TABLE wish_list
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN creation_date DATETIME,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN update_date DATETIME;
-- Trigger de insert
DELIMITER //
CREATE TRIGGER before_wish_list_insert
BEFORE INSERT ON wish_list
FOR EACH ROW
BEGIN
    SET NEW.creation_date = NOW();
    SET NEW.created_by = CURRENT_USER();
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;
-- Trigger de update
DELIMITER //
CREATE TRIGGER before_wish_list_update
BEFORE UPDATE ON wish_list
FOR EACH ROW
BEGIN
    SET NEW.update_date = NOW();
    SET NEW.updated_by = CURRENT_USER();
END //
DELIMITER ;