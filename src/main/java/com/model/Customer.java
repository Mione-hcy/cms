package com.model;

import java.sql.Date;

public class Customer {
	
    private Integer id;
    //�绰
    private String phone;
    //����
    private String customerName;
    //������Ա
    private String salesMan;
    //��������
    private String salesManName;
    //����
    private String carType;
    //����
    private String carSystem;
    //����ȼ�
    private String intentionLevel;
    //Ԥ�ƹ���ʱ��
    private Date buyDate;
    //�ͻ���Դ
    private String userSource;
    //��ͨ״̬
    private String state;
    //��ע
    private String remark;
    //��¼ʱ��
    private String price;
    //��¼ʱ��
    private String gender;
    
    private String userId;
    //��¼ʱ��
    private User user;
    //��¼ʱ��
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