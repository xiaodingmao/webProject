<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="utf-8">
    <title>Adminize</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Le styles -->
    <link href="http://fonts.googleapis.com/css?family=Oxygen|Marck+Script" rel="stylesheet" type="text/css">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/font-awesome.css" rel="stylesheet">
    <link href="assets/css/admin.css" rel="stylesheet">
    
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
	    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>

</head>    
<body>

<script src="js/rl.js" language="javascript" type="text/javascript"></script> 

<div class="container">
		
	<div class="row">
		<jsp:include page="menu.jsp"></jsp:include>
	
	<div class="main-area dashboard">
	
			
			
			<div class="row">
			
				<div class="span10">
				
					<div class="slate">
					
					
						<form class="form-inline" action="or_searchorder" method="post">
							<input name="orderName" type="text" class="input-large" placeholder="service # or Customer Name...">
						    <input name="startdate" class="Wdate" onFocus="WdatePicker({lang:'zh-cn'})" value="2000-1-1">
							<!--  <select class="span2" name="startdate">
								<option value="2000-1-1"> - From Date - </option>
							</select>-->
							<% 
                             String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
                           //获取系统时间 
                              System.out.println(datetime);
                             %>
                              <input name="enddate" class="Wdate" onFocus="WdatePicker({lang:'zh-cn'})" value="<%=datetime%>">
							<!--  <select class="span2" name="enddate">
								<option value="<%=datetime%>"> - To Date - </option>
							</select>
							-->
							<select class="span2" name="paystate">
								<option value="1"> - 已支付 - </option>
								<option value="0"> - 未支付 - </option>
								
							</select>
							<button type="submit" class="btn btn-primary">Filter Orders</button>
						</form>
					
					</div>
				
				</div>
			
			</div>
			
			<div class="row">
				
				
				<div class="span10">
				
					<div class="slate">
					
						<div class="page-header">
							
							<h2>Orders</h2>
						</div>
					
						<table class="orders-table table">
						<thead>
							<tr>
								<th>Order</th>
								<th class="value">Value</th>
								<th class="actions">Actions</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${orderlist}" var="order">
							<tr>
								<td><a href="or_vieworder?orderid=${order.orderID }">${order.userID }</a> <br /><span class="meta">${order.serviceTime }</span></td>
								<td class="value">
									${order.servicePrice }
								</td>
								<td class="actions">
									<a class="btn btn-small btn-primary" href="or_vieworder?orderid=${order.orderID }">View Order</a>
								</td>
							</tr>
						</c:forEach>
							
						</tbody>
						</table>

					</div>
				
				</div>
				
				<div class="span5">
				
					<div class="pagination pull-left">
						<ul>
							<li><a href="#">Prev</a></li>
							<li class="active">
							  <a href="#">1</a>
							</li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">Next</a></li>
						</ul>
					</div>
				
				</div>
				
				
				
			</div>
			
		<div class="row">
		
			<div class="span10 footer">
			
				<p>&copy;Date Federation</p>
			
			</div>
		
		</div>
		
	</div>
	
	</div> <!-- end span10 -->
		
	</div> <!-- end row -->
		
</div> <!-- end container -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="assets/js/bootstrap.js"></script>


<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='utf-8'></script></div>
</body>
</html>