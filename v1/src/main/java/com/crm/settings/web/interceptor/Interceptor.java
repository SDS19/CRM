package com.crm.settings.web.interceptor;

import com.crm.settings.domain.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Interceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if ("/login.jsp".equals(request.getServletPath())||"/user/login".equals(request.getServletPath())) return true;
        else {
            User user = (User) request.getSession(false).getAttribute("user");
            if (user!=null) return true;
            else {
                response.sendRedirect(request.getContextPath()+"/login.jsp");
                return false;
            }
        }
    }
}
