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
@Table(name = "armas", catalog = "sipgdn", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"IDARMA"})})
@NamedQueries({
    @NamedQuery(name = "Armas.findAll", query = "SELECT a FROM Armas a")})
public class Armas implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDARMA", nullable = false)
    private Integer idarma;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 8)
    @Column(name = "MATRICULA", nullable = false, length = 8)
    private String matricula;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "MARCAA", nullable = false, length = 25)
    private String marcaa;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CALIBRE", nullable = false)
    private float calibre;
    @Basic(optional = false)
    @NotNull
    @Column(name = "NUMSERIE", nullable = false)
    private int numserie;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "MODELOA", nullable = false, length = 30)
    private String modeloa;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "TIPOA", nullable = false, length = 25)
    private String tipoa;
    @Basic(optional = false)
    @NotNull
    @Column(name = "LARGO", nullable = false)
    private float largo;
    @OneToMany(mappedBy = "idarma")
    private Set<Venta> ventaSet;

    public Armas() {
    }

    public Armas(Integer idarma) {
        this.idarma = idarma;
    }

    public Armas(Integer idarma, String matricula, String marcaa, float calibre, int numserie, String modeloa, String tipoa, float largo) {
        this.idarma = idarma;
        this.matricula = matricula;
        this.marcaa = marcaa;
        this.calibre = calibre;
        this.numserie = numserie;
        this.modeloa = modeloa;
        this.tipoa = tipoa;
        this.largo = largo;
    }

    public Integer getIdarma() {
        return idarma;
    }

    public void setIdarma(Integer idarma) {
        this.idarma = idarma;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getMarcaa() {
        return marcaa;
    }

    public void setMarcaa(String marcaa) {
        this.marcaa = marcaa;
    }

    public float getCalibre() {
        return calibre;
    }

    public void setCalibre(float calibre) {
        this.calibre = calibre;
    }

    public int getNumserie() {
        return numserie;
    }

    public void setNumserie(int numserie) {
        this.numserie = numserie;
    }

    public String getModeloa() {
        return modeloa;
    }

    public void setModeloa(String modeloa) {
        this.modeloa = modeloa;
    }

    public String getTipoa() {
        return tipoa;
    }

    public void setTipoa(String tipoa) {
        this.tipoa = tipoa;
    }

    public float getLargo() {
        return largo;
    }

    public void setLargo(float largo) {
        this.largo = largo;
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
        hash += (idarma != null ? idarma.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Armas)) {
            return false;
        }
        Armas other = (Armas) object;
        if ((this.idarma == null && other.idarma != null) || (this.idarma != null && !this.idarma.equals(other.idarma))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.gmorenosys.model.Armas[ idarma=" + idarma + " ]";
    }
    
}
