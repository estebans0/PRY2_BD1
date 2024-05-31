/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author wess
 */
public class FamilyMember {
    private int id;
    private String name;
    private String relationshipType;

    public FamilyMember() {
        this.id = 0;
        this.name = "";
        this.relationshipType = "";
    }
    
    public FamilyMember(int idOfThePersonTheyAreRelatedTo)
    {
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public String getRelationshipType() {
        return relationshipType;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setRelationshipType(String relationshipType) {
        this.relationshipType = relationshipType;
    }
}
