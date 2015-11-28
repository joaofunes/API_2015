/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.service;

import com.gmorenosys.dao.VehiculosDao;
import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.Vehiculos;
import com.gmorenosys.service.generic.GenericService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Joao
 */

@Service(value = "vehiculosService")
public class VehiculosService extends GenericService<Vehiculos, Integer>{

    @Autowired
    private VehiculosDao vehiculosDao;
    
    @Override
    public GenericDao<Vehiculos, Integer> getDao() {
      return vehiculosDao;
    }
    
}
