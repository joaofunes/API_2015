package com.gmorenosys.service;

import com.gmorenosys.dao.SsMenusDao;
import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.SsMenus;
import com.gmorenosys.model.SsRoles;
import com.gmorenosys.service.generic.GenericService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "ssMenuService")
public class SsMenusService extends GenericService<SsMenus, Integer> {

    @Autowired
    private SsMenusDao ssMenusDao;

    @Override
    public GenericDao<SsMenus, Integer> getDao() {
        return ssMenusDao;
    }

    public List<SsMenus> getMenusByrol(SsRoles rol) {
        return this.ssMenusDao.getMenusByrol(rol);
    }
}
