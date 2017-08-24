package com.vatestar.cm.service;

import com.vatestar.cm.entity.TbAccount;

import java.util.List;

/**
 * Created by dyl on 16/7/26.
 */
public interface SampleService {
    public void addAccount(TbAccount tbAccount);

    public void editAccount(TbAccount tbAccount);

    public void removeAccount(int id);

    public List<TbAccount> findAccount(TbAccount tbAccount);
}
