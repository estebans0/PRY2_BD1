/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Movie;
import Modelo.Person;
import Modelo.Production;
import Modelo.Serie;
import Modelo.User;
//import Modelo.Serie;

import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.*;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author wess
 */
public class productionManager {
    //Primero una lista con todas las producciones, despues  metodos para getiar los 3 tipos y un esqueleto para los inserts.
    //Por ultimo, unos metodos para insertar que deberian de hacerse por Esteban.
    private ArrayList<Production> productions;
    private ArrayList<Production> topProds;

    public productionManager() {
        this.productions = new ArrayList<>();
        this.topProds = new ArrayList<>();
    }
    
    // --------------- Métodos TOP N Productions --------------------------------------------------------------------
    public DefaultTableModel showTopProdsTable() {
        Object [] header = {"ID", "Title", "Rating"};
        DefaultTableModel table = new DefaultTableModel(header, topProds.size());
        for (int i = 0; i < table.getRowCount(); i++) {
            Production prod = topProds.get(i);
            table.setValueAt(prod.getId(), i, 0);
            table.setValueAt(prod.getTitle(), i, 1);
            table.setValueAt(prod.getCurrentRaiting(), i, 2);
        }
        return table;
    }
    
    public void updateTopProds(java.sql.Connection conn) throws SQLException {
        topProds.clear();
        CallableStatement sql = conn.prepareCall("{call getTopProdsData()}");
        ResultSet rs = sql.executeQuery();
        while (rs.next()) {
            Production prod = new Production();
            prod.setId(rs.getInt(1));
            prod.setTitle(rs.getString(2));
            prod.setCurrentRaiting(rs.getFloat(3));
            topProds.add(prod);
        }
    }
    // ---------------------------------------------------------------------------------------------------------------

    private void GetMovies(java.sql.Connection conn) throws SQLException
        {
            String sql = "{CALL getMovies()}";
            CallableStatement cs = conn.prepareCall(sql);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) 
            {
                int id = rs.getInt("id");
                Movie movie = new Movie(id,conn);
                productions.add(movie);
            }
        }

    private void GetSeries(java.sql.Connection conn) throws SQLException
        {
            String sql = "{CALL getSeries()}";
            CallableStatement cs = conn.prepareCall(sql);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) 
            {
                int id = rs.getInt("id");
                Serie serie = new Serie(id, conn);
                productions.add(serie);
            }
        }


    public void ActualizeProductions(java.sql.Connection conn) throws SQLException
        {
            productions = new ArrayList<>();
            GetMovies(conn);
            GetSeries(conn);
        }

    public Production getProduction(int id, java.sql.Connection conn) throws Exception
        {
            for(Production production:productions)
            {
                if(production.getId() == id)
                {
                    production.setProductionReviews(conn);
                    production.setSales(conn);
                    production.setImages(conn);
                    production.setPlatforms(conn);
                    production.setFilmP(conn);
                    return production;
                }
            }
            throw new Exception("Production Not found");
        }



        //Tres metodos para querries.
}