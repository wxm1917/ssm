package com.vatestar.cm.dao;

import com.vatestar.cm.entity.TbAccount;

import java.util.List;

/**
 * Created by dyl on 16/7/26.
 */
public interface TbAccountDao {
    public Integer saveAccount(TbAccount tbAccount);

    public Integer delAccount(int id);

    public Integer updateAccount(TbAccount tbAccount);

    public List<TbAccount> findAccount(TbAccount tbAccount);
}
