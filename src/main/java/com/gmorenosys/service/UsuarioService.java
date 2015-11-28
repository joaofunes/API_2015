/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.service;

import com.gmorenosys.dao.UsuarioDao;
import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.SsUsuarios;
import com.gmorenosys.model.Usuario;
import com.gmorenosys.service.generic.GenericService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Joao
 */
@Service(value = "usuarioService")
public class UsuarioService extends GenericService<Usuario, Integer> {

    @Autowired
    private UsuarioDao usuarioDao;
    @Override
    public GenericDao<Usuario, Integer> getDao() {
       return usuarioDao;
    }
    
      public Usuario getNotarioByIdUsuario(Integer usuario) {
        return usuarioDao.getNotarioByIdUsuario(usuario);          
      }
    
}
