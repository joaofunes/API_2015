/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.pojo.rpt;

import java.io.Serializable;

/**
 *com.gmorenosys.pojo.rpt.RptIndeceProtocolario
 * @author Joao
 */
public class RptIndeceProtocolario implements Serializable{
    
    
    private String fecha; 
    private String otorgante;
    private String folioDesde;
    private String folioHasta;

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getOtorgante() {
        return otorgante;
    }

    public void setOtorgante(String otorgante) {
        this.otorgante = otorgante;
    }

    public String getFolioDesde() {
        return folioDesde;
    }

    public void setFolioDesde(String folioDesde) {
        this.folioDesde = folioDesde;
    }

    public String getFolioHasta() {
        return folioHasta;
    }

    public void setFolioHasta(String folioHasta) {
        this.folioHasta = folioHasta;
    }


    
}
