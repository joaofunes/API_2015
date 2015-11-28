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
@Table(name = "pasos", catalog = "sipgdn", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"IDPASO"})})
@NamedQueries({
    @NamedQuery(name = "Pasos.findAll", query = "SELECT p FROM Pasos p")})
public class Pasos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDPASO", nullable = false)
    private Integer idpaso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 4)
    @Column(name = "DESDE", nullable = false, length = 4)
    private String desde;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 4)
    @Column(name = "HASTA", nullable = false, length = 4)
    private String hasta;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "OTORGANTE", nullable = false, length = 40)
    private String otorgante;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "FAVORECIDO", nullable = false, length = 40)
    private String favorecido;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FECHAFIRMA", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechafirma;
    @Basic(optional = false)
    @NotNull
    @Column(name = "COSTOPASO", nullable = false)
    private float costopaso;
    @JoinColumn(name = "IDLIBRO", referencedColumnName = "IDLIBRO")
    @ManyToOne
    private Libro idlibro;
    @JoinColumn(name = "IDUSUARIO", referencedColumnName = "IDUSUARIO")
    @ManyToOne
    private Usuario idusuario;

    public Pasos() {
    }

    public Pasos(Integer idpaso) {
        this.idpaso = idpaso;
    }

    public Pasos(Integer idpaso, String desde, String hasta, String otorgante, String favorecido, Date fechafirma, float costopaso) {
        this.idpaso = idpaso;
        this.desde = desde;
        this.hasta = hasta;
        this.otorgante = otorgante;
        this.favorecido = favorecido;
        this.fechafirma = fechafirma;
        this.costopaso = costopaso;
    }

    public Integer getIdpaso() {
        return idpaso;
    }

    public void setIdpaso(Integer idpaso) {
        this.idpaso = idpaso;
    }

    public String getDesde() {
        return desde;
    }

    public void setDesde(String desde) {
        this.desde = desde;
    }

    public String getHasta() {
        return hasta;
    }

    public void setHasta(String hasta) {
        this.hasta = hasta;
    }

    public String getOtorgante() {
        return otorgante;
    }

    public void setOtorgante(String otorgante) {
        this.otorgante = otorgante;
    }

    public String getFavorecido() {
        return favorecido;
    }

    public void setFavorecido(String favorecido) {
        this.favorecido = favorecido;
    }

    public Date getFechafirma() {
        return fechafirma;
    }

    public void setFechafirma(Date fechafirma) {
        this.fechafirma = fechafirma;
    }

    public float getCostopaso() {
        return costopaso;
    }

    public void setCostopaso(float costopaso) {
        this.costopaso = costopaso;
    }

    public Libro getIdlibro() {
        return idlibro;
    }

    public void setIdlibro(Libro idlibro) {
        this.idlibro = idlibro;
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
        hash += (idpaso != null ? idpaso.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pasos)) {
            return false;
        }
        Pasos other = (Pasos) object;
        if ((this.idpaso == null && other.idpaso != null) || (this.idpaso != null && !this.idpaso.equals(other.idpaso))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.gmorenosys.model.Pasos[ idpaso=" + idpaso + " ]";
    }
    
}
