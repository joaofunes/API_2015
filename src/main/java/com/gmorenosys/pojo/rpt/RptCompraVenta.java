/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.pojo.rpt;

import java.io.Serializable;

/**
 *com.gmorenosys.pojo.rpt.RptCompraVenta
 * @author Joao
 */
public class RptCompraVenta implements Serializable{
    private static final long serialVersionUID = 1L;
    
    
    private String placa;
    private String clase;
    private String marca;
    private String modelo;
    private String motor;
    private String chasis;
    private String vin;
    private String anio;
    private String numcv;
    private String fechacv;
    private String precio;

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getClase() {
        return clase;
    }

    public void setClase(String clase) {
        this.clase = clase;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMotor() {
        return motor;
    }

    public void setMotor(String motor) {
        this.motor = motor;
    }

    public String getChasis() {
        return chasis;
    }

    public void setChasis(String chasis) {
        this.chasis = chasis;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public String getAnio() {
        return anio;
    }

    public void setAnio(String anio) {
        this.anio = anio;
    }

    public String getNumcv() {
        return numcv;
    }

    public void setNumcv(String numcv) {
        this.numcv = numcv;
    }

    public String getFechacv() {
        return fechacv;
    }

    public void setFechacv(String fechacv) {
        this.fechacv = fechacv;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    
    
    
}
