/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.dao;

import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.SsUsuarios;
import com.gmorenosys.model.Usuario;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Joao
 */

@Repository
public class UsuarioDao extends GenericDao<Usuario, Integer>{
     
       public Usuario getNotarioByIdUsuario(Integer usuario) {
        try {
            Query q = getSessionFactory().getCurrentSession().createQuery("SELECT us FROM Usuario us WHERE us.idssusuario ='"+usuario+"'");
           // q.setParameter("id", usuario);
            if(q.uniqueResult()!=null){
                  return (Usuario) q.uniqueResult();
            }else{
                return null;
            }
          
        } catch (Exception e) {
            System.out.println("error - getNotarioByIdUsuario "+e);
        }
           return null;

    }
}
