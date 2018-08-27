<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="utf-8">
    <title>发布约会服务</title>
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
								
						<div class="page-header">
							<h2>Publish Service</h2>
						</div>
									
						<form class="form-horizontal" action="ser_insertService" method="post" enctype="multipart/form-data">
						<fieldset>
						  <div class="control-group">
						    <label class="control-label" for="input01">Service Name</label>
						    <div class="controls">
						      <input type="text" name="serviceName" class="input-xlarge" id="input01">
						   
						      <p class="help-block">服务名称尽可能简洁，有吸引力</p>
						    </div>
						  </div>
						  
						 <div class="control-group">
						    <label class="control-label" for="input01">Service Price</label>
						    <div class="controls">
						      <input type="text" name="servicePrice" class="input-xlarge" id="input01">		 
						    </div>
						 </div>
						 
						  <div class="control-group">
						    <label class="control-label" for="input01">Service Time</label>
						    <div class="controls">
						      <input type="text" name="serviceTime" class="input-xlarge" id="input01">		 
						    </div>
						 </div>
						  <div class="control-group">
						    <label class="control-label" for="input01">Service Place</label>
						    <div class="controls">
						      <input type="text" name="servicePlace" class="input-xlarge" id="input01">		 
						    </div>
						 </div>
						  
						  <div class="control-group">
						    <label class="control-label" for="fileInput">Image input</label>
						    <div class="controls">
						      <input class="input-file" id="fileInput" type="file" name="image">
						    </div>
						  </div>
						  <div class="control-group">
						    <label class="control-label" for="textarea">ServiceInformation</label>
						    <div class="controls">
						      <textarea name="serviceInfo" class="input-xlarge" id="textarea" rows="3"></textarea>
						    </div>
						  </div>
						 
				       
						</fieldset>
					
				       <div class="span10 listing-buttons">
				
							<button type="reset" class="btn btn-info">重置</button>
						
							<button type="submit" class="btn btn-success">提交</button>							
				        </div>
						
				        
					</form>
					
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