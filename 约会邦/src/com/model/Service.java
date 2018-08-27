package com.model;

public class Service {
	private int serviceID;
	private String serviceName;
	private String serviceIntroduce;
	private double servicePrice;
	private int saleVolume;
	private String timeRange;
	private String placeRange;
	private int assessNumber;
	private int serviceState;
	private String servicePic;
	public void setServiceID(int serviceID) {
		this.serviceID = serviceID;
	}
	public int getServiceID() {
		return serviceID;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceIntroduce(String serviceIntroduce) {
		this.serviceIntroduce = serviceIntroduce;
	}
	public String getServiceIntroduce() {
		return serviceIntroduce;
	}
	
	public double getServicePrice() {
		return servicePrice;
	}
	public void setServicePrice(double servicePrice) {
		this.servicePrice = servicePrice;
	}
	public void setSaleVolume(int saleVolume) {
		this.saleVolume = saleVolume;
	}
	public int getSaleVolume() {
		return saleVolume;
	}
	public void setTimeRange(String timeRange) {
		this.timeRange = timeRange;
	}
	public String getTimeRange() {
		return timeRange;
	}
	public void setPlaceRange(String placeRange) {
		this.placeRange = placeRange;
	}
	public String getPlaceRange() {
		return placeRange;
	}
	public void setAssessNumber(int assessNumber) {
		this.assessNumber = assessNumber;
	}
	public int getAssessNumber() {
		return assessNumber;
	}
	public void setServiceState(int serviceState) {
		this.serviceState = serviceState;
	}
	public int getServiceState() {
		return serviceState;
	}
	public void setServicePic(String servicePic) {
		this.servicePic = servicePic;
	}
	public String getServicePic() {
		return servicePic;
	}

}
