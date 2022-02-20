package com.crm.settings.service.impl;

import com.crm.exceptions.LoginException;
import com.crm.settings.dao.UserDao;
import com.crm.settings.domain.User;
import com.crm.settings.service.UserService;
import com.crm.utils.DateTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User login(User user) throws LoginException {
        User result = userDao.login(user);
        if (result==null) throw new LoginException("Account or password wrong!");
        //expireTime
        if (DateTimeUtil.expire(result.getExpireTime())) throw new LoginException("Account expire!");
        //lockState
        if ("0".equals(result.getLockState())) throw new LoginException("Account is locked!");
        //allowed IPs
        String ip = result.getAllowIps();
        if (ip!=null && ip!="") if (!result.getAllowIps().contains(user.getAllowIps())) throw new LoginException("This IP is restricted to login!");
        return result;
    }

    @Override
    public List<User> getUserList() {
        return userDao.getUserList();
    }
}
