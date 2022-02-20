package com.crm.workbench.service.impl;

import com.crm.workbench.dao.CustomerDao;
import com.crm.workbench.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao customerDao;

    @Override
    public List<String> autoComplete(String name) {
        return customerDao.selectName(name);
    }
}
