/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.dao;

import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.Clientes;
import java.util.List;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Joao
 */
@Repository
public class ClientesDao extends GenericDao<Clientes, Integer> {

    public List<Clientes> getAllClientesXNotario(Integer notario) {
        try {
            Query q = getSessionFactory().getCurrentSession().createQuery("SELECT client FROM Clientes client WHERE client.idnotario ='" + notario + "'");
            return q.list();
        } catch (Exception e) {
            System.out.println("error getAllClientesXNotario" + e);
        }
        return null;
    }
    
}
