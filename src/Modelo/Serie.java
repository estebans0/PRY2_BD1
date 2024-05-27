/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Afase
 */
public class Serie extends Production{
    private ArrayList<Episode> episodes;
    
    private void setEpisodes(int id, Connection conn) throws SQLException
    {
        String statement = "{call getSerieEpisodes(?)}";
        CallableStatement sql = conn.prepareCall(statement);
        sql.setInt(1, id);
        ResultSet rs = sql.executeQuery();
        while (rs.next()) 
        {
            int EpId = rs.getInt("id_episode");
            int episodeNumber = rs.getInt("episode_number");
            int season = rs.getInt("season");
            Episode episode = new Episode(EpId, conn);
            episode.setSeasonNumber(season);
            episode.setNumber(episodeNumber);
            episode.setProductionReviews(conn);
            episodes.add(episode);
        }
    }
    
    public Serie(int id, Connection conn) throws SQLException 
    {
        super(id, conn);
        //Tambien llamar los episodios.
        episodes = new ArrayList<>();
        setEpisodes(id, conn);
    }
    
}
