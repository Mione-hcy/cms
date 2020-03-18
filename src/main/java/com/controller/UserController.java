package com.controller;

import java.util.List;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.model.Customer;
import com.model.User;
import com.service.CustomerService;
import com.service.UserService;

@Controller

@RequestMapping("/user")
public class UserController {

	@Resource
	private UserService userService;

	@Resource
	private CustomerService customerService;

	@RequestMapping("/index")
	public String showUser(HttpServletRequest request) {

		return "index";

	}

	@RequestMapping("/login")
	public String login(User user, HttpServletRequest request, HttpSession session) {
		// selectByPrimaryKey
		User userSession = (User) session.getAttribute("user");
		if (user == null) {
			user = userSession;
		}

		user = userService.selectByLogin(user);
		if (user != null && user.getId() > 0) {
			request.setAttribute("userinfo", user);
			Customer customerinfo = new Customer();
			customerinfo.setUser(user);
			List<Customer> customer = customerService.selectCustomerAll(customerinfo);
			request.setAttribute("customerList", customer);
			request.setAttribute("userList",userService.selectUserAllLevel());

			request.getSession().setAttribute("user", user);
			return "customerList";
		} else {
			user = new User();
			user.setMcg("ÃÜÂë»òÕËºÅ´íÎó ÇëÖØĞÂµÇÂ¼");
			request.setAttribute("msg", "ÃÜÂë»òÕËºÅ´íÎó ÇëÖØĞÂµÇÂ¼");
			return "index";
		}

	}

}