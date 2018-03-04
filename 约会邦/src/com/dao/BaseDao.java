package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 基础数据库访问类<br>
 * 提供了打开与关闭连接，执行更新式的sql语句等方法
 * 
 * @author
 *
 */
public class BaseDao {
	
	/**
	 * 驱动器类名
	 */
	private static final String CLASS_NAME = "com.mysql.jdbc.Driver";
	
	/**
	 * 连接字符串<br>
	 * 这里的3306是mysql的端口号，news是数据库名
	 */
	private static final String CONN_URL = "jdbc:mysql://localhost:3306/date?useUnicode=true&characterEncoding=utf-8";
	
	/**
	 * 数据库用户名<br>
	 * 数据库默认用户名为root
	 */
	private static final String DATABASE_USERNAME = "root";
	
	/**
	 * 数据库密码<br>
	 * 数据库默认密码为root
	 */
	private static final String DATABASE_PASSWORD = "123456";

	/**
	 * 打开一个连接
	 * 
	 * @return 数据库连接
	 */
	public Connection getConnection() {
		try {
			Class.forName(CLASS_NAME);
			return DriverManager.getConnection(CONN_URL, DATABASE_USERNAME, DATABASE_PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 关闭全部
	 * 
	 * @param connection
	 * 				连接对象
	 * @param statement
	 * 				执行对象
	 * @param resultSet
	 * 				结果集
	 */
	public void closeAll(Connection connection, Statement statement, ResultSet resultSet) {
		try {
		
			if (connection != null && !connection.isClosed()) {
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 执行一个无返回值的更新型操作<br>
	 * 注意<font color="red">执行本方法无需提前得到连接，事后也无需关闭连接</font>
	 * 
	 * @param sql
	 * 			sql语句，必须是insert update delete之一
	 */
	public int executeUpdate(String sql) {
		int re=-1;
		//得到连接
		Connection connection = getConnection();
		
		Statement statement = null;
		try {
			//创建一个执行对象
			statement = connection.createStatement();
			
			//执行sql语句
			re=statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//关闭所有
		closeAll(connection, statement, null);
		return re;
	}
	public ResultSet executeQuery(String sql){
		
		Connection connection=this.getConnection();
		ResultSet resultSet=null;
		Statement statement;
		try {
			statement=connection.createStatement();
			resultSet =statement.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return resultSet;
	}
	
	
}
