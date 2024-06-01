/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;
import Modelo.FilmPerson;
import Modelo.Person;
import Modelo.Production;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

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
//        control.registerPerson("pruebaImg", "1", null, null, 1, "2024-05-30", "C:\\Users\\esteb\\Downloads\\pedro.jpg");
//        control.updatePeople();
//        control.printPeople();

        // Prueba para insertar y mostrar imagen ------------------------------------------------------------------------------------
//        control.registerPerson("pruebaImg", "1", null, null, 1, "2024-05-30", "C:/Users/esteb/Downloads/pedro.jpg");
//        control.updatePeople();
//        Person person = control.getPerson(51);
//        ImageIcon imageIcon = control.byteArrayToImageIcon(person.getImage());
//
//        // Display the image in a JLabel to confirm it works
//        if (imageIcon != null) {
//            JFrame frame = new JFrame();
//            JLabel label = new JLabel(imageIcon);
//            frame.add(label);
//            frame.pack();
//            frame.setVisible(true);
//        }

        } catch (Exception ex) {
            Logger.getLogger(pruebas.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
