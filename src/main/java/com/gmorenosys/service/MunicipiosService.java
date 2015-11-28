/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.service;

import com.gmorenosys.dao.MunicipiosDao;
import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.Municipios;
import com.gmorenosys.service.generic.GenericService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Joao
 */

@Service(value = "municipiosService")
public class MunicipiosService extends GenericService<Municipios, Integer> {

    @Autowired
    private MunicipiosDao municipiosDao;
    
    @Override
    public GenericDao<Municipios, Integer> getDao() {
     return municipiosDao;
    }
    
}
