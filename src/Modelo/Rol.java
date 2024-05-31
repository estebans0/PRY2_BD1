/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author wess
 */
public class Rol {
    private int type;
    private String name;
    private String characterName;
    private FilmPerson filmPerson;

    public Rol() {
        this.type = 0;
        this.name = "";
        this.characterName = "";
        this.filmPerson = null;
    }
    
    public Rol(int id)
    {
        
    }

    public int getType() {
        return type;
    }

    public String getName() {
        return name;
    }

    public void setType(int type) {
        this.type = type;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getCharacterName() {
        return characterName;
    }

    public FilmPerson getFilmPerson() {
        return filmPerson;
    }

    public void setCharacterName(String characterName) {
        this.characterName = characterName;
    }

    public void setFilmPerson(FilmPerson filmPerson) {
        this.filmPerson = filmPerson;
    }
}
