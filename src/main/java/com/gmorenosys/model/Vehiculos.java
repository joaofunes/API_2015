/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.model;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Joao
 */
@Entity
@Table(name = "vehiculos", catalog = "sipgdn", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"IDVEHICULO"})})
@NamedQueries({
    @NamedQuery(name = "Vehiculos.findAll", query = "SELECT v FROM Vehiculos v")})
public class Vehiculos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDVEHICULO", nullable = false)
    private Integer idvehiculo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 8)
    @Column(name = "PLACA", nullable = false, length = 8)
    private String placa;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "CLASE", nullable = false, length = 20)
    private String clase;
    @Size(max = 25)
    @Column(name = "TIPO", length = 25)
    private String tipo;
    @Size(max = 25)
    @Column(name = "MARCA", length = 25)
    private String marca;
    @Size(max = 30)
    @Column(name = "MODELO", length = 30)
    private String modelo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "MOTOR", nullable = false, length = 20)
    private String motor;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "CHASIS", nullable = false, length = 20)
    private String chasis;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "VIN", nullable = false, length = 20)
    private String vin;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ANIO", nullable = false)
    private int anio;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "COLOR", nullable = false, length = 25)
    private String color;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CAPACIDAD", nullable = false)
    private float capacidad;
    @OneToMany(mappedBy = "idvehiculo")
    private Set<Venta> ventaSet;

    public Vehiculos() {
    }

    public Vehiculos(Integer idvehiculo) {
        this.idvehiculo = idvehiculo;
    }

    public Vehiculos(Integer idvehiculo, String placa, String clase, String motor, String chasis, String vin, int anio, String color, float capacidad) {
        this.idvehiculo = idvehiculo;
        this.placa = placa;
        this.clase = clase;
        this.motor = motor;
        this.chasis = chasis;
        this.vin = vin;
        this.anio = anio;
        this.color = color;
        this.capacidad = capacidad;
    }

    public Integer getIdvehiculo() {
        return idvehiculo;
    }

    public void setIdvehiculo(Integer idvehiculo) {
        this.idvehiculo = idvehiculo;
    }

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

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
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

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public float getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(float capacidad) {
        this.capacidad = capacidad;
    }

    public Set<Venta> getVentaSet() {
        return ventaSet;
    }

    public void setVentaSet(Set<Venta> ventaSet) {
        this.ventaSet = ventaSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idvehiculo != null ? idvehiculo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Vehiculos)) {
            return false;
        }
        Vehiculos other = (Vehiculos) object;
        if ((this.idvehiculo == null && other.idvehiculo != null) || (this.idvehiculo != null && !this.idvehiculo.equals(other.idvehiculo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.gmorenosys.model.Vehiculos[ idvehiculo=" + idvehiculo + " ]";
    }
    
}
