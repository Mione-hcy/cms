package com.dao;

import java.util.List;

import com.model.User;
 
     ////
public interface UserMapper {
    User selectByPrimaryKey(Integer id);
    
    User selectByLogin(User user);
    
    List<User> selectUserAllLevel();
}