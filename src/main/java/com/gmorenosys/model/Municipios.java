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
@Table(name = "municipios", catalog = "sipgdn", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"IDMCPIO"})})
@NamedQueries({
    @NamedQuery(name = "Municipios.findAll", query = "SELECT m FROM Municipios m")})
public class Municipios implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDMCPIO", nullable = false)
    private Integer idmcpio;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 35)
    @Column(name = "NOMMCPIO", nullable = false, length = 35)
    private String nommcpio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "IDDEPTO", nullable = false)
    private int iddepto;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "NOMDEPTO", nullable = false, length = 20)
    private String nomdepto;
    @OneToMany(mappedBy = "idmcpio")
    private Set<Clientes> clientesSet;

    public Municipios() {
    }

    public Municipios(Integer idmcpio) {
        this.idmcpio = idmcpio;
    }

    public Municipios(Integer idmcpio, String nommcpio, int iddepto, String nomdepto) {
        this.idmcpio = idmcpio;
        this.nommcpio = nommcpio;
        this.iddepto = iddepto;
        this.nomdepto = nomdepto;
    }

    public Integer getIdmcpio() {
        return idmcpio;
    }

    public void setIdmcpio(Integer idmcpio) {
        this.idmcpio = idmcpio;
    }

    public String getNommcpio() {
        return nommcpio;
    }

    public void setNommcpio(String nommcpio) {
        this.nommcpio = nommcpio;
    }

    public int getIddepto() {
        return iddepto;
    }

    public void setIddepto(int iddepto) {
        this.iddepto = iddepto;
    }

    public String getNomdepto() {
        return nomdepto;
    }

    public void setNomdepto(String nomdepto) {
        this.nomdepto = nomdepto;
    }

    public Set<Clientes> getClientesSet() {
        return clientesSet;
    }

    public void setClientesSet(Set<Clientes> clientesSet) {
        this.clientesSet = clientesSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmcpio != null ? idmcpio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Municipios)) {
            return false;
        }
        Municipios other = (Municipios) object;
        if ((this.idmcpio == null && other.idmcpio != null) || (this.idmcpio != null && !this.idmcpio.equals(other.idmcpio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.gmorenosys.model.Municipios[ idmcpio=" + idmcpio + " ]";
    }
    
}
