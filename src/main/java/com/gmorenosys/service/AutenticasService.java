/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.service;

import com.gmorenosys.dao.AutenticasDao;
import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.Autenticas;
import com.gmorenosys.service.generic.GenericService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Joao
 */
@Service(value = "autenticasService")
public class AutenticasService extends GenericService<Autenticas, Integer> {

    @Autowired
    private AutenticasDao autenticasDao;
    @Override
    public GenericDao<Autenticas, Integer> getDao() {
        return autenticasDao;
    }
    
    
      public List<Autenticas> getAllAutenticasHQL(Integer notario) {
          return autenticasDao.getAllAutenticasHQL(notario);
      }
}
