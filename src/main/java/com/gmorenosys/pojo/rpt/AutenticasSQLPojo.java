/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.pojo.rpt;

import java.io.Serializable;

/**
 *
 * @author Joao
 */
public class AutenticasSQLPojo implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String idautenticas;
    private String nombre;
    private String notario;
    private String dui;
    private String fechafirma;
    private String costoautentica;

    public String getIdautenticas() {
        return idautenticas;
    }

    public void setIdautenticas(String idautenticas) {
        this.idautenticas = idautenticas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNotario() {
        return notario;
    }

    public void setNotario(String notario) {
        this.notario = notario;
    }

    public String getDui() {
        return dui;
    }

    public void setDui(String dui) {
        this.dui = dui;
    }

    public String getFechafirma() {
        return fechafirma;
    }

    public void setFechafirma(String fechafirma) {
        this.fechafirma = fechafirma;
    }

    public String getCostoautentica() {
        return costoautentica;
    }

    public void setCostoautentica(String costoautentica) {
        this.costoautentica = costoautentica;
    }
    
    
    
            
    
}
