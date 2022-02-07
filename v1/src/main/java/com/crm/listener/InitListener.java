package com.crm.listener;

import com.crm.settings.domain.DicValue;
import com.crm.settings.service.DicService;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.*;

public class InitListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext application = servletContextEvent.getServletContext();
        //load data dictionary into ServletContext
        WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(servletContextEvent.getServletContext());
        DicService dicService = (DicService) wac.getBean("dicService");
        Map<String, List<DicValue>> map = dicService.getDicValues();
        Set<String> set = map.keySet();
        for (String key:set) {
            application.setAttribute(key,map.get(key));
        }
        //parse and load stage2possibility.properties into ServletContext
        Map<String,String> s2pMap = new HashMap<>();
        ResourceBundle resourceBundle = ResourceBundle.getBundle("Stage2Possibility");
        Enumeration<String> stages = resourceBundle.getKeys();
        while (stages.hasMoreElements()) {
            String key = stages.nextElement();
            String value = resourceBundle.getString(key);
            s2pMap.put(key,value);
        }
        application.setAttribute("s2pMap",s2pMap);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
