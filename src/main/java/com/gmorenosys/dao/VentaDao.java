/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.dao;

import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.Clientes;
import com.gmorenosys.model.Venta;
import java.util.List;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Joao
 */
@Repository
public class VentaDao extends GenericDao<Venta, Integer> {

    public List<Venta> getListadoVenta(String fechaini, String fechafin, Clientes cliente) {
        try {

            Query q = getSessionFactory().getCurrentSession().createQuery("SELECT venta FROM Venta venta inner join  venta.idvehiculo vn WHERE venta.idcliente ='" + cliente.getIdcliente() + "' and "
                    + " venta.fechacv Between '" + fechaini + "' and '" + fechafin + "' and venta.idvehiculo is not null ");
            return q.list();
        } catch (Exception e) {
            System.out.println("error getListadoVenta" + e);
        }
        return null;
    }

}
