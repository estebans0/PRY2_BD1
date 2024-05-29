-- Creación del Job -----------------------------------------------------------------------------------
SET GLOBAL event_scheduler = ON;

DELIMITER //
CREATE EVENT dailyTopRatedProductions
ON SCHEDULE EVERY 1 DAY
STARTS '2024-05-29 00:00:00'
DO
BEGIN
    CALL getTopRatedProductions(10); -- Parámetro ajustable
END //
DELIMITER ;
