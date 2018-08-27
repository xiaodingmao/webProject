package com.action;

import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.dao.BaseDao;

import com.model.Service;


public class ServiceManageAction {
	
	private BaseDao dao=new BaseDao();
    private List<Service> servicelist;

//搜索所需要的字段
    private String keyword;
    private double startprice;
    private double endprice;
    private int salesnumber;
//插入所需要的字段 
	private String serviceName;
	private double servicePrice;
	private String serviceTime;
	private String servicePlace;
	private String serviceInfo;
	private File image;
	private String imageFileName;

	private String imageContentType;
     private String relativepath;
     
//DELETE
     private int ID;
     
	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getRelativepath() {
		return relativepath;
	}

	public void setRelativepath(String relativepath) {
		this.relativepath = relativepath;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public double getServicePrice() {
		return servicePrice;
	}

	public void setServicePrice(double servicePrice) {
		this.servicePrice = servicePrice;
	}

	public String getServiceTime() {
		return serviceTime;
	}

	public void setServiceTime(String serviceTime) {
		this.serviceTime = serviceTime;
	}

	public String getServicePlace() {
		return servicePlace;
	}

	public void setServicePlace(String servicePlace) {
		this.servicePlace = servicePlace;
	}

	public String getServiceInfo() {
		return serviceInfo;
	}

	public void setServiceInfo(String serviceInfo) {
		this.serviceInfo = serviceInfo;
	}

	

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public double getStartprice() {
		return startprice;
	}

	public void setStartprice(double startprice) {
		this.startprice = startprice;
	}

	public double getEndprice() {
		return endprice;
	}

	public void setEndprice(double endprice) {
		this.endprice = endprice;
	}

	public int getSalesnumber() {
		return salesnumber;
	}

	public void setSalesnumber(int salesnumber) {
		this.salesnumber = salesnumber;
	}

	public List<Service> getServicelist() {
		return servicelist;
	}

	public void setServicelist(List<Service> servicelist) {
		this.servicelist = servicelist;
	}
     
	//整个服务列表
	public String wholeService(){
		String sql="select * from date_service";
	    ResultSet rs=dao.executeQuery(sql);
	    servicelist=new ArrayList<Service>();
	    try {
			while(rs.next()){
				Service ser=new Service();
				ser.setServiceName(rs.getString("serviceName"));
				ser.setServicePrice(rs.getDouble("servicePrice"));
			    ser.setServiceID(rs.getInt("serviceID"));
				servicelist.add(ser);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return "whole";
		
		
	}
	//搜索服务
	public String searchServices() {



		String sql="select * from date_service  where  serviceName like '%"+keyword+"%' and servicePrice between "+startprice+" and "+endprice+" and saleVolume <="+salesnumber;	
		System.out.println(sql);
		Connection connection = dao.getConnection();
		Statement statement;
		try {
			statement = connection.createStatement();
			ResultSet re = statement.executeQuery(sql);
			   servicelist = new ArrayList<Service>();
				System.out.println(111111);
			while (re.next()) {
				Service ser=new Service();
				ser.setServiceName(re.getString("serviceName"));
				ser.setServicePrice(re.getDouble("servicePrice"));
			    ser.setServiceID(re.getInt("serviceID"));
				System.out.println(ser.getServiceID());
			
				servicelist.add(ser);
			}
			dao.closeAll(connection, statement, re);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "search";
	}
/*没有执行成功的方法,成功的方法参见上文
	public String searchService(){
		
		ResultSet re =null;
		try{
			String sql="select * from date.date_service  where  serviceName like '%"+keyword+"%'";	
	       re =dao.executeQuery(sql);
		   servicelist=new ArrayList<Service>();	
		
			if(!re.next()){
				System.out.println("aaaaaaaaaaaaaaa");
			}
			while(re.next()){
				Service ser=new Service();
				ser.setServiceName(re.getString("serviceName"));
				ser.setServicePrice(re.getDouble("servicePrice"));
				System.out.println(ser.getServiceName());
				System.out.println(111111);
				servicelist.add(ser);
			}		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "search";
	}
*/	
	
	
	
	//上传图片
	public String upPic() throws IOException {
		// 给文件定义唯一的名字
		String s = UUID.randomUUID().toString();
		s = s.substring(0, 8) + s.substring(9, 13) + s.substring(14, 18)
				+ s.substring(19, 23) + s.substring(24);
		String lastName = imageFileName.substring(
				imageFileName.lastIndexOf(".") + 1, imageFileName.length());
		// 给上传文件重新命名
		String name = s + "." + lastName;
		// 存放文件的临时路径
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/upload");
		System.out.println("realpath: " + realpath);
		if (image != null) {
			File savefile = new File(new File(realpath), name);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(image, savefile);
			// 文件上传后保存的路径
			String imagePath = "/datefederation/upload/" + name;
	
			System.out.println("imagePath: " + imagePath);
			
			
			return imagePath;
		}
		return null;
		
	}
	
	//发布服务
	public String insertService() throws IOException{
		relativepath=this.upPic();
		String sql="insert into date_service(serviceName,servicePrice,timeRange,placeRange,serviceIntroduce,servicePic) values('"+serviceName+"',"+servicePrice+",'"+serviceTime+"','"+servicePlace+"','"+serviceInfo+"','"+relativepath+"')";
		int re=dao.executeUpdate(sql);
        System.out.println(serviceName);
		if(re!=-1){
		return "insert";
		}
		return "failInsert";
	}
	public String deleteService(){
		String sql="delete from date_service where serviceID="+ID;
		int re=dao.executeUpdate(sql);
		if(re!=-1){
		return "delete";
		}
		return "failDe";
	}
public String updateService(){
	
		String sql="select * from date_service where serviceID="+ID;
		Connection connection=dao.getConnection();
		Statement statement;
		
		try {
			statement=connection.createStatement();
			ResultSet rs=statement.executeQuery(sql);
			servicelist=new ArrayList<Service>();
			while(rs.next()){
			
				serviceName=rs.getString("serviceName");
				servicePlace=rs.getString("placeRange");
				serviceInfo=rs.getString("serviceIntroduce");
				serviceTime=rs.getString("timeRange");
		        ID=rs.getInt("serviceID");
		        relativepath=rs.getString("servicePic");
				servicePrice=rs.getDouble("servicePrice");
	
				
				
			}dao.closeAll(connection, statement, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "update";
	}
	
	public String editService() throws IOException{
		relativepath=this.upPic();
		String sql="update date_service set serviceName='"+serviceName+"',servicePrice="+servicePrice+",timeRange='"+serviceTime+"',placeRange='"+servicePlace+"',serviceIntroduce='"+serviceInfo+"',servicePic=' "+relativepath+"'where serviceID="+ID;
		System.out.println(sql);
		int re=dao.executeUpdate(sql);
		if(re!=-1)
		   return "edit";
		else
		   return "failEdit";
		
	}

}
