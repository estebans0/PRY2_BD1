/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Esteban
 */
public class sysConexion {
    public static Connection obtConexion() {
        String myDB = "jdbc:mysql://127.0.0.1:3306/bd1";
        String user = "root";
        String password = "bd1pass";

        try {
            // Establish connection
            Connection connection = DriverManager.getConnection(myDB, user, password);
            return connection;
        } catch (SQLException e) {
            // Handle exceptions
            System.err.println("Error connecting to the database: " + e.getMessage());
            return null;
        }
    }
}
