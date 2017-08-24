package com.vatestar.cm.service.impl;

import com.vatestar.cm.dao.TbAccountDao;
import com.vatestar.cm.entity.TbAccount;
import com.vatestar.cm.service.SampleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

/**
 * Created by dyl on 16/7/26.
 */
@Service
public class SampleServiceImpl implements SampleService {

    @Autowired
    private TbAccountDao tbAccountDao;

    /**
     * 添加账户
     * @param tbAccount
     */
    @Override
    public void addAccount(TbAccount tbAccount){

        tbAccount.setRtime(new Date(System.currentTimeMillis()));
        tbAccountDao.saveAccount(tbAccount);
    }

    @Override
    public void editAccount(TbAccount tbAccount) {
        tbAccountDao.updateAccount(tbAccount);
    }

    @Override
    public void removeAccount(int id) {
        tbAccountDao.delAccount(id);
    }

    @Override
    public List<TbAccount> findAccount(TbAccount tbAccount) {
        List<TbAccount> list = tbAccountDao.findAccount(tbAccount);
        return list;
    }
}
