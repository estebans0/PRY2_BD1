/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;
import Modelo.Person;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Esteban
 */
public class pruebas {
    public static void main(String[] args) throws IOException {
        try {
            Controlador control = new Controlador();
            control.updateUsers();
//            control.insertCountry("Alemania");
//            control.registerPerson("prueba2", "Java", null, null, 1, "2024-05-19");
//            control.updatePeople();
//            control.printPeople();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}
