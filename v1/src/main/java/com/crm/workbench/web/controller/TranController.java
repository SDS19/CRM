package com.crm.workbench.web.controller;

import com.crm.exceptions.DaoException;
import com.crm.settings.domain.User;
import com.crm.settings.service.UserService;
import com.crm.utils.DateTimeUtil;
import com.crm.utils.UUIDUtil;
import com.crm.vo.Pagination;
import com.crm.workbench.domain.Tran;
import com.crm.workbench.domain.TranHistory;
import com.crm.workbench.domain.TranRemark;
import com.crm.workbench.service.CustomerService;
import com.crm.workbench.service.TranService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/transaction")
public class TranController {

    @Autowired
    private TranService tranService;
    @Autowired
    private UserService userService;
    @Autowired
    private CustomerService customerService;

    @RequestMapping("/trans")
    @ResponseBody
    public Pagination<Tran> transList(Tran tran) {
        try {
            return tranService.tranList(tran);
        } catch (DaoException e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping("/owner")
    public ModelAndView owner(){//get <option>owner</option> for <select> element of workbench/transaction/save.jsp
        ModelAndView mv = new ModelAndView();
        mv.addObject("uList",userService.getUserList());
        mv.setViewName("workbench/transaction/save");
        return mv;
    }

    @RequestMapping("/customer")
    @ResponseBody
    public List<String> customer(String name){
        return customerService.autoComplete(name);
    }

    @RequestMapping("/possibility")
    @ResponseBody
    public Map<String,String> possibility(HttpServletRequest request){
        ServletContext application = request.getServletContext();
        Map<String,String> s2pMap = (Map<String, String>) application.getAttribute("s2pMap");
        return s2pMap;
    }

    @RequestMapping("/save")
    public String save(HttpServletRequest request, Tran tran){
        tran.setId(UUIDUtil.getUUID());
        tran.setCreateBy(((User)request.getSession(false).getAttribute("user")).getName());
        tran.setCreateTime(DateTimeUtil.getSysTime());
        try {
            tranService.save(tran);
        } catch (DaoException e) {
            e.printStackTrace();
        } finally {
            return "workbench/transaction/index";
        }
    }

    @RequestMapping("/detail")
    public ModelAndView detail(HttpServletRequest request, String id){
        ModelAndView mv = new ModelAndView();
        Tran tran = tranService.detail(id);
        Map<String,String> map = (Map<String, String>) request.getServletContext().getAttribute("s2pMap");
        tran.setPossibility(map.get(tran.getStage().substring(0,2)));
        mv.addObject("tran",tran);
        mv.setViewName("workbench/transaction/detail");
        return mv;
    }

    @RequestMapping("/remark")
    @ResponseBody
    public List<TranRemark> remarkList(){

        return null;
    }

    @RequestMapping("/history")
    @ResponseBody
    public List<TranHistory> historyList(HttpServletRequest request, String tranId){
        List<TranHistory> list = tranService.historyList(tranId);
        Map<String,String> map = (Map<String, String>) request.getServletContext().getAttribute("s2pMap");
        for (TranHistory history:list) {
            history.setPossibility(map.get(history.getStage().substring(0,2)));
        }
        return list;
    }

    @RequestMapping("/stage")
    @ResponseBody
    public Tran stage(HttpServletRequest request,Tran tran,TranHistory tranHistory) {
        Map<String,String> s2pMap = (Map<String, String>) request.getServletContext().getAttribute("s2pMap");
        tran.setPossibility(s2pMap.get(tran.getStage().substring(0,2)));
        tran.setEditBy(((User)request.getSession(false).getAttribute("user")).getName());
        tran.setEditTime(DateTimeUtil.getSysTime());

        tranHistory.setId(UUIDUtil.getUUID());
        tranHistory.setCreateBy(tran.getEditBy());
        tranHistory.setCreateTime(tran.getEditTime());
        tranHistory.setTranId(tran.getId());
        try {
            tranService.stage(tran,tranHistory);
            return tran;
        } catch (DaoException e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping("/chart")
    @ResponseBody
    public Map<String,Object> charts() {
        int max = tranService.max();
        List<Map<String,String>> dataList = tranService.dataList();
        Map<String,Object> map = new HashMap<>();
        map.put("max",max);
        map.put("dataList",dataList);
        return map;
    }
}
