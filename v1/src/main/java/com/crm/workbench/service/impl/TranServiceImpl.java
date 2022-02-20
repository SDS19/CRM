package com.crm.workbench.service.impl;

import com.crm.exceptions.DaoException;
import com.crm.utils.Convert;
import com.crm.utils.UUIDUtil;
import com.crm.vo.Pagination;
import com.crm.workbench.dao.CustomerDao;
import com.crm.workbench.dao.TranDao;
import com.crm.workbench.dao.TranHistoryDao;
import com.crm.workbench.domain.Customer;
import com.crm.workbench.domain.Tran;
import com.crm.workbench.domain.TranHistory;
import com.crm.workbench.service.TranService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class TranServiceImpl implements TranService {

    @Autowired
    private CustomerDao customerDao;

    @Autowired
    private TranDao tranDao;
    @Autowired
    private TranHistoryDao tranHistoryDao;

    @Override
    public Pagination<Tran> tranList(Tran tran) throws DaoException {
        int total = tranDao.total(tran);
        List<Tran> list = tranDao.tranList(tran);
        if (total<=3 && list.size()!=total) throw new DaoException("Trans query failed!");
        return new Pagination<>(total,list);
    }

    @Override
    public void save(Tran tran) throws DaoException {
        //if customerName does not exist, create one
        Customer customer = null;
        if (customerDao.select(tran.getCustomerId())==null) {
            try {
                customer = (Customer) Convert.o2o(tran,new Customer());
                customer.setId(UUIDUtil.getUUID());
                customer.setName(tran.getCustomerId());
                if (customerDao.insert(customer)!=1) throw new DaoException("Create customer failed!");
            } catch (ClassNotFoundException|IllegalAccessException|InstantiationException|NoSuchFieldException e) {
                e.printStackTrace();
            }
        }

        //create transaction
        tran.setCustomerId(customer.getId());
        if (tranDao.insert(tran)!=1) throw new DaoException("Create transaction failed!");

        //create transaction history
        try {
            TranHistory tranHistory = (TranHistory) Convert.o2o(tran,new TranHistory());
            tranHistory.setId(UUIDUtil.getUUID());
            tranHistory.setTranId(tran.getId());
            if (tranHistoryDao.insert(tranHistory)!=1) throw new DaoException("Create transaction history failed!");
        } catch (ClassNotFoundException|IllegalAccessException|InstantiationException|NoSuchFieldException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Tran detail(String id) {
        return tranDao.select(id);
    }

    @Override
    public List<TranHistory> historyList(String tranId) {
        return tranHistoryDao.select(tranId);
    }

    @Transactional
    @Override
    public void stage(Tran tran,TranHistory tranHistory) throws DaoException {
        if (tranDao.update(tran)!=1) throw new DaoException("Change stage failed!");
        if (tranHistoryDao.insert(tranHistory)!=1) throw new DaoException("Create transaction stage history failed!");
    }

    //ECharts data
    @Override
    public int max() {
        return tranDao.max();
    }

    @Override
    public List<Map<String, String>> dataList() {
        return tranDao.dataList();
    }
}
