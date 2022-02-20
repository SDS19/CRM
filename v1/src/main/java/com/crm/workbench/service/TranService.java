package com.crm.workbench.service;

import com.crm.exceptions.DaoException;
import com.crm.vo.Pagination;
import com.crm.workbench.domain.Tran;
import com.crm.workbench.domain.TranHistory;

import java.util.List;
import java.util.Map;

public interface TranService {

    void save(Tran tran) throws DaoException;

    Tran detail(String id);

    Pagination<Tran> tranList(Tran tran) throws DaoException;

    List<TranHistory> historyList(String tranId);

    void stage(Tran tran,TranHistory tranHistory) throws DaoException;

    int max();

    List<Map<String, String>> dataList();


}
