package com.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.model.User;

public interface UserService {

    public User getUserById(int id);

	public User selectByLogin(User user);

	public List<User> selectUserAllLevel();

	public User selectByPrimaryKey(Integer id);
}