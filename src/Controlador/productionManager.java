/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Movie;
import Modelo.Person;
import Modelo.ProdCompany;
import Modelo.Production;
import Modelo.Rol;
import Modelo.Serie;
import Modelo.User;
//import Modelo.Serie;

import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.*;
import javax.swing.ComboBoxModel;
import javax.swing.DefaultComboBoxModel;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author wess
 */
public class productionManager {
    //Primero una lista con todas las producciones, despues  metodos para getiar los 3 tipos y un esqueleto para los inserts.
    //Por ultimo, unos metodos para insertar que deberian de hacerse por Esteban.
    private ArrayList<Production> prods; // Hice un ArrayList distinto para no caerle encima a lo que ya hay
    private ArrayList<Production> productions;
    private ArrayList<Production> topProds;
    private ArrayList<Rol> roles;

    public productionManager() {
        this.productions = new ArrayList<>();
        this.topProds = new ArrayList<>();
        this.roles = new ArrayList<>();
        this.prods = new ArrayList<>();
    }
    
    public Rol makeRoleObject(int id, String characterName) {
        return new Rol(id, characterName);
    }
    
    public void updateProdsData(java.sql.Connection conn) throws SQLException {
        prods.clear();
        CallableStatement sql = conn.prepareCall("{call getAllProdsData()}");
        ResultSet rs = sql.executeQuery();
        while (rs.next()) {
            Production prod = new Production();
            prod.setId(rs.getInt(1));
            prod.setAirdate(rs.getString(2));
            prod.setTitle(rs.getString(3));
            prod.setRuntime(rs.getInt(4));
            prod.setSynopsis(rs.getString(5));
            prod.setTrailer(rs.getString(6));
            prod.setCurrentPrice(rs.getLong(7));
            prods.add(prod);
        }
    }
    
    // Método para crear una tabla con los datos de producciones existentes
    public DefaultTableModel showProdsTable() {
        Object [] header = {"ID", "Title", "Runtime"};
        DefaultTableModel table = new DefaultTableModel(header, prods.size());
        for (int i = 0; i < table.getRowCount(); i++) {
            Production prod = prods.get(i);
            table.setValueAt(prod.getId(), i, 0);
            table.setValueAt(prod.getTitle(), i, 1);
            table.setValueAt(prod.getRuntime() + " min", i, 2);
        }
        return table;
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
    
    // Metodos de rol --------------------------------------------------------------------------------
    public void updateRoles(java.sql.Connection conn) throws SQLException {
        roles.clear();
        CallableStatement sql = conn.prepareCall("{call getRolesData()}");
        ResultSet rs = sql.executeQuery();
        while (rs.next()) {
            Rol rol = new Rol();
            rol.setType(rs.getInt(1));
            rol.setName(rs.getString(2));
            rol.setCharacterName(rs.getString(3));
            roles.add(rol);
        }
    }
    
    public ComboBoxModel<String> makeRolesList() {
        ArrayList<String> pRoles = new ArrayList<>();
        pRoles.add("Select a role");
        for (Rol pRole : roles) {
            pRoles.add(pRole.getName());
        }
        ComboBoxModel<String> pRolesList = new DefaultComboBoxModel<>(pRoles.toArray(String[]::new));
        return pRolesList;
    }
    
    public int getRoleId(String name){
        for (Rol rol : roles) {
            if (rol.getName().equals(name)) {
                return rol.getType();
            }
        }
        return -1;
    }
    
    public String getRoleName(int type){
        for (Rol rol : roles) {
            if (rol.getType() == type) {
                return rol.getName();
            }
        }
        return null;
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