DELIMITER //
CREATE PROCEDURE getTopRatedProductions(IN pTopN INT)
BEGIN
    TRUNCATE TABLE top_rated_productions;

    INSERT INTO top_rated_productions (id, title, average_rating)
    SELECT 
        p.id,
        p.title,
        AVG(r.raiting) AS average_rating
    FROM 
        production p
    JOIN 
        review r ON p.id = r.id_production
    GROUP BY 
        p.id, p.title
    ORDER BY 
        average_rating DESC
    LIMIT 
        pTopN;
END //
DELIMITER ;