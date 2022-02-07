package com.crm.workbench.service;

import com.crm.exceptions.DaoException;
import com.crm.vo.Pagination;
import com.crm.workbench.domain.Activity;
import com.crm.workbench.domain.ActivityRemark;

import java.util.List;
import java.util.Map;

public interface ActivityService {
    boolean saveActivity(Activity activity) throws DaoException;

    Pagination<Activity> pageList(Activity activity);

    boolean deleteActivities(String[] ids);
    Map<String,Object> getActivityUserList(String id);
    boolean updateActivity(Activity activity);
    Activity selectActivity(String id);
    List<ActivityRemark> remarks(String activityId);
    boolean removeRemark(String id);
    int addRemark(ActivityRemark remark);
    int updateRemark(ActivityRemark remark);
    List<Activity> getActivitiesByClueId(String clueId);
    List<Activity> getActivitiesByName(String name,String clueId);
    List<Activity> getActivitiesByName(String name);
}
