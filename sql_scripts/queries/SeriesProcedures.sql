DELIMITER $$
--	-------------------------------------------------------------------------------------
-- Get the episode id for all episodes in a series.
DROP PROCEDURE IF EXISTS getserieEpisodes$$
CREATE PROCEDURE getSerieEpisodes (IN Serie INT)
BEGIN
        SELECT episode.id_episode id_episode, episode.episode_number episode_number, episode.season season
        FROM episode
        where episode.id_serie = Serie
        ORDER BY season ASC;
END$$
-- ----------------------------------------------------------------------------------------
DELIMITER ;