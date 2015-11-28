/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.service;

import com.gmorenosys.dao.VentaDao;
import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.Clientes;
import com.gmorenosys.model.Venta;
import com.gmorenosys.service.generic.GenericService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Joao
 */

@Service(value = "ventaService")
public class VentaService extends GenericService<Venta, Integer> {

    @Autowired
    private VentaDao ventaDao;
    @Override
    public GenericDao<Venta, Integer> getDao() {
      return ventaDao;
    }

    public List<Venta> getListadoVenta(String fechaini, String fechafin, Clientes cliente) {
        return ventaDao.getListadoVenta(fechaini, fechafin, cliente);
    }
    
}
