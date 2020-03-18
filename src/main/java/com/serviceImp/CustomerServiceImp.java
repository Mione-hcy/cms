package com.serviceImp;



import java.util.List;

import javax.annotation.Resource;



import org.springframework.stereotype.Service;

import com.dao.CustomerMapper;
import com.dao.UserMapper;
import com.model.Customer;
import com.model.User;
import com.service.CustomerService;
import com.service.UserService;



@Service("customerService")
public class CustomerServiceImp implements CustomerService {

   @Resource
   private CustomerMapper customerMapper;

@Override
public Customer getCustomerInfo(Customer customer) {
	// TODO Auto-generated method stub
	return customerMapper.selectCustomerList(customer);
}

@Override
public void insertCustomerInfo(Customer customer) {
	// TODO Auto-generated method stub
	System.out.println(customer.getCustomerName());
	customerMapper.insertCustomerInfo(customer);
}

@Override
public List<Customer> selectCustomerAll(Customer customer) {
	// TODO Auto-generated method stub
	return customerMapper.selectCustomerAll(customer);
}

@Override
public Customer selectCustomerListById(int id) {
	// TODO Auto-generated method stub
	return customerMapper.selectCustomerListById( id);
}

@Override
public void updateCustomerInfo(Customer customer) {
	// TODO Auto-generated method stub
	customerMapper.updateCustomerInfo(customer);
}

@Override
public List<Customer> selectCustomerLogListById(int id) {
	// TODO Auto-generated method stub
	return customerMapper.selectCustomerLogListById(id);
}

public void insertCustomerLog(Customer customer){
	customerMapper.insertCustomerLog(customer);
}

@Override
public int selectByPhoneCount(Customer customer) {
	// TODO Auto-generated method stub
	return customerMapper.selectByPhoneCount(customer);
}

@Override
public int selectMaxId() {
	// TODO Auto-generated method stub
	return customerMapper.selectMaxId();
}


}