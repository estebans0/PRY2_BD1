/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.FilmPerson;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import Modelo.Person;
import Modelo.User;
import com.sun.jdi.connect.spi.Connection;
import java.awt.image.BufferedImage;
import java.sql.SQLException;
import java.sql.*;
import javax.swing.table.DefaultTableModel;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author Esteban
 */
public class PersonManager {
    // Atributos
    private ArrayList<Person> people;
    private ArrayList<FilmPerson> filmPeople;
    
    // Constructor
    public PersonManager() {
        this.people = new ArrayList<>();
        this.filmPeople = new ArrayList<>();
    }
    
    // Métodos
    public ArrayList<Person> getPeople() {
        return people;
    }

    // Obtener a todas las personas en la BD
    public void updatePeople(java.sql.Connection conn) throws SQLException {
        people.clear();
        try (CallableStatement stmt = conn.prepareCall("{call getPeopleData()}")) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Person person = new Person();
                    person.setId(rs.getInt("id"));
                    person.setDob(rs.getDate("birthdate"));
                    person.setFirstName(rs.getString("first_name"));
                    person.setMiddleName(rs.getString("middle_name"));
                    person.setLastName(rs.getString("last_name"));
                    person.setNickname(rs.getString("nickname"));
                    person.setImage(rs.getBytes("image"));
                    person.setGender(rs.getInt("gender"));
                    people.add(person);
                }
            }
        }
    }
    
    public void registerPerson(java.sql.Connection conn, String fName, String lName, String mName, String nName, 
            int gender, String dob, String imagePath) throws SQLException, IOException {
        byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
        try {
            PreparedStatement sql = conn.prepareCall("{call insertPerson(?,?,?,?,?,?,?)}");
            sql.setString(1, fName);
            sql.setString(2, lName);
            sql.setString(3, mName);
            sql.setString(4, nName);
            sql.setInt(5, gender);
            sql.setString(6, dob);
            sql.setBytes(7, imageBytes);
            sql.execute();
        } catch (SQLException e) {
            throw e;
        }
    }
    
    public void insertFamily(java.sql.Connection conn, int id, ArrayList<Integer> parents, ArrayList<Integer> children, int partnerId) throws SQLException {
        try {
            if (parents != null) {
                for (int parentId : parents) {
                    PreparedStatement sql = conn.prepareCall("{call insertParent(?,?)}");
                    sql.setInt(1, parentId);
                    sql.setInt(2, id);
                    sql.execute();
                    sql.close();
                }
            }
            if (children != null) {
                for (int childId : children) {
                    PreparedStatement sql = conn.prepareCall("{call insertParent(?,?)}");
                    sql.setInt(1, id);
                    sql.setInt(2, childId);
                    sql.execute();
                    sql.close();
                }
            }
            if (partnerId != 0) {
                PreparedStatement sql = conn.prepareCall("{call insertPartner(?,?)}");
                sql.setInt(1, id);
                sql.setInt(2, partnerId);
                sql.execute();
                sql.close();
            }
        } catch (SQLException e) {
            throw e;
        }
    }
    
    public ArrayList<FilmPerson> getFilmPeople() {
        return filmPeople;
    }
    
    public void updateFilmPeople(java.sql.Connection conn) throws SQLException {
        filmPeople.clear();
        try (CallableStatement stmt = conn.prepareCall("{call getFilmPeopleData()}")) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    FilmPerson fPerson = new FilmPerson();
                    fPerson.setId(rs.getInt("id"));
                    fPerson.setHeigth(rs.getInt("height_cm"));
                    fPerson.setTrivia(rs.getString("trivia"));
                    fPerson.setBiography(rs.getString("biography"));
                    fPerson.setNationality(rs.getInt("nacionality"));
                    fPerson.setRole(rs.getInt("rol"));
                    filmPeople.add(fPerson);
                }
            }
        }
    }
    
    public void registerFilmPerson(java.sql.Connection conn, int height, String trivia, 
            String biography, int nationality, int role) throws SQLException {
        //java.sql.Connection conn = sysConexion.obtConexion();
        PreparedStatement sql = conn.prepareStatement("{call insertFilmPerson(?,?,?,?,?)}");
        sql.setInt(1, height);
        sql.setString(2, trivia);
        sql.setString(3, biography);
        sql.setInt(4, nationality);
        sql.setInt(5, role);
        sql.execute();
    }
    
    // Método para crear una tabla con los datos de personas existentes
    public DefaultTableModel showPeopleTable() {
        Object [] header = {"ID", "FirstName", "Last name"};
        DefaultTableModel table = new DefaultTableModel(header, people.size());
        for (int i = 0; i < table.getRowCount(); i++) {
            Person person = people.get(i);
            table.setValueAt(person.getId(), i, 0);
            table.setValueAt(person.getFirstName(), i, 1);
            table.setValueAt(person.getLastName(), i, 2);
        }
        return table;
    }

    public void updateProfilePicture(java.sql.Connection conn, int userId, String imagePath) throws SQLException, IOException {
        String sql = "UPDATE userr SET profile_picture = ? WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
            FileInputStream fis = new FileInputStream(imagePath)) {

            stmt.setBinaryStream(1, fis, (int) new File(imagePath).length());
            stmt.setInt(2, userId);
            stmt.executeUpdate();
        }
    }

    // Método para obtener una persona por su id
    public Person getPerson (int id) {
        id = id-1;
        return people.get(id);
    }
    
    public void printPeople(){
        for (Person person : people) {
            System.out.println(person.toString());
        }
    }
}