package com.gmorenosys.service;

import com.gmorenosys.dao.SsRolesDao;
import com.gmorenosys.dao.generic.GenericDao;
import com.gmorenosys.model.SsRoles;
import com.gmorenosys.service.generic.GenericService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SsRolesService extends GenericService<SsRoles, Integer> {

    @Autowired
    private SsRolesDao ssRolesDao;

    @Override
    public GenericDao<SsRoles, Integer> getDao() {
        return ssRolesDao;
    }

    public List<SsRoles> findByUrl(String url) {
        return ssRolesDao.findByUrl(url);
    }

}
