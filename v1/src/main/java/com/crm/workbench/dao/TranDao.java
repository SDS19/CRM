package com.crm.workbench.dao;

import com.crm.workbench.domain.Tran;

import java.util.List;
import java.util.Map;

public interface TranDao {
    int add(Tran tran);
    Tran getTranById(String id);
    int changeStage(Tran tran);

    int total();//get total number of transactions
    List<Map<String, Object>> dataList();//get value(number):name(stage) list of transactions
}
