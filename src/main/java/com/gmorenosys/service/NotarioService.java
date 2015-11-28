/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.service;

import com.gmorenosys.dao.NotarioDao;
import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.Notario;
import com.gmorenosys.service.generic.GenericService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Joao
 */

@Service(value = "notarioService")
public class NotarioService extends GenericService<Notario, Integer>  {

    @Autowired
    private NotarioDao notarioDao;
    
    @Override
    public GenericDao<Notario, Integer> getDao() {
    return notarioDao;
    }
    
}
