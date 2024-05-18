/*
SELECT CONCAT('DROP TABLE IF EXISTS `', table_name, '`;')
FROM information_schema.tables
WHERE table_schema = 'BD1';
*/

DROP TABLE IF EXISTS `administrator`;
DROP TABLE IF EXISTS `cart`;
DROP TABLE IF EXISTS `cast_of_production`;
DROP TABLE IF EXISTS `city`;
DROP TABLE IF EXISTS `comentario`;
DROP TABLE IF EXISTS `country`;
DROP TABLE IF EXISTS `episode`;
DROP TABLE IF EXISTS `film_person`;
DROP TABLE IF EXISTS `gender`;
DROP TABLE IF EXISTS `genre`;
DROP TABLE IF EXISTS `genre_by_prod`;
DROP TABLE IF EXISTS `identification_type`;
DROP TABLE IF EXISTS `movie`;
DROP TABLE IF EXISTS `parent_of`;
DROP TABLE IF EXISTS `partner_of`;
DROP TABLE IF EXISTS `payment_method`;
DROP TABLE IF EXISTS `person`;
DROP TABLE IF EXISTS `platform`;
DROP TABLE IF EXISTS `price_log`;
DROP TABLE IF EXISTS `prod_by_company`;
DROP TABLE IF EXISTS `prod_by_country`;
DROP TABLE IF EXISTS `prod_company`;
DROP TABLE IF EXISTS `prod_in_platform`;
DROP TABLE IF EXISTS `production`;
DROP TABLE IF EXISTS `production_crew`;
DROP TABLE IF EXISTS `production_image`;
DROP TABLE IF EXISTS `production_in_cart`;
DROP TABLE IF EXISTS `province`;
DROP TABLE IF EXISTS `purchase`;
DROP TABLE IF EXISTS `regular_user`;
DROP TABLE IF EXISTS `review`;
DROP TABLE IF EXISTS `rol`;
DROP TABLE IF EXISTS `series`;
DROP TABLE IF EXISTS `userr`;
DROP TABLE IF EXISTS `wish_list`;