DELIMITER $$
--	-------------------------------------------------------------------------------------
-- Get the episode id for all episodes in a series.
DROP PROCEDURE IF EXISTS getserieEpisodes$$
CREATE PROCEDURE getSerieEpisodes (IN Serie INT)
BEGIN
        SELECT episode.id_episode, episode.episode_number, episode.season
        FROM episode
        where series = Serie
        order by season;
END$$
-- ----------------------------------------------------------------------------------------
DELIMITER ;

-- call getSeries();