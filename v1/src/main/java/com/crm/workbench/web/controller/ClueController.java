package com.crm.workbench.web.controller;

import com.crm.exceptions.DaoException;
import com.crm.settings.domain.User;
import com.crm.utils.DateTimeUtil;
import com.crm.utils.UUIDUtil;
import com.crm.vo.Pagination;
import com.crm.workbench.domain.Activity;
import com.crm.workbench.domain.Clue;
import com.crm.workbench.domain.ClueRemark;
import com.crm.workbench.domain.Tran;
import com.crm.workbench.service.ActivityService;
import com.crm.workbench.service.ClueService;
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
@RequestMapping("/clue")
public class ClueController {

    @Autowired
    private ClueService clueService;
    @Autowired
    private ActivityService activityService;

    /* ========================================== clue controller ========================================== */

    @RequestMapping("/clues")
    @ResponseBody
    public Pagination<Clue> clueList(Integer pageNo, Integer pageSize, Clue clue){
        clue.setPageCount((pageNo-1)*pageSize);
        try {
            return clueService.pageList(clue);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save(HttpServletRequest request,Clue clue) {
        clue.setId(UUIDUtil.getUUID());
        clue.setCreateBy(((User)request.getSession(false).getAttribute("user")).getName());
        clue.setCreateTime(DateTimeUtil.getSysTime());
        try {
            clueService.save(clue);
            return "1";
        } catch (DaoException e) {
            e.printStackTrace();
            return "0";
        }
    }

    @RequestMapping("/edit")
    @ResponseBody
    public Map<String,Object> edit(String id){
        return clueService.edit(id);
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(HttpServletRequest request,Clue clue){
        clue.setEditTime(DateTimeUtil.getSysTime());
        clue.setEditBy(((User)request.getSession(false).getAttribute("user")).getName());
        try {
            clueService.update(clue);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(HttpServletRequest request) {
        String[] ids = request.getParameterValues("id");
        try {
            clueService.delete(ids);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @RequestMapping("/detail")
    public ModelAndView detail(String id) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("clue",clueService.detail(id));
        mv.setViewName("workbench/clue/detail");
        return mv;
    }

    /* ========================================== remark controller ========================================== */

    @RequestMapping("/remark")
    @ResponseBody
    public List<ClueRemark> remarkList(String clueId){
        return clueService.getRemarksByClueId(clueId);
    }

    @RequestMapping("/addRemark")
    @ResponseBody
    public Object addRemark(HttpServletRequest request, ClueRemark remark){
        remark.setId(UUIDUtil.getUUID());
        remark.setCreateTime(DateTimeUtil.getSysTime());
        remark.setCreateBy(((User) request.getSession(false).getAttribute("user")).getName());
        try {
            clueService.addRemark(remark);
            return remark;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping("/updateRemark")
    @ResponseBody
    public Object updateRemark(HttpServletRequest request, ClueRemark remark){
        remark.setEditTime(DateTimeUtil.getSysTime());
        remark.setEditBy(((User) request.getSession(false).getAttribute("user")).getName());
        try {
            clueService.updateRemark(remark);
            return remark;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping("/removeRemark")
    @ResponseBody
    public String removeRemark(String id){
        try {
            clueService.removeRemark(id);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    /* ========================================== activity controller ========================================== */

    @RequestMapping("/activity")
    @ResponseBody
    public List<Activity> activityList(String clueId){
        return activityService.getActivitiesByClueId(clueId);
    }

    @RequestMapping("/bind")
    @ResponseBody
    public String bind(String clueId,String[] activityId) {
        try {
            clueService.bind(clueId,activityId);
            return "1";
        } catch (DaoException e) {
            e.printStackTrace();
            return "0";
        }
    }

    @RequestMapping("/unbind")
    @ResponseBody
    public String unbind(String id){
        try {
            clueService.unbind(id);
            return "1";
        } catch (DaoException e) {
            e.printStackTrace();
            return "0";
        }
    }

    @RequestMapping("/search")
    @ResponseBody
    public List<Activity> getActivitiesForClue(String name, String clueId){
        HashMap<String,String> map = new HashMap<>();
        map.put("name",name);
        map.put("clueId",clueId);
        return activityService.getActivitiesForClue(map);
    }

    @RequestMapping("/transaction")
    @ResponseBody
    public List<Activity> getActivitiesForTran(String name){
        return activityService.getActivitiesForTran(name);
    }

    @RequestMapping("/convert")
    public String convertClue(HttpServletRequest request, String clueId, Tran tran) {
        tran.setCreateBy(((User)request.getSession(false).getAttribute("user")).getName());
        try {
            clueService.convert(clueId,tran);
            return "workbench/clue/index";
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }
}
