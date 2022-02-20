package com.crm.workbench.dao;

import com.crm.workbench.domain.Customer;

import java.util.List;

public interface CustomerDao {

    Customer select(String name);

    int insert(Customer customer);

    List<String> selectName(String name);
}
