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
				
				<div class="span10">
				
					<div class="slate">
					
						<div class="page-header">
							<h2>Invitation Details</h2>
						</div>
						<c:forEach items="${invitationlist }" var="invite">
						<table class="orders-table table">
						<thead>
							<tr>
								<th>Items</th>
								<th class="value">Value</th>
								
							</tr>
						</thead>
						<tbody>
					
							<tr>
								<td>邀请者 <br /></td>
								<td class="value">
									<a href="user_viewperson?userName=${invite.invitationUserID }">${invite.invitationUserID }</a>
								</td>
						
							</tr>
							<tr>
								<td>应邀人 <br /></td>
								<td class="value">
									<a href="user_viewperson?userName=${invite.acceptUserID }">${invite.acceptUserID }</a>
								</td>
						
							</tr>
							<tr>
								<td>时间 <br /></td>
								<td class="value">
									${invite.time }
								</td>
						
							</tr>
							<tr>
								<td>地点<br /></td>
								<td class="value">
									${invite.place }
								</td>
						
							</tr>
							<tr>
								<td>详情<br /></td>
								<td class="value">
									${invite.dateDetail }
								</td>
						
							</tr>
							
						</tbody>
						</table>
					</c:forEach>
					</div>
				
				</div>
				
				
				
			</div>
			
		
			
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

<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='utf-8'></script></div>
</body>
</html>