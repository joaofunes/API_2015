package com.gmorenosys.dao;

import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.SsMenus;
import com.gmorenosys.model.SsOpciones;
import com.gmorenosys.model.SsRoles;
import java.util.List;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

@Repository(value = "ssOpcionesDao")
public class SsOpcionesDao extends GenericDao<SsOpciones, Integer> {

    public List<SsOpciones> getOpcionesByMenuRol(SsMenus menu, SsRoles rol) {
        Query q = getSessionFactory().getCurrentSession().createQuery("SELECT o  FROM SsOpciones o "
                + "LEFT OUTER JOIN o.ssMenusSet m  "
                + "LEFT OUTER JOIN o.ssRolesSet r  "
                + "WHERE o.visible='S' AND r.idRol = :rol  AND m.idMenu =:menu  ");
        q.setParameter("rol", rol.getIdRol());
        q.setParameter("menu", menu.getIdMenu());
        return q.list();
    }
}
