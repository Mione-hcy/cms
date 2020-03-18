package com.model;

public class User {
    private Integer id;
 
    private String name;
 
    private String passWord;
    
    private Integer level;
    
    private String mcg;
    
    private String account;
    
    public String getMcg() {
		return mcg;
	}
    public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public void setMcg(String mcg) {
		this.mcg = mcg;
	}
    
    public Integer getLevel() {
		return level;
	}
    public void setLevel(Integer level) {
		this.level = level;
	}
    
 
    public Integer getId() {
        return id;
    }
 
    public void setId(Integer id) {
        this.id = id;
    }
 
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
 
    public String getPassWord() {
        return passWord;
    }
 
    public void setPassWord(String passWord) {
        this.passWord = passWord == null ? null : passWord.trim();
    }
}