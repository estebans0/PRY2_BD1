/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.FilmPerson;
import Modelo.Person;
import Modelo.Production;
import Modelo.Rol;
import Modelo.User;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.*;
import javax.swing.ComboBoxModel;
import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

/**
 *
 * @author Esteban
 */
public class Controlador {
    // Atributos --------------------------------------------------------------------------------------------------------------
    private final PersonManager personMng = new PersonManager();
    private final UserManager userMng = new UserManager();
    private final productionManager prodMng = new productionManager();
    private final Connection conn = sysConexion.obtConexion();
    
    // Método conversor de byte[] a ImageIcon ---------------------------------------------------------------------------------
    public ImageIcon byteArrayToImageIcon(byte[] imageBytes) {
    if (imageBytes == null || imageBytes.length == 0) {
        System.err.println("Image byte array is null or empty.");
        return null;
    }

    ByteArrayInputStream bais = new ByteArrayInputStream(imageBytes);
    try {
        BufferedImage image = javax.imageio.ImageIO.read(bais);
        if (image == null) {
            System.err.println("ImageIO.read returned null - unable to read image from byte array.");
            return null;
        }
        return new ImageIcon(image);
    } catch (IOException e) {
        System.err.println("Error: " + e.getMessage());
        return null;
    }
}
    
    // Métodos de usuario -----------------------------------------------------------------------------------------------------
    public int verifyUserLogin(String username, String password) throws SQLException {
        return userMng.verifyUserLogin(username, password);
    }
    
    public void updateUsers() throws SQLException {
        userMng.updateUsers(conn);
    }
    
    public void registerUser(String user, String pass, String email, int idType, 
            String legalId, String fName, String lName, String mName, String nName, 
            int gender, String dob, String imagePath) throws SQLException, IOException {
        personMng.registerPerson(conn, fName, lName, mName, nName, gender, dob, imagePath);
        updatePeople();
        userMng.registerUser(conn, user, pass, email, idType, legalId);
        updateUsers();
    }
    
    public DefaultTableModel showUsersTable(int userType) throws SQLException {
        return userMng.showUsersTable(userType);
    }
    
    // En este momento no se esta usando la tabla admin de la BD
    // podríamos implementarlo en el PRY2 si lo ven necesario, si no no
    // yo siento que no es necesario
    public int makeOrRemoveAdmin(int id, int type) throws SQLException {
        return userMng.makeOrRemoveAdmin(conn, id, type);
    }
    
    public void printUsers() {
        userMng.printUsers();
    }
    
    public ArrayList<User> getUsers() {
        return userMng.getUsers();
    }
    
    public int getCurrentUserId() {
        return userMng.getCurrentUserId();
    }
    
    public User getCurrentUser() {
        return userMng.getCurrentUser();
    }
    
    // Métodos de ADMIN  ---------------------------------------------------------------------------------------------------------
    // ******************************* Country data management *******************************
    public void updateCountries() throws SQLException {
        userMng.updateCountries(conn);
    }
    
    public ComboBoxModel<String> makeCountriesList() {
        return userMng.makeCountriesList();
    }
    
    public boolean countryAlreadyExists(String countryName) {
        return userMng.countryAlreadyExists(countryName);
    }
    
    public void insertCountry(String countryName) throws SQLException {
        userMng.insertCountry(conn, countryName);
        updateCountries();
    }
    
    public void editCountryName(String currName, String newName) throws SQLException {
        userMng.editCountryName(conn, currName, newName);
        updateCountries();
    }
    
    // ******************************* Gender data management *******************************
    public void updateGenders() throws SQLException {
        userMng.updateGenders(conn);
    }
    
    public ComboBoxModel<String> makeGendersList() {
        return userMng.makeGendersList();
    }
    
    public boolean genderAlreadyExists(String name) {
        return userMng.genderAlreadyExists(name);
    }
    
    public void insertGender(String name) throws SQLException {
        userMng.insertGender(conn, name);
        updateGenders();
    }
    
    public void editGenderName(String currName, String newName) throws SQLException {
        userMng.editGenderName(conn, currName, newName);
        updateGenders();
    }
    
    // ******************************* Genre data management *******************************
    public void updateGenres() throws SQLException {
        userMng.updateGenres(conn);
    }
    
    public ComboBoxModel<String> makeGenresList() {
        return userMng.makeGenresList();
    }
    
    public boolean genreAlreadyExists(String name) {
        return userMng.genreAlreadyExists(name);
    }
    
    public void insertGenre(String name, String description) throws SQLException {
        userMng.insertGenre(conn, name, description);
        updateGenres();
    }
    
    public void editGenre(String currName, String newName, String description) throws SQLException {
        userMng.editGenre(conn, currName, newName, description);
        updateGenres();
    }
    
    // ******************************* ProdCompany data management *******************************
    public void updateProdCompany() throws SQLException {
        userMng.updateProdCompany(conn);
    }
    
    public ComboBoxModel<String> makeProdCompanyList() {
        return userMng.makeProdCompanyList();
    }
    
    public boolean prodCompanyAlreadyExists(String name) {
        return userMng.prodCompanyAlreadyExists(name);
    }
    
    public void insertProdCompany(String name) throws SQLException {
        userMng.insertProdCompany(conn, name);
        updateProdCompany();
    }
    
    public void editProdCompany(String currName, String newName) throws SQLException {
        userMng.editProdCompany(conn, currName, newName);
        updateProdCompany();
    }
    
    
    // ******************************* Platform data management *******************************
    public void updatePlatforms() throws SQLException {
        userMng.updatePlatforms(conn);
    }
    
    public ComboBoxModel<String> makePlatformsList() {
        return userMng.makePlatformsList();
    }
    
    public boolean platformAlreadyExists(String name) {
        return userMng.platformAlreadyExists(name);
    }
    
    public void insertPlatform(String name, String url) throws SQLException {
        userMng.insertPlatform(conn, name, url);
        updatePlatforms();
    }
    
    public void editPlatform(String currName, String newName, String url) throws SQLException {
        userMng.editPlatform(conn, currName, newName, url);
        updatePlatforms();
    }
    
    // Métodos de Persona -----------------------------------------------------------------------------------------------------
    public void updatePeople() throws SQLException {
        personMng.updatePeople(conn);
    }
    
    public void updateFilmPeople() throws SQLException {
        updatePeople();
        personMng.updateFilmPeople(conn);
    }
    
    public void registerFilmPerson(String fName, String lName, String mName, String nName, 
            int gender, String dob, String imagePath, String country, String trivia, String biography,
            int height, String role, ArrayList<Integer> parents, ArrayList<Integer> children, int partner) throws SQLException, IOException {
        registerPerson(fName, lName, mName, nName, gender, dob, imagePath, parents, children, partner);
        personMng.registerFilmPerson(conn, height, trivia, biography, userMng.getCountryId(country), prodMng.getRoleId(role));
        updateUsers();
    }
    
    public void registerPerson(String fName, String lName, String mName, String nName, 
            int gender, String dob, String imagePath, ArrayList<Integer> parents, ArrayList<Integer> children, int partner) throws SQLException, IOException {
        personMng.insertFamily(conn, userMng.getCurrentUserId(), parents, children, partner);
        personMng.registerPerson(conn, fName, lName, mName, nName, gender, dob, imagePath);
        updatePeople();
    }
    
    public ArrayList<Person> getPeople() {
        return personMng.getPeople();
    }
    
    public ArrayList<FilmPerson> getFilmPeople() {
        return personMng.getFilmPeople();
    }
    
    public void printPeople() {
        personMng.printPeople();
    }
    
    public void printFilmPeople() {
        personMng.printFilmPeople();
    }
    
    public DefaultTableModel showPeopleTable() throws SQLException {
        return personMng.showPeopleTable();
    }
    
    public Person getPerson (int id) {
        return personMng.getPerson(id);
    }
    
    public FilmPerson getFilmPerson (int id) {
        return personMng.getFilmPerson(id);
    }
    
    public ArrayList<FilmPerson> getDirectors() {
        return personMng.getDirectors();
    }
    
    public DefaultTableModel showDirectorsTable() throws SQLException {
        return personMng.showDirectorsTable();
    }
    
    public ArrayList<FilmPerson> getWriters() {
        return personMng.getWriters();
    }
    
    public DefaultTableModel showWritersTable() throws SQLException {
        return personMng.showWritersTable();
    }
    
    public ArrayList<FilmPerson> getActors() {
        return personMng.getActors();
    }
    
    public DefaultTableModel showActorsTable() throws SQLException {
        return personMng.showActorsTable();
    }
    
    public ArrayList<FilmPerson> getCrew() {
        return personMng.getCrew();
    }
    
    public DefaultTableModel showCrewTable() throws SQLException {
        ArrayList<FilmPerson> crew = getCrew();
        String role = "";
        Object [] header = {"ID", "Name", "Role"};
        DefaultTableModel table = new DefaultTableModel(header, crew.size());
        for (int i = 0; i < table.getRowCount(); i++) {
            FilmPerson person = crew.get(i);
            table.setValueAt(person.getId(), i, 0);
            table.setValueAt(person.getFirstName() + " " + person.getLastName(), i, 1);
            role = getRoleName(person.getRole());
            table.setValueAt(role, i, 2);
        }
        return table;
    }
    public DefaultTableModel showCrewTable2(ArrayList<FilmPerson> crew) throws SQLException {
        String role = "";
        Object [] header = {"ID", "Name", "Role"};
        DefaultTableModel table = new DefaultTableModel(header, crew.size());
        for (int i = 0; i < table.getRowCount(); i++) {
            FilmPerson person = crew.get(i);
            table.setValueAt(person.getId(), i, 0);
            table.setValueAt(person.getFirstName() + " " + person.getLastName(), i, 1);
            role = getRoleName(person.getRole());
            table.setValueAt(role, i, 2);
        }
        return table;
    }
    
    // Métodos de Top Productions ----------------------------------------------------------------------------------------------
    public void updateTopProds() throws SQLException {
        prodMng.updateTopProds(conn);
    }
    
    public DefaultTableModel showTopProdsTable() throws SQLException {
        return prodMng.showTopProdsTable();
    }
    
    // Métodos de Producción ---------------------------------------------------------------------------------------------------
    public Rol makeRoleObject(int id, String characterName) {
        return prodMng.makeRoleObject(id, characterName);
    }
    
    public ComboBoxModel<String> makeGenericList(ArrayList<String> list) {
        ArrayList<String> listOptions = new ArrayList<>();
        for (String option : list) {
            listOptions.add(option);
        }
        ComboBoxModel<String> optionsList = new DefaultComboBoxModel<>(listOptions.toArray(String[]::new));
        return optionsList;
    }
    
    public ComboBoxModel<String> makeEpsList(int num) {
        ArrayList<String> listEps = new ArrayList<>();
        for (int i = 1; i <= num; i++) {
            listEps.add(Integer.toString(i));
        }
        ComboBoxModel<String> EpsList = new DefaultComboBoxModel<>(listEps.toArray(String[]::new));
        return EpsList;
    }
    
    public DefaultTableModel makeWritersTable(ArrayList<FilmPerson> list){
        Object [] header = {"ID", "First name", "Last name"};
        DefaultTableModel table = new DefaultTableModel(header, list.size());
        for (int i = 0; i < table.getRowCount(); i++) {
            FilmPerson fPerson = list.get(i);
            table.setValueAt(fPerson.getId(), i, 0);
            table.setValueAt(fPerson.getFirstName(), i, 1);
            table.setValueAt(fPerson.getLastName(), i, 2);
        }
        return table;
    }
    
    public DefaultTableModel makeActorsTable(ArrayList<Rol> list){
        Object [] header = {"ID", "Name", "Character"};
        DefaultTableModel table = new DefaultTableModel(header, list.size());
        for (int i = 0; i < table.getRowCount(); i++) {
            Rol rol = list.get(i);
            FilmPerson actor = getFilmPerson(rol.getId());
            table.setValueAt(actor.getId(), i, 0);
            table.setValueAt(actor.getFirstName()+" "+actor.getLastName(), i, 1);
            table.setValueAt(rol.getCharacterName(), i, 2);
        }
        return table;
    }
    
    public void updateProds() throws SQLException {
        prodMng.updateProdsData(conn);
    }
    
    public DefaultTableModel showProdsTable() throws SQLException {
        return prodMng.showProdsTable();
    }
    
    public String getRoleName(int id) {
        return prodMng.getRoleName(id);
    }
    
    public void updateRoles() throws SQLException {
        prodMng.updateRoles(conn);
    }
    
    public ComboBoxModel<String> makeRolesList() {
        return prodMng.makeRolesList();
    }
    
    public void ActualizeProductions() throws SQLException
    {

            prodMng.ActualizeProductions(conn);

    }
    
    public Production getProduction(int id) throws Exception
    {
            return prodMng.getProduction(id, conn);
    }
    
    
}
