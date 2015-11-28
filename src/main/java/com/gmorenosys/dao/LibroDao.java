/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.dao;

import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.Libro;
import com.gmorenosys.model.SsUsuarios;
import java.util.List;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Joao
 */

@Repository
public class LibroDao extends GenericDao<Libro, Integer>  {

    public List<Libro> getAllByIdNotario(Integer notario) {       
        try {
            Query q=getSessionFactory().getCurrentSession().createQuery("SELECT libro FROM Libro libro WHERE libro.idnotario ='"+notario+"'");          
        
            if(q.list().size() >0){
                return q.list(); 
            }
            else{
                return null;
            }
            
        } catch (Exception e) {
            System.out.println("error getAllByIdNotario"+e);
        }
        return null;
    }
    
}
