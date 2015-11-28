/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Joao
 */
@Entity
@Table(name = "usuario", catalog = "sipgdn", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"IDUSUARIO"})})
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u")})
public class Usuario implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "IDUSUARIO", nullable = false, length = 10)
    private String idusuario;
    @JoinColumn(name = "IDNOTARIO", referencedColumnName = "IDNOTARIO")
    @ManyToOne
    private Notario idnotario;
    @JoinColumn(name = "IDSSUSUARIO", referencedColumnName = "ID_USUARIO")
    @ManyToOne
    private SsUsuarios idssusuario;

    public Usuario() {
    }

    public Usuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public Notario getIdnotario() {
        return idnotario;
    }

    public void setIdnotario(Notario idnotario) {
        this.idnotario = idnotario;
    }

    public SsUsuarios getIdssusuario() {
        return idssusuario;
    }

    public void setIdssusuario(SsUsuarios idssusuario) {
        this.idssusuario = idssusuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idusuario != null ? idusuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.idusuario == null && other.idusuario != null) || (this.idusuario != null && !this.idusuario.equals(other.idusuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.gmorenosys.model.Usuario[ idusuario=" + idusuario + " ]";
    }
    
}
