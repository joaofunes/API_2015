/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.service;

import com.gmorenosys.dao.PasosDao;
import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.Libro;
import com.gmorenosys.model.Pasos;
import com.gmorenosys.service.generic.GenericService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Joao
 */

@Service(value = "pasosService")
public class PasosService extends GenericService<Pasos, Integer> {

    @Autowired
    private PasosDao pasosDao;
    @Override
    public GenericDao<Pasos, Integer> getDao() {
     return pasosDao;
    }

    public List<Pasos> getListadoPasos(String date1, String date2, Libro libro) {
        return pasosDao.getListadoPasos(date1,date2,libro);
    }
    
}
