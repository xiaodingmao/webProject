<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="utf-8">
    <title> Adminize</title>
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

</head>    
<body>

<div class="container">
		
	<div class="row">
		
		
	
	<jsp:include page="menu.jsp"></jsp:include>
	
	<div class="main-area dashboard">
	
			
		<c:forEach items="${orderlist}" var="order">
			<div class="row">
			
				<div class="span4">
				
					<div class="slate">
					
						<div class="page-header">
							<h2>Order Details</h2>
						</div>
						
						<p><strong>Order ID:</strong>${order.orderID }</p>
						<p><strong>Order Date:</strong>${order.orderTime }</p>
						<p><strong>Payment state</strong> ${order.payState }</p>
						<p><strong>service time:</strong> ${order.serviceTime }</p>
						<p><strong>remark:</strong>${order.remark}</p>
					
					</div>
				
				</div>
			
				<div class="span3">
				
					<div class="slate">
					
						<div class="page-header">
							<h2>user of this order</h2>
						</div>
					
						<p><strong>user ID:</strong>${order.userID }</p>
						<p><strong>real name:</strong>${order.name }</p>
						<p><strong>user gender:</strong> ${order.gender }</p>
						<p><strong>user address:</strong> ${order.address }</p>
						<p><strong>user phone:</strong>${order.phone}</p>
					
					</div>
				
				</div>
			
				<div class="span3">
				
					<div class="slate">
					
						<div class="page-header">
							<h2>service details of this order</h2>
						</div>
					
						<p><strong>service name:</strong>${order.serviceName }</p>
						<p><strong>service price:</strong>${order.servicePrice }</p>
						<p><strong>service timerange:</strong> ${order.timeRange }</p>
						<p><strong>service placerange:</strong> ${order.placeRange }</p>
						<p><strong>service introduce:</strong>${order.serviceIntroduce}</p>
					
					</div>
				
				</div>
			
			</div>
			
		</c:forEach>	
			
			
		<div class="row">
		
			<div class="span10 footer">
			
				<p>&copy; Date Federation</p>
			
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

<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>