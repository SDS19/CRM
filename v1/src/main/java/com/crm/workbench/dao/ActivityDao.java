package com.crm.workbench.dao;

import com.crm.workbench.domain.Activity;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ActivityDao {
    int insertActivity(Activity activity);

    int total();

    List<Activity> activityList(Activity activity);

    int deleteActivities(String[] ids);

    Activity editActivity(String id);

    int updateActivity(Activity activity);

    Activity selectActivity(String id);

    List<Activity> getActivitiesByClueId(String clueId);

    List<Activity> getActivitiesByName(@Param("name") String name,@Param("clueId") String clueId);
    List<Activity> getActivitiesByName1(String name);
}
