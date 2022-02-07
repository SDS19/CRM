package com.crm.workbench.service.impl;

import com.crm.exceptions.DaoException;
import com.crm.settings.dao.UserDao;
import com.crm.settings.domain.User;
import com.crm.vo.Pagination;
import com.crm.workbench.dao.ActivityDao;
import com.crm.workbench.dao.ActivityRemarkDao;
import com.crm.workbench.domain.Activity;
import com.crm.workbench.domain.ActivityRemark;
import com.crm.workbench.service.ActivityService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("activityService")
public class ActivityServiceImpl implements ActivityService {
    @Autowired
    private ActivityDao activityDao;
    @Autowired
    private ActivityRemarkDao activityRemarkDao;
    @Autowired
    private UserDao userDao;

    @Override
    public boolean saveActivity(Activity activity) throws DaoException{
        int count = activityDao.insertActivity(activity);
        if (count!=1) throw new DaoException("Create activity failed!");
        return  count==1 ? true : false;
    }

    @Override
    public Pagination<Activity> pageList(Activity activity) {
        Pagination<Activity> page = new Pagination<>();
        page.setTotal(activityDao.total());
        page.setDataList(activityDao.activityList(activity));
        return page;
    }

    @Override
    public boolean deleteActivities(String[] ids) {
        int remarksCount = activityRemarkDao.getRemarksCount(ids);
        System.out.println("remarksCount: "+remarksCount);

        int deletedCount = activityRemarkDao.deleteRemarks(ids);
        System.out.println("deletedCount: "+deletedCount);

        if (remarksCount!=deletedCount) return false;

        int activitiesCount = activityDao.deleteActivities(ids);
        System.out.println("activitiesCount: "+activitiesCount);

        if (activitiesCount!=ids.length) return false;

        return true;
    }

    @Override
    public Map<String, Object> getActivityUserList(String id) {
        List<User> list = userDao.selectNames();
        Activity activity = activityDao.editActivity(id);
        Map<String,Object> map = new HashMap<>();
        map.put("list",list);
        map.put("activity",activity);
        return map;
    }

    @Override
    public boolean updateActivity(Activity activity) {
        int count = activityDao.updateActivity(activity);
        return count==1;
    }

    @Override
    public Activity selectActivity(String id) {
        return activityDao.selectActivity(id);
    }

    @Override
    public List<ActivityRemark> remarks(String activityId) {
        return activityRemarkDao.selectRemarks(activityId);
    }

    @Override
    public boolean removeRemark(String id) {
        int count = activityRemarkDao.removeRemark(id);
        return count==1;
    }

    @Override
    public int addRemark(ActivityRemark remark) {
        return activityRemarkDao.insertRemark(remark);
    }

    @Override
    public int updateRemark(ActivityRemark remark) {
        return activityRemarkDao.updateRemark(remark);
    }

    @Override
    public List<Activity> getActivitiesByClueId(String clueId) {
        return activityDao.getActivitiesByClueId(clueId);
    }

    @Override
    public List<Activity> getActivitiesByName(String name, String clueId) {
        return activityDao.getActivitiesByName(name, clueId);
    }

    @Override
    public List<Activity> getActivitiesByName(String name) {
        return activityDao.getActivitiesByName1(name);
    }
}
