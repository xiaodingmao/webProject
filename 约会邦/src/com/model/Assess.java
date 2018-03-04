package com.model;

public class Assess {
	
	private int assessID;
	private int serviceID;
	private String serviceAssess;
	public void setAssessID(int assessID) {
		this.assessID = assessID;
	}
	public int getAssessID() {
		return assessID;
	}
	public void setServiceAssess(String serviceAssess) {
		this.serviceAssess = serviceAssess;
	}
	public String getServiceAssess() {
		return serviceAssess;
	}
	public void setServiceID(int serviceID) {
		this.serviceID = serviceID;
	}
	public int getServiceID() {
		return serviceID;
	}

}
