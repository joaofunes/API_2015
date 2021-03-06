/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gmorenosys.managedbean.lazymodel;

import com.gmorenosys.managedbean.lazymodel.generic.GenericLazyModel;
import com.gmorenosys.model.SsUsuarios;
import com.gmorenosys.service.generic.GenericService;

/**
 *
 * @author Josue
 */
public class UsuarioLazyModel extends GenericLazyModel<SsUsuarios, Integer>{

    public UsuarioLazyModel(GenericService<SsUsuarios, Integer> service) {
        super(service);
    }

    @Override
    public SsUsuarios getRowData(String rowKey) {
         for (SsUsuarios ssusuarios : getDatasource()) {
            if (ssusuarios.getIdUsuario().equals(Integer.valueOf(rowKey))) {
                return ssusuarios;
            }
        }
        return null;
    }

    @Override
    public Integer getRowKey(SsUsuarios element) {
        return element.getIdUsuario();
    }
    
}
