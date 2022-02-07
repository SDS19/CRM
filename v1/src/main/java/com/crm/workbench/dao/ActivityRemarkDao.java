package com.crm.workbench.dao;

import com.crm.workbench.domain.ActivityRemark;

import java.util.List;

public interface ActivityRemarkDao {
    int getRemarksCount(String[] ids);
    int deleteRemarks(String[] ids);
    List<ActivityRemark> selectRemarks(String activityId);
    int removeRemark(String id);
    int insertRemark(ActivityRemark remark);
    int updateRemark(ActivityRemark remark);
}
