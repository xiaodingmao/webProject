package com.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.BaseDao;
import com.model.Invitation;

public class InvitationManageAction {
	
	private List<Invitation> invitationlist;
	
	private BaseDao dao=new BaseDao();
	private int ID;
	private String keyword;
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public List<Invitation> getInvitationlist() {
		return invitationlist;
	}

	public void setInvitationlist(List<Invitation> invitationlist) {
		this.invitationlist = invitationlist;
	}

	public String wholeInvitation()
	{
		
		String sql="select * from date_invitation ";
		Connection connection=dao.getConnection();
		Statement statement;
		try {
			statement=connection.createStatement();
			ResultSet rs=statement.executeQuery(sql);
			invitationlist=new ArrayList<Invitation>();
			while(rs.next()){
				Invitation n=new Invitation();
				n.setAcceptUserID(rs.getString("acceptUserID"));
				n.setDateDetail(rs.getString("dateDetail"));
				n.setInvitationID(rs.getInt("invitationID"));
				n.setInvitationUserID(rs.getString("invitationUserID"));
				n.setPlace(rs.getString("place"));
				n.setTime(rs.getString("time"));
				invitationlist.add(n);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "whole";
	}
	public String deleteInvitation()
	{
		String sql="delete from date_invitation where invitationID = "+ID;
		int re=dao.executeUpdate(sql);
		if(re!=-1)
		return "delete";
		else
			return "fail";
		
	}
	
	public String viewInvitation(){
		String sql="select * from date_invitation where invitationID="+ID;
		Connection connection=dao.getConnection();
		Statement statement;
		try {
			statement=connection.createStatement();
			ResultSet rs=statement.executeQuery(sql);
			invitationlist=new ArrayList<Invitation>();
			while(rs.next()){
				Invitation in=new Invitation();
				in.setAcceptNumber(rs.getInt("acceptNumber"));
				in.setAcceptUserID(rs.getString("acceptUserID"));
				in.setDateDetail(rs.getString("dateDetail"));
				in.setInvitationUserID(rs.getString("invitationUserID"));
				in.setPlace(rs.getString("place"));
				in.setTime(rs.getString("time"));
				invitationlist.add(in);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "view";
	}
	public String searchInvitation(){
		
		String sql="select * from date_invitation where acceptUserID like '%"+keyword+"%' or invitationUserID like '%"+keyword+"%' or dateDetail like '%"+keyword+"%'or place like '%"+keyword+"%'";
		Connection connection=dao.getConnection();
		Statement statement;
		try {
			statement=connection.createStatement();
			ResultSet rs=statement.executeQuery(sql);
			invitationlist=new ArrayList<Invitation>();
			while(rs.next()){
				Invitation n=new Invitation();
				n.setAcceptUserID(rs.getString("acceptUserID"));
				n.setDateDetail(rs.getString("dateDetail"));
				n.setInvitationID(rs.getInt("invitationID"));
				n.setInvitationUserID(rs.getString("invitationUserID"));
				n.setPlace(rs.getString("place"));
				n.setTime(rs.getString("time"));
				invitationlist.add(n);
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "search";
	}

}
