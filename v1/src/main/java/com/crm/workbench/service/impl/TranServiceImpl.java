package com.crm.workbench.service.impl;

import com.crm.utils.UUIDUtil;
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

@Transactional
@Service
public class TranServiceImpl implements TranService {
    @Autowired
    private TranDao tranDao;
    @Autowired
    private TranHistoryDao tranHistoryDao;
    @Autowired
    private CustomerDao customerDao;

    @Override
    public boolean add(Tran tran, String customerName) {
        int count = 0;

        //if customerName exists or not (if not, create one)
        Customer customer = customerDao.getCustomerByName(customerName);
        if (customer==null) {
            customer = new Customer();
            customer.setId(UUIDUtil.getUUID());
            customer.setOwner(tran.getOwner());
            customer.setName(customerName);
            customer.setCreateBy(tran.getCreateBy());
            customer.setCreateTime(tran.getCreateTime());
            customer.setContactSummary(tran.getContactSummary());
            customer.setNextContactTime(tran.getNextContactTime());
            customer.setDescription(tran.getDescription());
            count += customerDao.addCustomer(customer);
        }

        //create transaction and its history
        tran.setCustomerId(customer.getId());
        count += tranDao.add(tran);
        TranHistory tranHistory = new TranHistory();
        tranHistory.setId(UUIDUtil.getUUID());
        tranHistory.setStage(tran.getStage());
        tranHistory.setMoney(tran.getMoney());
        tranHistory.setExpectedDate(tran.getExpectedDate());
        tranHistory.setCreateTime(tran.getCreateTime());
        tranHistory.setCreateBy(tran.getCreateBy());
        tranHistory.setTranId(tran.getId());
        count += tranHistoryDao.add(tranHistory);

        return count==3;
    }

    @Override
    public Tran detail(String id) {
        return tranDao.getTranById(id);
    }

    @Override
    public List<TranHistory> getTranHistoryByTranId(String tranId) {
        return tranHistoryDao.getTranHistoryByTranId(tranId);
    }

    @Override
    public boolean changeStage(Tran tran) {
        int count = 0;
        //change transaction stage
        count += tranDao.changeStage(tran);
        //log transaction history
        TranHistory tranHistory = new TranHistory();
        tranHistory.setId(UUIDUtil.getUUID());
        tranHistory.setStage(tran.getStage());
        tranHistory.setMoney(tran.getMoney());
        tranHistory.setExpectedDate(tran.getExpectedDate());
        tranHistory.setCreateTime(tran.getCreateTime());
        tranHistory.setCreateBy(tran.getCreateBy());
        tranHistory.setTranId(tran.getId());
        count += tranHistoryDao.add(tranHistory);
        return count==2;
    }

    //charts
    @Override
    public int total() {
        return tranDao.total();
    }
    @Override
    public List<Map<String, Object>> dataList() {
        return tranDao.dataList();
    }
}
