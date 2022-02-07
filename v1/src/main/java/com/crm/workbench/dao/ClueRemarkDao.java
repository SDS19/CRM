package com.crm.workbench.dao;

import com.crm.workbench.domain.ClueRemark;

import java.util.List;

public interface ClueRemarkDao {

    List<ClueRemark> getRemarksByclueId(String clueId);

    int delete(ClueRemark clueRemark);
}
