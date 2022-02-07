package com.crm.workbench.web.controller;

import com.crm.settings.domain.User;
import com.crm.utils.DateTimeUtil;
import com.crm.utils.UUIDUtil;
import com.crm.vo.Pagination;
import com.crm.workbench.domain.Activity;
import com.crm.workbench.domain.ActivityRemark;
import com.crm.workbench.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/activity")
public class ActivityController {
    @Autowired
    private ActivityService activityService;

    @RequestMapping("/save")
    @ResponseBody
    public String save(HttpServletRequest request, Activity activity){
        activity.setId(UUIDUtil.getUUID());
        activity.setCreateTime(DateTimeUtil.getSysTime());
        activity.setCreateBy(((User)request.getSession(false).getAttribute("user")).getName());
        try {
            return activityService.saveActivity(activity) ? "1":"0";
        } catch (Exception e) {
            return "0";
        }
    }

    @RequestMapping("/list")
    @ResponseBody
    public Pagination<Activity> activityList(Integer pageNo, Integer pageSize, Activity activity){
        activity.setPageCount((pageNo-1)*pageSize);
        activity.setPageSize(pageSize);
        Pagination<Activity> page = activityService.pageList(activity);
        return page;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(HttpServletRequest request) {
        String[] ids = request.getParameterValues("id");
        boolean success = activityService.deleteActivities(ids);
        return success ? "1" : "0";
    }

    @RequestMapping("/edit")
    @ResponseBody
    public Map<String,Object> edit(String id){
        return activityService.getActivityUserList(id);
    }
    @RequestMapping("/update")
    @ResponseBody
    public String update(HttpServletRequest request,Activity activity){
        System.out.println("=========="+activity.getOwner());
        activity.setEditTime(DateTimeUtil.getSysTime());
        activity.setEditBy(((User)request.getSession(false).getAttribute("user")).getName());
        boolean success = activityService.updateActivity(activity);
        return success ? "1" : "0";
    }

    @RequestMapping("/detail")
    public ModelAndView detail(String id) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("activity",activityService.selectActivity(id));
        mv.setViewName("workbench/activity/detail");
        return mv;
    }

    @RequestMapping("/remark")
    @ResponseBody
    public List<ActivityRemark> remarkList(String activityId){
        return activityService.remarks(activityId);
    }

    @RequestMapping("/removeRemark")
    @ResponseBody
    public String removeRemark(String id){
        boolean success = activityService.removeRemark(id);
        return success ? "1" : "0";
    }

    @RequestMapping("/addRemark")
    @ResponseBody
    public Map<String,Object> addRemark(HttpServletRequest request, String noteContent, String activityId){
        ActivityRemark remark = new ActivityRemark();
        remark.setId(UUIDUtil.getUUID());
        remark.setNoteContent(noteContent);
        remark.setCreateTime(DateTimeUtil.getSysTime());
        remark.setCreateBy(((User) request.getSession(false).getAttribute("user")).getName());
        remark.setEditFlag("0");
        remark.setActivityId(activityId);

        Map<String,Object> map = new HashMap<>();
        map.put("success",activityService.addRemark(remark));
        map.put("remark",remark);
        return map;
    }

    @RequestMapping("/updateRemark")
    @ResponseBody
    public Map<String,Object> updateRemark(HttpServletRequest request, String id, String noteContent){
        ActivityRemark remark = new ActivityRemark();
        remark.setId(id);
        remark.setNoteContent(noteContent);
        remark.setEditTime(DateTimeUtil.getSysTime());
        remark.setEditBy(((User) request.getSession(false).getAttribute("user")).getName());

        Map<String,Object> map = new HashMap<>();
        map.put("success", activityService.updateRemark(remark)==1 ? "1":"0");
        map.put("remark",remark);

        return map;
    }
}
