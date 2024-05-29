-- Creación de tabla para alamcenar resultados del job ------------------------------------------------
CREATE TABLE top_rated_productions (
    id INT,
    title VARCHAR(260),
    avg_rating DECIMAL(3, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tablas
CREATE TABLE IF NOT EXISTS production (
    id INT NOT NULL AUTO_INCREMENT,
    airdate DATE NOT NULL,
    title VARCHAR(260) NOT NULL,
    run_time INT NOT NULL,
    is_public TINYINT NOT NULL,
    synopsis VARCHAR(340) NOT NULL,
    trailer VARCHAR(700),
    created_by INT NOT NULL,
    price DECIMAL(8,2),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS genre (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(230) NOT NULL,
    characteristics VARCHAR(290),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS genre_by_prod (
    id INT NOT NULL AUTO_INCREMENT,
    id_production INT NOT NULL,
    id_genre INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS price_log (
    id INT NOT NULL AUTO_INCREMENT,
    price DECIMAL(8, 2) NOT NULL,
    log_date DATE NOT NULL,
    id_production INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS prod_company (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(230) NOT NULL,
    id_country INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS prod_by_company (
    id INT NOT NULL AUTO_INCREMENT,
    id_production INT NOT NULL,
    id_company INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS platform (
    id INT NOT NULL AUTO_INCREMENT,
    url VARCHAR(260),
    name VARCHAR(230) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS prod_in_platform (
    id INT NOT NULL AUTO_INCREMENT,
    id_production INT NOT NULL,
    id_platform INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS movie (
    id_movie INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id_movie)
);

CREATE TABLE IF NOT EXISTS series (
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS episode (
    id_episode INT NOT NULL AUTO_INCREMENT,
    episode_number INT NOT NULL,
    season INT NOT NULL,
    series INT NOT NULL,
    PRIMARY KEY (id_episode)
);

CREATE TABLE IF NOT EXISTS prod_by_country (
    id INT NOT NULL AUTO_INCREMENT,
    id_production INT NOT NULL,
    id_country INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS country (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(230) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS province (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(230) NOT NULL,
    id_country INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS city (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(230) NOT NULL,
    id_province INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS person (
    id INT NOT NULL AUTO_INCREMENT,
    birthdate DATE NOT NULL,
    first_name VARCHAR(220) NOT NULL,
    middle_name VARCHAR(220),
    last_name VARCHAR(220) NOT NULL,
    nickname VARCHAR(220),
    image BLOB,
    gender INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS gender (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(220) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS parent_of (
    id INT NOT NULL AUTO_INCREMENT,
    id_parent INT NOT NULL,
    id_child INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS partner_of (
    id INT NOT NULL AUTO_INCREMENT,
    id_partner1 INT NOT NULL,
    id_partner2 INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS rol (
    type INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(220) NOT NULL,
    character_name VARCHAR(220) NOT NULL,
    PRIMARY KEY (type)
);

CREATE TABLE IF NOT EXISTS film_person (
    id INT NOT NULL,
    heigth_cm INT NOT NULL,
    trivia VARCHAR(1200),
    biography VARCHAR(1200),
    nacionality INT NOT NULL,
    id_city INT,
    rol INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS production_crew (
    id INT NOT NULL AUTO_INCREMENT,
    id_crew_member INT NOT NULL,
    id_production INT NOT NULL,
    id_rol INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS userr (
    id INT NOT NULL,
    username VARCHAR(230) NOT NULL,
    password VARCHAR(220) NOT NULL,
    email VARCHAR(220) NOT NULL,
    legal_id VARCHAR(208) NOT NULL,
    id_type INT NOT NULL,
    user_type TINYINT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS administrator (
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS regular_user (
    id INT NOT NULL AUTO_INCREMENT,
    id_cart INT NOT NULL,
    id_wishlist INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS comentario (
    id INT NOT NULL AUTO_INCREMENT,
    text_body VARCHAR(340) NOT NULL,
    author INT NOT NULL,
    id_review INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS review (
    id INT NOT NULL AUTO_INCREMENT,
    raiting TINYINT NOT NULL,
    title VARCHAR(230) NOT NULL,
    author INT NOT NULL,
    id_production INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS wish_list (
    id INT NOT NULL AUTO_INCREMENT,
    id_user INT NOT NULL,
    id_production INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS cart (
    id INT NOT NULL AUTO_INCREMENT,
    id_user INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS production_in_cart (
    id INT NOT NULL AUTO_INCREMENT,
    id_cart INT NOT NULL,
    id_user INT NOT NULL,
    id_production INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS purchase (
    id INT NOT NULL AUTO_INCREMENT,
    dateOfPurchase DATE NOT NULL,
    id_user INT NOT NULL,
    id_payment_method INT NOT NULL,
    id_cart INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS payment_method (
    id INT NOT NULL AUTO_INCREMENT,
    owner INT NOT NULL,
    cc_owner_name VARCHAR(225) NOT NULL,
    cc_number BIGINT NOT NULL,
    cc_expiration DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS production_image (
    id INT NOT NULL AUTO_INCREMENT,
    id_production INT NOT NULL,
    image BLOB NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS identification_type (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(220) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS cast_of_production (
    id INT NOT NULL AUTO_INCREMENT,
    id_cast_member INT NOT NULL,
    movie_character VARCHAR(240) NOT NULL,
    production_id INT NOT NULL,
    PRIMARY KEY (id)
);
