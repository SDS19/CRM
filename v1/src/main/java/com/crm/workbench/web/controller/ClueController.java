package com.crm.workbench.web.controller;

import com.crm.settings.domain.User;
import com.crm.settings.service.UserService;
import com.crm.utils.DateTimeUtil;
import com.crm.utils.UUIDUtil;
import com.crm.workbench.domain.Activity;
import com.crm.workbench.domain.Clue;
import com.crm.workbench.domain.Tran;
import com.crm.workbench.service.ActivityService;
import com.crm.workbench.service.ClueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/clue")
public class ClueController {
    @Autowired
    private UserService userService;
    @Autowired
    private ActivityService activityService;
    @Autowired
    private ClueService clueService;

    @RequestMapping("/add")
    @ResponseBody
    public List<User> add() {
        return userService.selectNames();
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(HttpServletRequest request,Clue clue) {
        clue.setId(UUIDUtil.getUUID());
        clue.setCreateBy(((User)request.getSession(false).getAttribute("user")).getName());
        clue.setCreateTime(DateTimeUtil.getSysTime());

        return clueService.save(clue)?"1":"0";
    }

    @RequestMapping("/detail")
    public ModelAndView detail(String id) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("clue",clueService.detail(id));
        mv.setViewName("workbench/clue/detail");
        return mv;
    }

    @RequestMapping("/activity")
    @ResponseBody
    public List<Activity> activityListByClueId(String clueId){
        return activityService.getActivitiesByClueId(clueId);
    }

    @RequestMapping("/unbind")
    @ResponseBody
    public String unbund(String id){
        return clueService.unbind(id)?"1":"0";
    }

    @RequestMapping("/search")
    @ResponseBody
    public List<Activity> activityListByNameAndClue(String name,String clueId){
        return activityService.getActivitiesByName(name,clueId);
    }
    @RequestMapping("/search_activity_modal")
    @ResponseBody
    public List<Activity> activityListByName(String name){
        return activityService.getActivitiesByName(name);
    }

    @RequestMapping("/bind")
    @ResponseBody
    public String bindActivies(HttpServletRequest request,String clueId) {
        String[] activityIds = request.getParameterValues("activityId");
        int count = clueService.bind(clueId,activityIds);
        return count==activityIds.length ? "1":"0";
    }

    @RequestMapping("/convert")
    public String convertClue(HttpServletRequest request, String clueId, Tran tran) {
        tran.setId(UUIDUtil.getUUID());
        String createBy = ((User)request.getSession(false).getAttribute("user")).getName();
        tran.setCreateBy(createBy);
        tran.setCreateTime(DateTimeUtil.getSysTime());

        boolean flag = clueService.convert(clueId,createBy,tran);

        if (flag) return "workbench/clue/index.jsp";
        return "";
    }
}
