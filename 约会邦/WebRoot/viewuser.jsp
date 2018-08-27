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
	
			
			<div class="row">
                 <c:forEach items="${userList }" var="user">
				<div class="span2 profileicon">
					
					<img src="${user.userPic}" height="180px" width="138px"/> 
					
					<p><strong>账号:</strong> ${user.userID }</p>
					<p><strong>状态:</strong> ${user.userType}</p>
					
				</div>
		
				<div class="span8">
					
					
					
					<div class="row">
					
					<div class="span8">
				
						<div class="slate">
						
							<div class="page-header">
								<h2>Customer's Details</h2>
							</div>
						
							<table class="orders-table table">
							<tbody>
								<tr>
									<td><a href="">姓名</a></td>
									<td>${user.name }</td>
								</tr>
								<tr>
									<td><a href="">性别</a></td>
									<td>${user.gender }</td>
								</tr>
								<tr>
									<td><a href="">电话</a></td>
									<td>${user.phone }</td>
								</tr>
								<tr>
									<td><a href="">邮箱</a></td>
									<td>${user.email }</td>
								</tr>
								<tr>
									<td><a href="">地址</a></td>
									<td>${user.address }</td>
								</tr>
								<tr>
									<td><a href="">约会成功率</a></td>
									<td>${user.successRate }</td>
								</tr>
							</tbody>
							</table>
	
						</div>
					
					</div>
					
					</div>
				
		</div>
		</c:forEach>
		
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