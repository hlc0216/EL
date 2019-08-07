package com.hlc.ov;

public class User {
private	String name;
private String pwd;
private Address add;
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}
public Address getAdd() {
	return add;
}
public void setAdd(Address add) {
	this.add = add;
}
public User(String name, String pwd, Address add) {
	super();
	this.name = name;
	this.pwd = pwd;
	this.add = add;
}

	
}
