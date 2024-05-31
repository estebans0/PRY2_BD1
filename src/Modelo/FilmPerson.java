/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.ArrayList;

/**
 *
 * @author wess
 */
public class FilmPerson extends Person{
    private int id; 
    private ArrayList<Production> workedIn;
    private Adress adress;
    private String trivia;
    private int heigth;
    private int nationality;
    private String biography;
    private int role;

    public FilmPerson() {
        this.id = 0;
        this.workedIn = new ArrayList<>();
        this.adress = null;
        this.trivia = "";
        this.heigth = 0;
        this.nationality = 0;
        this.biography = "";
        this.role = 0;
    }
    
    public FilmPerson(int id) {}

    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
    
    public ArrayList<Production> getWorkedIn() {
        return workedIn;
    }

    public Adress getAdress() {
        return adress;
    }

    public String getTrivia() {
        return trivia;
    }

    public int getHeigth() {
        return heigth;
    }

    public int getNationality() {
        return nationality;
    }

    public String getBiography() {
        return biography;
    }

    public void setWorkedIn(ArrayList<Production> workedIn) {
        this.workedIn = workedIn;
    }

    public void setAdress(Adress adress) {
        this.adress = adress;
    }

    public void setTrivia(String trivia) {
        this.trivia = trivia;
    }

    public void setHeigth(int heigth) {
        this.heigth = heigth;
    }

    public void setNationality(int nationality) {
        this.nationality = nationality;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }
}
