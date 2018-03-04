package com.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.BaseDao;
import com.model.Invitation;
import com.model.OrderServiceUser;
import com.model.Service;
import com.model.User;

public class ManageAction {
	private String userName;

	private String password;
	private HttpServletRequest request = ServletActionContext.getRequest();
	private int ordernum;
	private List<OrderServiceUser> list;
	private int usernum;
	private int servicenum;
	private int invitenum;
	private BaseDao dao=new BaseDao();
	private int limit;

	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getServicenum() {
		return servicenum;
	}
	public void setServicenum(int servicenum) {
		this.servicenum = servicenum;
	}
	public int getInvitenum() {
		return invitenum;
	}
	public void setInvitenum(int invitenum) {
		this.invitenum = invitenum;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	
	
	public List<OrderServiceUser> getList() {
		return list;
	}
	public void setList(List<OrderServiceUser> list) {
		this.list = list;
	}
	public String manage(){
		
		OrderManageAction order=new OrderManageAction();
		ordernum=order.orderNumber();
	    usernum=this.usernumber();
		servicenum=this.servicenumber();
	    invitenum=this.invitenumber();
	    String sql="select * from (date_order inner join date_service on date_order.serviceID=date_service.serviceID) order by orderTime desc limit 20";
		Connection connect=dao.getConnection();
		Statement statement;
		try {
			statement=connect.createStatement();
			ResultSet rs=statement.executeQuery(sql);
		    list=new ArrayList<OrderServiceUser>();
			while(rs.next()){
				
				OrderServiceUser u=new OrderServiceUser();
				u.setServiceName(rs.getString("serviceName"));
				u.setServiceTime(rs.getString("serviceTime"));
				u.setUserID(rs.getString("userID"));
		        u.setServicePrice(rs.getDouble("servicePrice"));
		        u.setOrderID(rs.getInt("orderID"));
				list.add(u);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "manage";
		
		
	}
	
	public int usernumber(){
		List<User> userlist;
		String sql="select count(*) as count from date_user";
    	int number=0;
    	Connection connect=dao.getConnection();
		Statement statement;
		try {
			statement=connect.createStatement();
			ResultSet rs=statement.executeQuery(sql);
			userlist=new ArrayList<User>();
			while(rs.next()){
				
				number=rs.getInt("count");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return number;
	}
	
	public int servicenumber(){
		List<Service> userlist;
		String sql="select count(*) as count from date_service";
    	int number=0;
    	Connection connect=dao.getConnection();
		Statement statement;
		try {
			statement=connect.createStatement();
			ResultSet rs=statement.executeQuery(sql);
			userlist=new ArrayList<Service>();
			while(rs.next()){
				
				number=rs.getInt("count");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return number;
	}

	public int invitenumber(){
		List<Invitation> userlist;
		String sql="select count(*) as count from date_invitation";
    	int number=0;
    	Connection connect=dao.getConnection();
		Statement statement;
		try {
			statement=connect.createStatement();
			ResultSet rs=statement.executeQuery(sql);
			userlist=new ArrayList<Invitation>();
			while(rs.next()){
				
				number=rs.getInt("count");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return number;
	}
	
	public String backlogin(){ 
		
		String userID=null;
		String password=null;
		String sql="select * from date_user where userID='"+userName +"'";
		String word=null;
		ResultSet rs=dao.executeQuery(sql);
	    try {
			while(rs.next())
			{
				 limit=rs.getInt("limit");
				 userID=rs.getString("userID");
				 password=rs.getString("password");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    while(userID!=null&&password!=null)
	    {
	     if(limit==0 && userID.equals(userName)&&password.equals(this.password))
	     {
	    	 request.getSession().setAttribute("Name", userID);
	    	 word = manage();
	    	 System.out.println(word);
	    	 return word;
	     }
	    else if(userID.equals(userName)&&password.equals(this.password)&& limit==1)
	    {
	      return "faillog";
	    }
	    else {
	    	return "miss";
	    }
	   }
	    return "null";
	}

}
