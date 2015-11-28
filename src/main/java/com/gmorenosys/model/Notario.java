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
@Table(name = "notario", catalog = "sipgdn", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"IDNOTARIO"})})
@NamedQueries({
    @NamedQuery(name = "Notario.findAll", query = "SELECT n FROM Notario n")})
public class Notario implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDNOTARIO", nullable = false)
    private Integer idnotario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "NOMBRE", nullable = false, length = 40)
    private String nombre;
    @Size(max = 40)
    @Column(name = "DOMICILIO", length = 40)
    private String domicilio;
    @OneToMany(mappedBy = "idnotario")
    private Set<Clientes> clientesSet;
    @OneToMany(mappedBy = "idnotario")
    private Set<Usuario> usuarioSet;
    @OneToMany(mappedBy = "idnotario")
    private Set<Libro> libroSet;

    public Notario() {
    }

    public Notario(Integer idnotario) {
        this.idnotario = idnotario;
    }

    public Notario(Integer idnotario, String nombre) {
        this.idnotario = idnotario;
        this.nombre = nombre;
    }

    public Integer getIdnotario() {
        return idnotario;
    }

    public void setIdnotario(Integer idnotario) {
        this.idnotario = idnotario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDomicilio() {
        return domicilio;
    }

    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }

    public Set<Clientes> getClientesSet() {
        return clientesSet;
    }

    public void setClientesSet(Set<Clientes> clientesSet) {
        this.clientesSet = clientesSet;
    }

    public Set<Usuario> getUsuarioSet() {
        return usuarioSet;
    }

    public void setUsuarioSet(Set<Usuario> usuarioSet) {
        this.usuarioSet = usuarioSet;
    }

    public Set<Libro> getLibroSet() {
        return libroSet;
    }

    public void setLibroSet(Set<Libro> libroSet) {
        this.libroSet = libroSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idnotario != null ? idnotario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Notario)) {
            return false;
        }
        Notario other = (Notario) object;
        if ((this.idnotario == null && other.idnotario != null) || (this.idnotario != null && !this.idnotario.equals(other.idnotario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.gmorenosys.model.Notario[ idnotario=" + idnotario + " ]";
    }
    
}
