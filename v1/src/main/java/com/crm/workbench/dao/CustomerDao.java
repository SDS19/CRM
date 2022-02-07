package com.crm.workbench.dao;

import com.crm.workbench.domain.Customer;

import java.util.List;

public interface CustomerDao {
    Customer getCustomerByName(String name);
    int addCustomer(Customer customer);
    //auto complete the customer name
    List<String> getCustomerName(String name);
}
