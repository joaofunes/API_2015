/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.service;

import com.gmorenosys.dao.ArmasDao;
import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.Armas;
import com.gmorenosys.service.generic.GenericService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Joao
 */
@Service(value = "armasService")
public class ArmasService extends GenericService<Armas, Integer> {

    
    @Autowired 
    private ArmasDao armasDao;
    
    @Override
    public GenericDao<Armas, Integer> getDao() {
       return  armasDao;
    }
    
}
