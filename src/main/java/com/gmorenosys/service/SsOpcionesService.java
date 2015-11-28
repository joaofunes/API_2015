package com.gmorenosys.service;

import com.gmorenosys.dao.SsOpcionesDao;
import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.SsMenus;
import com.gmorenosys.model.SsOpciones;
import com.gmorenosys.model.SsRoles;
import com.gmorenosys.service.generic.GenericService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "ssOpcionesService")
public class SsOpcionesService extends GenericService<SsOpciones, Integer> {

    @Autowired
    private SsOpcionesDao ssOpcionesDao;

    @Override
    public GenericDao<SsOpciones, Integer> getDao() {
        return ssOpcionesDao;
    }

    public List<SsOpciones> getOpcionesByMenuRol(SsRoles rol, SsMenus menu) {
        return this.ssOpcionesDao.getOpcionesByMenuRol(menu, rol);
    }

}
