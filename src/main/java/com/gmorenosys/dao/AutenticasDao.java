/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.dao;

import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.Autenticas;
import com.gmorenosys.model.Notario;
import java.util.List;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Joao
 */


@Repository
public class AutenticasDao extends GenericDao<Autenticas, Integer>  {
    
    public List<Notario> getAllAutenticas(Integer notario) {
        try {

            String sql = "SELECT DISTINCT aut.IDAUTENTICA,nota.NOMBRE, aut.IDAUTENTICA , clie.NOMBRE, clie.DUI, aut.FECHAFIRMA, aut.COSTOAUTENTICA  FROM notario nota \n"
                    + "INNER JOIN usuario usu\n"
                    + "ON nota.IDNOTARIO=usu.IDNOTARIO\n"
                    + "INNER JOIN autenticas aut\n"
                    + "ON usu.IDUSUARIO=aut.IDUSUARIO\n"
                    + "INNER JOIN clientes clie\n"
                    + "ON clie.IDNOTARIO=nota.IDNOTARIO\n"
                    + "WHERE nota.IDNOTARIO='" + notario + "' ;";

            Query q = getSessionFactory().getCurrentSession().createSQLQuery(sql);
            return q.list();
        } catch (Exception e) {
            System.out.println("error getAllAutenticas" + e);
        }
        return null;
    }
    
     public List<Autenticas> getAllAutenticasHQL(Integer notario) {
        try {
            Query q = getSessionFactory().getCurrentSession().createQuery("SELECT aute FROM Autenticas aute INNER JOIN aute.idusuario usu INNER JOIN usu.idnotario nota WHERE nota.idnotario =:id");
            q.setParameter("id",notario);
            return q.list();
        } catch (Exception e) {
            System.out.println("error getAllAutenticas" + e);
        }
        return null;
    }
    
}
