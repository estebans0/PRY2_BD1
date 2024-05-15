/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;
import Modelo.Person;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Esteban
 */
public class pruebas {
    public static void main(String[] args) {
        try {
            Controlador control = new Controlador();
//            control.registerPerson("adm", "0", "", "", 1, "2024-05-14");
            control.updatePeople();
            control.printPeople();
//            control.insertPlatform("Netflix", null);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}
