/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

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
import java.io.IOException;
import javax.imageio.ImageIO;
/**
 *
 * @author Esteban
 */
public class PersonManager {
    // Atributos
    private ArrayList<Person> people;
    
    // Constructor
    public PersonManager() {
        this.people = new ArrayList<>();
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
//                    // Retrieve the image as Blob
//                    Blob blob = rs.getBlob("image");
//                    if (blob != null) {
//                        // Convert Blob to BufferedImage
//                        byte[] imageBytes = blob.getBytes(1, (int) blob.length());
//                        BufferedImage image = ImageIO.read(new ByteArrayInputStream(imageBytes));
//                        person.setImage(image);
//                    }
                    person.setImage(null);
                    person.setGender(rs.getInt("gender"));
                    people.add(person);
                }
            }
        }
    }
    
    public void registerPerson(java.sql.Connection conn, String fName, String lName, String mName, String nName, 
            int gender, String dob) throws SQLException {
        PreparedStatement sql = conn.prepareStatement("{call insertPerson(?,?,?,?,?,?)}");
        sql.setString(1, fName);
        sql.setString(2, lName);
        sql.setString(3, mName);
        sql.setString(4, nName);
        sql.setInt(5, gender);
        sql.setString(6, dob);
        sql.execute();
    }
    
    public void registerFilmPerson(java.sql.Connection conn, int height, String trivia, 
            String biography, int nationality) throws SQLException {
        //java.sql.Connection conn = sysConexion.obtConexion();
        PreparedStatement sql = conn.prepareStatement("{call insertFilmPerson(?,?,?,?)}");
        sql.setInt(1, height);
        sql.setString(2, trivia);
        sql.setString(3, biography);
        sql.setInt(4, nationality);
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

    // Método para obtener una persona por su id
    public Person getPerson (int id) {
        return people.get(id);
    }
    
    public void printPeople(){
        for (Person person : people) {
            System.out.println(person.toString());
        }
    }
}