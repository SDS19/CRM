package com.crm.workbench.service;

import java.util.List;

public interface CustomerService {
    //auto complete the customer name
    List<String> getCustomerName(String name);
}
