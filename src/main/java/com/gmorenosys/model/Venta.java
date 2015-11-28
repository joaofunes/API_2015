/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.model;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Joao
 */
@Entity
@Table(name = "venta", catalog = "sipgdn", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"IDVENTA"})})
@NamedQueries({
    @NamedQuery(name = "Venta.findAll", query = "SELECT v FROM Venta v")})
public class Venta implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDVENTA", nullable = false)
    private Integer idventa;
    @Basic(optional = false)
    @NotNull
    @Column(name = "NUMCV", nullable = false)
    private int numcv;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FECHACV", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechacv;
    @Basic(optional = false)
    @NotNull
    @Column(name = "TIPOCV", nullable = false)
    private int tipocv;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRECIO", nullable = false)
    private float precio;
    @Column(name = "ESTADO")
    private Short estado;
    @JoinColumn(name = "IDVEHICULO", referencedColumnName = "IDVEHICULO")
    @ManyToOne
    private Vehiculos idvehiculo;
    @JoinColumn(name = "IDARMA", referencedColumnName = "IDARMA")
    @ManyToOne
    private Armas idarma;
    @JoinColumn(name = "IDUSUARIO", referencedColumnName = "IDUSUARIO")
    @ManyToOne
    private Usuario idusuario;
    @JoinColumn(name = "IDCLIENTE", referencedColumnName = "IDCLIENTE")
    @ManyToOne
    private Clientes idcliente;
    @JoinColumn(name = "CLI_IDCLIENTE", referencedColumnName = "IDCLIENTE")
    @ManyToOne
    private Clientes cliIdcliente;

    public Venta() {
    }

    public Venta(Integer idventa) {
        this.idventa = idventa;
    }

    public Venta(Integer idventa, int numcv, Date fechacv, int tipocv, float precio) {
        this.idventa = idventa;
        this.numcv = numcv;
        this.fechacv = fechacv;
        this.tipocv = tipocv;
        this.precio = precio;
    }

    public Integer getIdventa() {
        return idventa;
    }

    public void setIdventa(Integer idventa) {
        this.idventa = idventa;
    }

    public int getNumcv() {
        return numcv;
    }

    public void setNumcv(int numcv) {
        this.numcv = numcv;
    }

    public Date getFechacv() {
        return fechacv;
    }

    public void setFechacv(Date fechacv) {
        this.fechacv = fechacv;
    }

    public int getTipocv() {
        return tipocv;
    }

    public void setTipocv(int tipocv) {
        this.tipocv = tipocv;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public Short getEstado() {
        return estado;
    }

    public void setEstado(Short estado) {
        this.estado = estado;
    }

    public Vehiculos getIdvehiculo() {
        return idvehiculo;
    }

    public void setIdvehiculo(Vehiculos idvehiculo) {
        this.idvehiculo = idvehiculo;
    }

    public Armas getIdarma() {
        return idarma;
    }

    public void setIdarma(Armas idarma) {
        this.idarma = idarma;
    }

    public Usuario getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Usuario idusuario) {
        this.idusuario = idusuario;
    }

    public Clientes getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Clientes idcliente) {
        this.idcliente = idcliente;
    }

    public Clientes getCliIdcliente() {
        return cliIdcliente;
    }

    public void setCliIdcliente(Clientes cliIdcliente) {
        this.cliIdcliente = cliIdcliente;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idventa != null ? idventa.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Venta)) {
            return false;
        }
        Venta other = (Venta) object;
        if ((this.idventa == null && other.idventa != null) || (this.idventa != null && !this.idventa.equals(other.idventa))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.gmorenosys.model.Venta[ idventa=" + idventa + " ]";
    }
    
}
