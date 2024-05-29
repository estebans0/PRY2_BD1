/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Person;
import Modelo.Production;
import Modelo.User;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.*;
import javax.swing.ComboBoxModel;
import javax.swing.DefaultComboBoxModel;
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
    
    // Métodos de usuario -----------------------------------------------------------------------------------------------------
    public int verifyUserLogin(String username, String password) throws SQLException {
        return userMng.verifyUserLogin(username, password);
    }
    
    public void updateUsers() throws SQLException {
        userMng.updateUsers(conn);
    }
    
    public void registerUser(String user, String pass, String email, int idType, 
            String legalId, String fName, String lName, String mName, String nName, 
            int gender, String dob) throws SQLException, IOException {
        registerPerson(fName, lName, mName, nName, gender, dob);
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
    
    public void registerFilmPerson(String fName, String lName, String mName, String nName, 
            int gender, String dob, String country, String trivia, String biography, int height) throws SQLException, IOException {
        registerPerson(fName, lName, mName, nName, gender, dob);
        personMng.registerFilmPerson(conn, height, trivia, biography, userMng.getCountryId(country));
        updateUsers();
    }
    
    public void registerPerson(String fName, String lName, String mName, String nName, 
            int gender, String dob) throws SQLException {
        personMng.registerPerson(conn, fName, lName, mName, nName, gender, dob);
        updatePeople();
    }
    
    public ArrayList<Person> getPeople() {
        return personMng.getPeople();
    }
    
    public void printPeople() {
        personMng.printPeople();
    }
    
    public DefaultTableModel showPeopleTable() throws SQLException {
        return personMng.showPeopleTable();
    }
    
    // Métodos de Top Productions ----------------------------------------------------------------------------------------------
    public void updateTopProds() throws SQLException {
        prodMng.updateTopProds(conn);
    }
    
    public DefaultTableModel showTopProdsTable() throws SQLException {
        return prodMng.showTopProdsTable();
    }
    
    // Métodos de Producción ---------------------------------------------------------------------------------------------------
    public void ActualizeProductions() throws SQLException
    {

            prodMng.ActualizeProductions(conn);

    }
    
    public Production getProduction(int id) throws Exception
    {
            return prodMng.getProduction(id, conn);
    }
    
    
}
