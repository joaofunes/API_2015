/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.service;

import com.gmorenosys.dao.LibroDao;
import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.Libro;
import com.gmorenosys.model.SsUsuarios;
import com.gmorenosys.service.generic.GenericService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Joao
 */

@Service(value = "libroService")
public class LibroService extends GenericService<Libro, Integer>{

    
    @Autowired
    private LibroDao libroDao;
    
    @Override
    public GenericDao<Libro, Integer> getDao() {
        return libroDao;
    }


    public List<Libro> getAllByIdNotario(Integer notario) {
       return libroDao.getAllByIdNotario(notario);
    }
    
}
