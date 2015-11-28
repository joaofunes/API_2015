/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.service;

import com.gmorenosys.dao.ClientesDao;
import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.Clientes;
import com.gmorenosys.service.generic.GenericService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Joao
 */

@Service(value = "clientesService")
public class ClientesService extends GenericService<Clientes, Integer> {

    @Autowired
    private ClientesDao clientesDao;
    @Override
    public GenericDao<Clientes, Integer> getDao() {
       return clientesDao;
    }
    
    
     public List<Clientes> getAllClientesXNotario(Integer notario) {
       return clientesDao.getAllClientesXNotario(notario);
    }
    
}
