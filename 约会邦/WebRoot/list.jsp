<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="utf-8">
    <title>约会服务</title>
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
<body >

<div class="container">
		
	<div class="row">
		
		<div class="span2">
		
		<div class="main-left-col">
		
			<h1><i class="icon-shopping-cart icon-large"></i> Adminize</h1>
			
			<ul class="side-nav">

				<li class="active">
					<a href="backindex.jsp"><i class="icon-home"></i>board</a>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="collapse" data-target="#website-dropdown" href="ser_wholeService"><i class="icon-sitemap"></i> DateService </a>	
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="collapse" data-target="#store-dropdown" href="orderlist.jsp"><i class="icon-shopping-cart"></i>MemberOrder </a>
					
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="collapse" data-target="#reports-dropdown" href="invitation.jsp"><i class="icon-signal"></i>invitation</a>
					
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="collapse" data-target="#members-dropdown" href="memberlist.jsp"><i class="icon-group"></i> Members</a>
					
				</li>
				
				
				
			</ul>
		
		</div> <!-- end main-left-col -->
	
	</div> <!-- end span2 -->
	
	<div class="span10">
		
	<div class="secondary-masthead">
	
		<ul class="nav nav-pills pull-right">
			<li>
				<a href="index.jsp"><i class="icon-globe"></i> View Website</a>
			</li>
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user"></i>${userName}<b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
				
					<li class="divider"></li>
					<li><a href="back_login.jsp">Logout</a></li>
				</ul>
			</li>
		</ul>

		<ul class="breadcrumb">
			<li>
				<a href="backindex.jsp">Admin</a> <span class="divider">/</span>
			</li>
			<li class="active">Dashboard</li>
		</ul>
		
	</div>
	
	<div class="main-area dashboard">
	
			
			<div class="row">
			
				<div class="span10">
				
					<div class="slate">
					
						<form class="form-inline" action="ser_searchService" method="post">
							<input type="text" name="keyword" class="input-large" placeholder="Keyword...">
							<select class="span2" name="starprice" >
								<option value="0"> - From price - </option>
								<option value="100"> 100</option>
								<option value="200"> 200</option>
								<option value="300"> 300</option>
								<option value="400"> 400</option>
								<option value="500"> 500</option>
								
							</select>
							<select class="span2" name="endprice">
								<option value="0"> - To price - </option>
								<option value="600">600</option>
								<option value="700"> 700</option>
								<option value="800"> 800</option>
								<option value="900"> 900</option>
								<option value="1000"> 1000</option>
							</select>
							<select class="span2" name="salesnumber">
								<option value="0"> - salesnumber - </option>
								<option value="50">低于50</option>
								<option value="100"> 50-100</option>
								<option value="200"> 100-200</option>
								<option value="300"> 200-300</option>
								<option value="400"> 高于300</option>
							</select>
							
							
							
							<button type="submit" class="btn btn-primary">Filter Listings</button>
							
						</form>
						
					
					</div>
				
				</div>
			
			</div>
			
			<div class="row">
				
				
				
				<div class="span10">
				
					<div class="slate">
					
						<div class="page-header">
							<div class="btn-group pull-right">
								<a class="btn  btn-primary" href="addservice.jsp">add new service</a>
								
							</div>
							
							<h2>Listings</h2>
						</div>
					
						<table class="orders-table table">
						<thead>
							<tr>
								<th>Listing</th>
								<th class="actions">Actions</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${servicelist1}" var="service">
							<tr>
								<td><a href="viewservice.jsp">${service.serviceName }</a> <br /><span class="meta">${service.servicePrice}</span></td>
								<td class="actions">
									<a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
									<a class="btn btn-small btn-primary" href="updateservice.jsp">Edit</a>
								</td>
							</tr>
							
						</c:forEach>
						</tbody>
						</table>

					</div>
				
				</div>
				
				<div class="modal hide fade" id="removeItem">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">Ã</button>
						<h3>Remove Item</h3>
					</div>
					<div class="modal-body">
						<p>Are you sure you would like to remove this item?</p>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn" data-dismiss="modal">Close</a>
						<a href="deleteservice.jsp" class="btn btn-danger">Remove</a>
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