package com.crm.settings.dao;

import com.crm.settings.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    User login(User user);
    List<User> selectNames();
    List<User> getUserList();//替换selectNames
}
