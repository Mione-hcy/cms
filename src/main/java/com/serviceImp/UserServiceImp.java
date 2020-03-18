package com.serviceImp;



import java.util.List;

import javax.annotation.Resource;



import org.springframework.stereotype.Service;


import com.dao.UserMapper;

import com.model.User;

import com.service.UserService;



@Service("userService")
public class UserServiceImp implements UserService {

   @Resource
   private UserMapper userMapper;

   public User getUserById(int id) {

       // TODO Auto-generated method stub

       return userMapper.selectByPrimaryKey(id);

   }


	public User selectByLogin(User user) {
		// TODO Auto-generated method stub
		return userMapper.selectByLogin(user);
	}


	@Override
	public List<User> selectUserAllLevel() {
		// TODO Auto-generated method stub
		return userMapper.selectUserAllLevel();
	}


	@Override
	public User selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(id);
	}


}