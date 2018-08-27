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
   
  <script   Language="javaScript">   
          function     validate()   
          {   
                  if     (document.f2.serviceName.value=="")   
                  {   
                          alert("服务名不能为空.");   
                          document.f2.serviceName.focus();   
                          return   false   ;   
                  }   
                  if (document.f2.servicePrice.value=="")   
                  {   
                          alert("服务价格不能为空.");   
                          document.f2.servicePrice.focus();   
                          return   false   ;   
                  }   
                  if (document.f2.serviceTime.value=="")   
                  {   
                          alert("服务时间不能为空.");   
                          document.f2.serviceTime.focus();   
                          return   false   ;   
                  }  
                  if (document.f2.servicePlace.value=="")   
                  {   
                          alert("服务地点不能为空.");   
                          document.f2.servicePlace.focus();   
                          return   false   ;   
                  }   
                  if (document.f2.image.value=="")   
                  {   
                          alert("图片不能为空.");   
                          document.f2.image.focus();   
                          return   false   ;   
                  }  
                  if (document.f2.serviceInfo.value=="")   
                  {   
                          alert("服务详情不能为空.");   
                          document.f2.serviceInfo.focus();   
                          return   false   ;   
                  }  
                   
              return     true;   
          }   
  </script>   
    
  

</head>    
<body >


<div class="container">
		
	<div class="row">
		
		<jsp:include page="menu.jsp"></jsp:include>
	<div class="span10">
		
	
	<div class="main-area dashboard">
	
			
			<div class="row">
				
				
				<div class="span10">
				
					<div class="slate">
								
						<div class="page-header">
							<h2>Publish Service</h2>
						</div>
									
						<form name="f2" id="f2"  onsubmit="return validate()" class="form-horizontal" action="ser_editService" method="post" enctype="multipart/form-data">
						<fieldset>
						  <div class="control-group">
						    <label class="control-label" for="input01">Service Name</label>
						    <div class="controls">
						      <input type="text" name="serviceName" class="input-xlarge" id="input01" value="${serviceName}">
						
						      <p class="help-block">服务名称尽可能简洁，有吸引力</p>
						    </div>
						  </div>
						  
						 <div class="control-group">
						    <label class="control-label" for="input01">Service Price</label>
						    <div class="controls">
						      <input type="text" name="servicePrice" class="input-xlarge" id="input01" value="${ servicePrice}">		 
						    </div>
						 </div>
						 
						  <div class="control-group">
						    <label class="control-label" for="input01">Service Time</label>
						    <div class="controls">
						      <input type="text" name="serviceTime" class="input-xlarge" id="input01" value="${serviceTime }">		 
						    </div>
						 </div>
						  <div class="control-group">
						    <label class="control-label" for="input01">Service Place</label>
						    <div class="controls">
						      <input type="text" name="servicePlace" class="input-xlarge" id="input01" value="${ servicePlace}">		 
						    </div>
						 </div>
						  
						  <div class="control-group">
						    <label class="control-label" for="fileInput">Image input</label>
						    <div class="controls">
						      <input class="input-file" id="fileInput" type="file" name="image">
						      <img src="${relativepath }" width="100px" height="100px"/>
						    </div>
						  </div>
						  
						  <div class="control-group">
						    <label class="control-label" for="textarea">ServiceInformation</label>
						    <div class="controls">
						      <textarea name="serviceInfo" class="input-xlarge" id="textarea" rows="3" >${serviceInfo }</textarea>
						    </div>
						  </div>
						 
				       	<input type="hidden" name="ID" value="${ID }"/>
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