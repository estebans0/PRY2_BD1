/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;
import Modelo.Person;
import Modelo.Production;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Esteban
 */
public class pruebas {
    public static void main(String[] args) throws IOException 
    {
        try {
        Controlador control = new Controlador();
//        control.ActualizeProductions();
//        Production production = control.getProduction(1);
        control.registerPerson("pruebaImg", "1", null, null, 1, "2024-05-30", "C:\\Users\\esteb\\Downloads\\pedro.jpg");
        
        } catch (Exception ex) {
            Logger.getLogger(pruebas.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
