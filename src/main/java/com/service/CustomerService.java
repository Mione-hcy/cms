package com.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.model.Customer;
import com.model.User;

public interface CustomerService {

    public Customer getCustomerInfo(Customer customer);

	public void insertCustomerInfo(Customer customer);

	public List<Customer> selectCustomerAll(Customer customer);
	
	public Customer selectCustomerListById(int id);
	
	public void updateCustomerInfo(Customer customer);
	
	public List<Customer> selectCustomerLogListById(int id);
	
	public void insertCustomerLog(Customer customer);
	
	public int selectByPhoneCount(Customer customer);
	
	public int selectMaxId();
	
}