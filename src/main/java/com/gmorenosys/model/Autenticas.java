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
import javax.validation.constraints.Size;

/**
 *
 * @author Joao
 */
@Entity
@Table(name = "autenticas", catalog = "sipgdn", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"IDAUTENTICA"})})
@NamedQueries({
    @NamedQuery(name = "Autenticas.findAll", query = "SELECT a FROM Autenticas a")})
public class Autenticas implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDAUTENTICA", nullable = false)
    private Integer idautentica;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "IDFIRMANTE", nullable = false, length = 10)
    private String idfirmante;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FECHAFIRMA", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechafirma;
    @Basic(optional = false)
    @NotNull
    @Column(name = "COSTOAUTENTICA", nullable = false)
    private float costoautentica;
    @JoinColumn(name = "IDUSUARIO", referencedColumnName = "IDUSUARIO")
    @ManyToOne
    private Usuario idusuario;

    public Autenticas() {
    }

    public Autenticas(Integer idautentica) {
        this.idautentica = idautentica;
    }

    public Autenticas(Integer idautentica, String idfirmante, Date fechafirma, float costoautentica) {
        this.idautentica = idautentica;
        this.idfirmante = idfirmante;
        this.fechafirma = fechafirma;
        this.costoautentica = costoautentica;
    }

    public Integer getIdautentica() {
        return idautentica;
    }

    public void setIdautentica(Integer idautentica) {
        this.idautentica = idautentica;
    }

    public String getIdfirmante() {
        return idfirmante;
    }

    public void setIdfirmante(String idfirmante) {
        this.idfirmante = idfirmante;
    }

    public Date getFechafirma() {
        return fechafirma;
    }

    public void setFechafirma(Date fechafirma) {
        this.fechafirma = fechafirma;
    }

    public float getCostoautentica() {
        return costoautentica;
    }

    public void setCostoautentica(float costoautentica) {
        this.costoautentica = costoautentica;
    }

    public Usuario getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Usuario idusuario) {
        this.idusuario = idusuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idautentica != null ? idautentica.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Autenticas)) {
            return false;
        }
        Autenticas other = (Autenticas) object;
        if ((this.idautentica == null && other.idautentica != null) || (this.idautentica != null && !this.idautentica.equals(other.idautentica))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.gmorenosys.model.Autenticas[ idautentica=" + idautentica + " ]";
    }
    
}
