package com.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.BaseDao;
import com.model.Order;
import com.model.OrderServiceUser;

public class OrderManageAction {
	
	private List<OrderServiceUser > orderlist;
	
	private BaseDao dao=new BaseDao();
	
	private int orderid;
	
	private String orderName;
	private String startdate;
	private String enddate;
	private int paystate;
	
	


	public int getOrderid() {
		return orderid;
	}




	public String getOrderName() {
		return orderName;
	}




	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}




	public String getStartdate() {
		return startdate;
	}




	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}




	public String getEnddate() {
		return enddate;
	}




	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}




	public int getPaystate() {
		return paystate;
	}




	public void setPaystate(int paystate) {
		this.paystate = paystate;
	}




	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}




	public List<OrderServiceUser> getOrderlist() {
		return orderlist;
	}




	public void setOrderlist(List<OrderServiceUser> orderlist) {
		this.orderlist = orderlist;
	}




	public String  wholeOrder(){
		
		String sql="select * from (date_order inner join date_service on date_order.serviceID=date_service.serviceID)inner join date_user on date_order.userID=date_user.userID";
		Connection connect=dao.getConnection();
		Statement statement;
		try {
			statement=connect.createStatement();
			ResultSet rs=statement.executeQuery(sql);
			orderlist=new ArrayList<OrderServiceUser>();
			while(rs.next()){
				
				OrderServiceUser u=new OrderServiceUser();
				u.setServiceName(rs.getString("serviceName"));
				u.setServiceTime(rs.getString("serviceTime"));
				u.setUserID(rs.getString("userID"));
		        u.setServicePrice(rs.getDouble("servicePrice"));
		        u.setOrderID(rs.getInt("orderID"));
				orderlist.add(u);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "whole";
	}
    public int orderNumber(){
    	String sql="select count(*) as count from date_order";
    	int number=0;
    	Connection connect=dao.getConnection();
		Statement statement;
		try {
			statement=connect.createStatement();
			ResultSet rs=statement.executeQuery(sql);
			orderlist=new ArrayList<OrderServiceUser>();
			while(rs.next()){
				
				number=rs.getInt("count");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return number;
    }
	
	public String vieworder(){
		
		String sql="select * from (date_order inner join date_service on date_order.serviceID=date_service.serviceID)inner join date_user on date_order.userID=date_user.userID where date_order.orderID="+orderid;
		Connection connect=dao.getConnection();
		Statement statement;
		try {
			statement=connect.createStatement();
			ResultSet rs=statement.executeQuery(sql);
			orderlist=new ArrayList<OrderServiceUser>();
			while(rs.next()){
				
				OrderServiceUser u=new OrderServiceUser();
				u.setServiceName(rs.getString("serviceName"));
			     u.setServicePrice(rs.getDouble("servicePrice"));
			     u.setServiceIntroduce(rs.getString("serviceIntroduce"));
			     u.setTimeRange(rs.getString("timeRange"));
			     u.setPlaceRange(rs.getString("placeRange"));
				//user
				u.setUserID(rs.getString("userID"));
		        u.setName(rs.getString("name"));
		        u.setGender(rs.getString("gender"));
		        u.setAddress(rs.getString("address"));
		        u.setPhone(rs.getString("phone"));
		        
		        //订单
		        u.setOrderID(rs.getInt("orderID"));
		        u.setOrderTime(rs.getString("orderTime"));
		    	u.setServiceTime(rs.getString("serviceTime"));
		        u.setPayState(rs.getInt("payState"));
		        u.setRemark(rs.getString("remark"));
		        
				orderlist.add(u);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return "view";
		
	}
	
	public String searchorder(){
		
		String sql="select * from (date_order inner join date_service on date_order.serviceID=date_service.serviceID)inner join date_user on date_order.userID=date_user.userID " +
				     "where (date_user.userID like '%"+orderName+"%'or date_service.serviceName like '%"+orderName+"%')and date_order.orderTime between '"+startdate+"'and '"+enddate+"'and date_order.payState="+paystate;
		System.out.println(sql);
		Connection connect=dao.getConnection();
		Statement statement;
		try {
			statement=connect.createStatement();
			ResultSet rs=statement.executeQuery(sql);
			orderlist=new ArrayList<OrderServiceUser>();
			while(rs.next()){
				
				OrderServiceUser u=new OrderServiceUser();
				u.setServiceName(rs.getString("serviceName"));
				u.setServiceTime(rs.getString("serviceTime"));
				u.setUserID(rs.getString("userID"));
		        u.setServicePrice(rs.getDouble("servicePrice"));
		        u.setOrderID(rs.getInt("orderID"));
				orderlist.add(u);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "search";
	}
}
