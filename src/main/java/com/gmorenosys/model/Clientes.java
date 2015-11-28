/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.model;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Joao
 */
@Entity
@Table(name = "clientes", catalog = "sipgdn", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"IDCLIENTE"})})
@NamedQueries({
    @NamedQuery(name = "Clientes.findAll", query = "SELECT c FROM Clientes c")})
public class Clientes implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDCLIENTE", nullable = false)
    private Integer idcliente;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "DUI", nullable = false, length = 10)
    private String dui;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "NOMBRE", nullable = false, length = 40)
    private String nombre;
    @Size(max = 17)
    @Column(name = "NIT", length = 17)
    private String nit;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "PROFESION", nullable = false, length = 40)
    private String profesion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "SEXO", nullable = false)
    private Character sexo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FECHNAC", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechnac;
    @JoinColumn(name = "IDMCPIO", referencedColumnName = "IDMCPIO")
    @ManyToOne
    private Municipios idmcpio;
    @JoinColumn(name = "IDNOTARIO", referencedColumnName = "IDNOTARIO")
    @ManyToOne
    private Notario idnotario;
    @OneToMany(mappedBy = "idcliente")
    private Set<Venta> ventaSet;
    @OneToMany(mappedBy = "cliIdcliente")
    private Set<Venta> ventaSet1;

    public Clientes() {
    }

    public Clientes(Integer idcliente) {
        this.idcliente = idcliente;
    }

    public Clientes(Integer idcliente, String dui, String nombre, String profesion, Character sexo, Date fechnac) {
        this.idcliente = idcliente;
        this.dui = dui;
        this.nombre = nombre;
        this.profesion = profesion;
        this.sexo = sexo;
        this.fechnac = fechnac;
    }

    public Integer getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Integer idcliente) {
        this.idcliente = idcliente;
    }

    public String getDui() {
        return dui;
    }

    public void setDui(String dui) {
        this.dui = dui;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }

    public Character getSexo() {
        return sexo;
    }

    public void setSexo(Character sexo) {
        this.sexo = sexo;
    }

    public Date getFechnac() {
        return fechnac;
    }

    public void setFechnac(Date fechnac) {
        this.fechnac = fechnac;
    }

    public Municipios getIdmcpio() {
        return idmcpio;
    }

    public void setIdmcpio(Municipios idmcpio) {
        this.idmcpio = idmcpio;
    }

    public Notario getIdnotario() {
        return idnotario;
    }

    public void setIdnotario(Notario idnotario) {
        this.idnotario = idnotario;
    }

    public Set<Venta> getVentaSet() {
        return ventaSet;
    }

    public void setVentaSet(Set<Venta> ventaSet) {
        this.ventaSet = ventaSet;
    }

    public Set<Venta> getVentaSet1() {
        return ventaSet1;
    }

    public void setVentaSet1(Set<Venta> ventaSet1) {
        this.ventaSet1 = ventaSet1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idcliente != null ? idcliente.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Clientes)) {
            return false;
        }
        Clientes other = (Clientes) object;
        if ((this.idcliente == null && other.idcliente != null) || (this.idcliente != null && !this.idcliente.equals(other.idcliente))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.gmorenosys.model.Clientes[ idcliente=" + idcliente + " ]";
    }
    
}
