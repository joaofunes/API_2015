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

/**
 *
 * @author Joao
 */
@Entity
@Table(name = "libro", catalog = "sipgdn", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"IDLIBRO"})})
@NamedQueries({
    @NamedQuery(name = "Libro.findAll", query = "SELECT l FROM Libro l")})
public class Libro implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDLIBRO", nullable = false)
    private Integer idlibro;
    @Basic(optional = false)
    @NotNull
    @Column(name = "NUMLIBRO", nullable = false)
    private int numlibro;
    @Basic(optional = false)
    @NotNull
    @Column(name = "NUMFOLIOS", nullable = false)
    private int numfolios;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FECHAVENC", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechavenc;
    @OneToMany(mappedBy = "idlibro")
    private Set<Pasos> pasosSet;
    @JoinColumn(name = "IDNOTARIO", referencedColumnName = "IDNOTARIO")
    @ManyToOne
    private Notario idnotario;

    public Libro() {
    }

    public Libro(Integer idlibro) {
        this.idlibro = idlibro;
    }

    public Libro(Integer idlibro, int numlibro, int numfolios, Date fechavenc) {
        this.idlibro = idlibro;
        this.numlibro = numlibro;
        this.numfolios = numfolios;
        this.fechavenc = fechavenc;
    }

    public Integer getIdlibro() {
        return idlibro;
    }

    public void setIdlibro(Integer idlibro) {
        this.idlibro = idlibro;
    }

    public int getNumlibro() {
        return numlibro;
    }

    public void setNumlibro(int numlibro) {
        this.numlibro = numlibro;
    }

    public int getNumfolios() {
        return numfolios;
    }

    public void setNumfolios(int numfolios) {
        this.numfolios = numfolios;
    }

    public Date getFechavenc() {
        return fechavenc;
    }

    public void setFechavenc(Date fechavenc) {
        this.fechavenc = fechavenc;
    }

    public Set<Pasos> getPasosSet() {
        return pasosSet;
    }

    public void setPasosSet(Set<Pasos> pasosSet) {
        this.pasosSet = pasosSet;
    }

    public Notario getIdnotario() {
        return idnotario;
    }

    public void setIdnotario(Notario idnotario) {
        this.idnotario = idnotario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idlibro != null ? idlibro.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Libro)) {
            return false;
        }
        Libro other = (Libro) object;
        if ((this.idlibro == null && other.idlibro != null) || (this.idlibro != null && !this.idlibro.equals(other.idlibro))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.gmorenosys.model.Libro[ idlibro=" + idlibro + " ]";
    }
    
}
