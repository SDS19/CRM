package com.crm.workbench.web.controller;

import com.crm.settings.domain.User;
import com.crm.settings.service.UserService;
import com.crm.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/activityRemark")
public class ActivityRemarkController {
    @Autowired
    private UserService userServicee;

    @RequestMapping("/login")
    @ResponseBody
    public List<String> login(HttpServletRequest request, HttpServletResponse response, String loginAct, String loginPwd) {
        loginPwd = MD5Util.getMD5(loginPwd);
        String ip = request.getRemoteAddr();

        List<String> list = new ArrayList<>();
        try {
            //User user = userServicee.login(loginAct,loginPwd,ip);
            //request.getSession(true).setAttribute("user",user);
            list.add("1");
        }catch (Exception e){
            list.add("0");
            list.add(e.getMessage());
        }

        return list;
    }

}
