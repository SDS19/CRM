package com.crm.workbench.web.controller;

import com.crm.settings.domain.User;
import com.crm.settings.service.UserService;
import com.crm.utils.DateTimeUtil;
import com.crm.utils.UUIDUtil;
import com.crm.vo.Pagination;
import com.crm.workbench.domain.Tran;
import com.crm.workbench.domain.TranHistory;
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

    @RequestMapping("/getOwner")
    public ModelAndView getOwner(){//get <option>owner</option> for <select> element of workbench/transaction/save.jsp
        ModelAndView mv = new ModelAndView();
        mv.addObject("uList",userService.getUserList());
        mv.setViewName("workbench/transaction/save");
        return mv;
    }

    @RequestMapping("/getCustomerName")
    @ResponseBody
    public List<String> getCustomerName(String name){
        return customerService.getCustomerName(name);
    }

    @RequestMapping("/getPossibility")
    @ResponseBody
    public Map<String,String> getPossibility(HttpServletRequest request){
        ServletContext application = request.getServletContext();
        Map<String,String> s2pMap = (Map<String, String>) application.getAttribute("s2pMap");
        return s2pMap;
    }

    @RequestMapping("/save")
    public String save(HttpServletRequest request, Tran tran){
        tran.setId(UUIDUtil.getUUID());
        tran.setCreateBy(((User)request.getSession(false).getAttribute("user")).getName());
        tran.setCreateTime(DateTimeUtil.getSysTime());
        //customerName -> customerId
        String customerName = request.getParameter("customerName");
        boolean flag = tranService.add(tran,customerName);
        if (flag) return "workbench/transaction/index";
        else return null;
    }

    @RequestMapping("/detail")
    public ModelAndView detail(HttpServletRequest request, String id){
        ModelAndView mv = new ModelAndView();
        Tran tran = tranService.detail(id);
        Map<String,String> map = (Map<String, String>) request.getServletContext().getAttribute("s2pMap");
        tran.setPossibility(map.get(tran.getStage()));
        mv.addObject("tran",tran);
        mv.setViewName("workbench/transaction/detail");
        return mv;
    }

    @RequestMapping("/getTranHistory")
    @ResponseBody
    public List<TranHistory> getTranHistoryByTranId(HttpServletRequest request, String tranId){
        List<TranHistory> list = tranService.getTranHistoryByTranId(tranId);
        Map<String,String> map = (Map<String, String>) request.getServletContext().getAttribute("s2pMap");
        for (TranHistory history:list) {
            history.setPossibility(map.get(history.getStage()));
        }
        return list;
    }

    @RequestMapping("/changeStage")
    @ResponseBody
    public Map<String,Object> changeStage(HttpServletRequest request,Tran tran) {
        Map<String,String> s2pMap = (Map<String, String>) request.getServletContext().getAttribute("s2pMap");
        tran.setPossibility(s2pMap.get(tran.getStage()));
        tran.setEditBy(((User)request.getSession(false).getAttribute("user")).getName());
        tran.setEditTime(DateTimeUtil.getSysTime());
        Map<String,Object> map = new HashMap<>();
        map.put("tran",tran);
        map.put("success",tranService.changeStage(tran)?"1":"0");
        return map;
    }

    @RequestMapping("/charts")
    @ResponseBody
    public Map<String,Object> charts() {
        int total = tranService.total();
        List<Map<String,Object>> dataList = tranService.dataList();
        Map<String,Object> map = new HashMap<>();
        map.put("total",total);
        map.put("dataList",dataList);
        return map;
    } //data.total | data.dataList
}
