package com.model;

import java.sql.Date;

public class Customer {
	
    private Integer id;
    //电话
    private String phone;
    //姓名
    private String customerName;
    //销售人员
    private String salesMan;
    //销售人名
    private String salesManName;
    //车型
    private String carType;
    //车型
    private String carSystem;
    //意向等级
    private String intentionLevel;
    //预计购车时间
    private Date buyDate;
    //客户来源
    private String userSource;
    //沟通状态
    private String state;
    //备注
    private String remark;
    //登录时间
    private String price;
    //登录时间
    private String gender;
    
    private String userId;
    //登录时间
    private User user;
    //登录时间
    private Date insertDate;
    private Date updateDate;
    
    private Integer invitationState;
    
    
    private Integer priorityLevel;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCustomerName() {
		return customerName;
	} 
	
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getSalesMan() {
		return salesMan;
	}
	public void setSalesMan(String salesMan) {
		this.salesMan = salesMan;
	}
	public String getSalesManName() {
		return salesManName;
	}
	public void setSalesManName(String salesManName) {
		this.salesManName = salesManName;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
	}
	public String getCarSystem() {
		return carSystem;
	}
	public void setCarSystem(String carSystem) {
		this.carSystem = carSystem;
	}
	public String getIntentionLevel() {
		return intentionLevel;
	}
	public void setIntentionLevel(String intentionLevel) {
		this.intentionLevel = intentionLevel;
	}
	public Date getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}
	public String getUserSource() {
		return userSource;
	}
	public void setUserSource(String userSource) {
		this.userSource = userSource;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
    
    public Date getUpdateDate() {
		return updateDate;
	}
    public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Integer getPriorityLevel() {
		return priorityLevel;
	}
	public void setPriorityLevel(Integer priorityLevel) {
		this.priorityLevel = priorityLevel;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	
	public void setInvitationState(Integer invitationState) {
		this.invitationState = invitationState;
	}
	
	public Integer getInvitationState() {
		return invitationState;
	}
}