package com.dao;

import java.util.List;

import com.model.Customer;
import com.model.User;
 
public interface CustomerMapper {
     ////
    public Customer selectCustomerList(Customer customer);

	public void insertCustomerInfo(Customer customer);
	
	public List<Customer> selectCustomerAll(Customer customer);
	
	public Customer selectCustomerListById(int id);
	
	public void updateCustomerInfo(Customer customer);
	
	public List<Customer> selectCustomerLogListById(int id);
	
	public void insertCustomerLog(Customer customer);

	public int selectByPhoneCount(Customer customer);

	public int selectMaxId();
	
}