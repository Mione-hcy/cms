package com.serviceImp;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dao.UserMapper;
import com.model.User;

public class MapperTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间

	}

}
