package com.model;

public class Order {
	private int orderID;
	private int serviceID;
	private String userID;
	private int payState;
	private String orderTime;
	private String serviceTime;
	private String remark;
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public int getOrderID() {
		return orderID;
	}
	public void setServiceID(int serviceID) {
		this.serviceID = serviceID;
	}
	public int getServiceID() {
		return serviceID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserID() {
		return userID;
	}
	public void setPayState(int payState) {
		this.payState = payState;
	}
	public int getPayState() {
		return payState;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setServiceTime(String serviceTime) {
		this.serviceTime = serviceTime;
	}
	public String getServiceTime() {
		return serviceTime;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getRemark() {
		return remark;
	}

}
