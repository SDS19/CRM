package com.crm.workbench.service;

import com.crm.workbench.domain.Tran;
import com.crm.workbench.domain.TranHistory;

import java.util.List;
import java.util.Map;

public interface TranService {
    boolean add(Tran tran, String customerName);
    Tran detail(String id);

    List<TranHistory> getTranHistoryByTranId(String tranId);

    boolean changeStage(Tran tran);

    int total();

    List<Map<String, Object>> dataList();
}
