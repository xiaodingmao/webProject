package com.model;

public class Invitation {
	
	private int invitationID;
	private String invitationUserID;
	private String acceptUserID;
	private int acceptNumber;
	private String time;
	private String place;
	private String dateDetail;
	public void setInvitationID(int invitationID) {
		this.invitationID = invitationID;
	}
	public int getInvitationID() {
		return invitationID;
	}
	public void setInvitationUserID(String invitationUserID) {
		this.invitationUserID = invitationUserID;
	}
	public String getInvitationUserID() {
		return invitationUserID;
	}
	public void setAcceptUserID(String acceptUserID) {
		this.acceptUserID = acceptUserID;
	}
	public String getAcceptUserID() {
		return acceptUserID;
	}
	public void setAcceptNumber(int acceptNumber) {
		this.acceptNumber = acceptNumber;
	}
	public int getAcceptNumber() {
		return acceptNumber;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTime() {
		return time;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getPlace() {
		return place;
	}
	public String getDateDetail() {
		return dateDetail;
	}
	public void setDateDetail(String dateDetail) {
		this.dateDetail = dateDetail;
	}
	
	
	

}
