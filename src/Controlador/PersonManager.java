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
import Modelo.Rol;
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
    private final productionManager prodMng = new productionManager();
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
    
    public ArrayList<FilmPerson> getFilmPeople() {
        return filmPeople;
    }
    
    public ArrayList<FilmPerson> getDirectors() {
        ArrayList<FilmPerson> directors = new ArrayList<>();
        for (FilmPerson fPerson : filmPeople) {
            if (fPerson.getRole() == 99) {
                directors.add(fPerson);
            }
        }
        return directors;
    }
    
    public ArrayList<FilmPerson> getWriters() {
        ArrayList<FilmPerson> writers = new ArrayList<>();
        for (FilmPerson fPerson : filmPeople) {
            if (fPerson.getRole() == 147) {
                writers.add(fPerson);
            }
        }
        return writers;
    }
    
    public ArrayList<FilmPerson> getActors() {
        ArrayList<FilmPerson> actors = new ArrayList<>();
        for (FilmPerson fPerson : filmPeople) {
            if (fPerson.getRole() == 102) {
                actors.add(fPerson);
            }
        }
        return actors;
    }
    
    public ArrayList<FilmPerson> getCrew() {
        ArrayList<FilmPerson> crew = new ArrayList<>();
        for (FilmPerson fPerson : filmPeople) {
            if (fPerson.getRole() != 102 || fPerson.getRole() != 147 || fPerson.getRole() != 99) {
                crew.add(fPerson);
            }
        }
        return crew;
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
    
    public void updateFilmPeople(java.sql.Connection conn) throws SQLException {
        filmPeople.clear();
        try (CallableStatement stmt = conn.prepareCall("{call getFilmPeopleData()}")) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    FilmPerson fPerson = new FilmPerson();
                    int id = rs.getInt("id");
                    fPerson.setId(id);
                    fPerson.setHeigth(rs.getInt("heigth_cm"));
                    fPerson.setTrivia(rs.getString("trivia"));
                    fPerson.setBiography(rs.getString("biography"));
                    fPerson.setNationality(rs.getInt("nacionality"));
                    fPerson.setRole(rs.getInt("rol"));
                    // Agregar datos de persona regular
                    Person person = getPerson(id);
                    fPerson.setFirstName(person.getFirstName());
                    fPerson.setLastName(person.getLastName());
                    fPerson.setMiddleName(person.getMiddleName());
                    fPerson.setNickname(person.getNickname());
                    fPerson.setImage(person.getImage());
                    fPerson.setDob(person.getDob());
                    fPerson.setGender(person.getGender());
                    fPerson.setPartnerId(person.getPartnerId());
                    fPerson.setFamilyMembers(person.getFamilyMembers());
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
        Object [] header = {"ID", "First name", "Last name"};
        DefaultTableModel table = new DefaultTableModel(header, people.size());
        for (int i = 0; i < table.getRowCount(); i++) {
            Person person = people.get(i);
            table.setValueAt(person.getId(), i, 0);
            table.setValueAt(person.getFirstName(), i, 1);
            table.setValueAt(person.getLastName(), i, 2);
        }
        return table;
    }
    
    public DefaultTableModel showDirectorsTable() {
        ArrayList<FilmPerson> directors = getDirectors();
        Object [] header = {"ID", "First name", "Last name"};
        DefaultTableModel table = new DefaultTableModel(header, directors.size());
        for (int i = 0; i < table.getRowCount(); i++) {
            FilmPerson person = directors.get(i);
            table.setValueAt(person.getId(), i, 0);
            table.setValueAt(person.getFirstName(), i, 1);
            table.setValueAt(person.getLastName(), i, 2);
        }
        return table;
    }
    
    public DefaultTableModel showWritersTable() {
        ArrayList<FilmPerson> writers = getWriters();
        Object [] header = {"ID", "First name", "Last name"};
        DefaultTableModel table = new DefaultTableModel(header, writers.size());
        for (int i = 0; i < table.getRowCount(); i++) {
            FilmPerson person = writers.get(i);
            table.setValueAt(person.getId(), i, 0);
            table.setValueAt(person.getFirstName(), i, 1);
            table.setValueAt(person.getLastName(), i, 2);
        }
        return table;
    }
    
     public DefaultTableModel showActorsTable() {
        ArrayList<FilmPerson> actors = getActors();
        Object [] header = {"ID", "First name", "Last name"};
        DefaultTableModel table = new DefaultTableModel(header, actors.size());
        for (int i = 0; i < table.getRowCount(); i++) {
            FilmPerson person = actors.get(i);
            table.setValueAt(person.getId(), i, 0);
            table.setValueAt(person.getFirstName(), i, 1);
            table.setValueAt(person.getLastName(), i, 2);
        }
        return table;
    }

    // Método para obtener una persona por su id
    public Person getPerson (int id) {
        for (Person person : people) {
            if (id == person.getId()) {
                return person;
            }
        }
        return null;
    }
    
    public void printPeople(){
        for (Person person : people) {
            System.out.println(person.toString());
        }
    }
    
    public FilmPerson getFilmPerson (int id) {
        for (FilmPerson fPerson : filmPeople) {
            if (id == fPerson.getId()) {
                return fPerson;
            }
        }
        return null;
    }
    
    public void printFilmPeople(){
        for (FilmPerson fPerson : filmPeople) {
            System.out.println(fPerson.toString());
        }
    }
}