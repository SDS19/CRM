package com.crm.settings.web.controller;

import com.crm.settings.domain.User;
import com.crm.settings.service.UserService;
import com.crm.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    @ResponseBody
    public Map<String,String> login(HttpServletRequest request, User user) {
        //User object contains loginAct, loginPwd, ip
        user.setLoginPwd(MD5Util.getMD5(user.getLoginPwd()));//MD5 encrypted
        user.setAllowIps(request.getRemoteAddr());

        Map<String,String> map = new HashMap<>();
        try {
            request.getSession(true).setAttribute("user",userService.login(user));
            map.put("success","1");
        }catch (Exception e){
            map.put("success","0");
            map.put("msg",e.getMessage());
        }
        return map;
    }

    @RequestMapping("/getOwner")
    @ResponseBody
    public List<User> getOwner() {
        return userService.getUserList();
    }

    @RequestMapping("/signout")
    @ResponseBody
    public String signout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        session.removeAttribute("user");
        return session.getAttribute("user")==null ? "1":"0";
    }

}
