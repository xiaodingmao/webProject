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
import com.model.User;

public class UserManageAction {

	private String userName;

	private String password;
	private HttpServletRequest request = ServletActionContext.getRequest();
	private List<User> userList;
	private BaseDao dao=new BaseDao();
	
	private int limit;
	private String keyword;
    ManageAction manage=new ManageAction();
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
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

	

	
    

	/*
	 * 查询所有的数据
	 */
	public String wholeusers() {

	

		String sql = "SELECT * FROM date_user ";
		Connection connection = dao.getConnection();
		Statement statement;
		try {
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			userList = new ArrayList<User>();
			while (rs.next()) {
				User user = new User();
				user.setUserID(rs.getString("userID"));
				user.setPassword(rs.getString("password"));
				user.setUserType(rs.getString("userType"));
				
				userList.add(user);
			}
			dao.closeAll(connection, statement,rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "userList";
	}
	
	public String viewuser()
	{
		String sql = "SELECT * FROM date_user where userID = '"+userName+"'";
		Connection connection = dao.getConnection();
		Statement statement;
		try {
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			userList = new ArrayList<User>();
			while (rs.next()) {
				User user = new User();
				user.setUserID(rs.getString("userID"));
				user.setPassword(rs.getString("password"));
				user.setUserType(rs.getString("userType"));
				user.setAddress(rs.getString("address"));
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getString("phone"));
				user.setUserPic(rs.getString("userPic"));
				user.setSuccessRate(rs.getDouble("successRate"));
				
				userList.add(user);
			}
			dao.closeAll(connection, statement,rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "view";
		
	}
	public String deleteuser(){
		
		String sql="delete from date_user where userID ='"+userName+"'";
		int re=dao.executeUpdate(sql);
		if(re != -1)
		    return "delete";
		else 
			return "fail";
	}
	public String searchuser(){
		String sql="select * from date_user where userID like '%"+keyword+"%'";
		Connection connection = dao.getConnection();
		Statement statement;
		try {
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			userList = new ArrayList<User>();
			while (rs.next()) {
				User user = new User();
				user.setUserID(rs.getString("userID"));
				user.setPassword(rs.getString("password"));
				user.setUserType(rs.getString("userType"));
				
				userList.add(user);
			}
			dao.closeAll(connection, statement,rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "search";
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
	    	word= manage.manage();
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
