/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.beans;
import java.io.Serializable;

/**
 *
 * @author SAMUEL
 */
public class LoginBean implements Serializable {
    private int id;
    private String email;
    private Perfil perfil;
    
    public LoginBean() {
        
    }

    public LoginBean(int id, String email, Perfil perfil) {
        this.id = id;
        this.email = email;
        this.perfil = perfil;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }
    
    
    
    
}
