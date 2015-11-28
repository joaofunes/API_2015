/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.dao;

import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.Libro;
import com.gmorenosys.model.Pasos;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Joao
 */

@Repository
public class PasosDao extends GenericDao<Pasos, Integer>{

    public List<Pasos> getListadoPasos(String date1, String date2, Libro libro) {
        try {
            Query q = getSessionFactory().getCurrentSession().createQuery("SELECT pasos FROM Pasos pasos WHERE pasos.idlibro ='" + libro.getIdlibro() + "' and"
                    + " pasos.fechafirma Between '"+date1+"' and '"+date2+"' ");
            return q.list();
        } catch (Exception e) {
            System.out.println("error getAllByIdNotario" + e);
        }
        return null;
    }
    
}
