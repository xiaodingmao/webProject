<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="utf-8">
    <title>后台管理</title>
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
			
				<div class="slate clearfix">
				
					<a class="stat-column" href="#">
						
						<span class="number">${ordernum}</span>
						<span>Open Orders</span>
						
					</a>
				
					<a class="stat-column" href="#">
						
						<span class="number">${usernum }</span>
						<span>Members</span>
						
					</a>
				
					<a class="stat-column" href="#">
						
						<span class="number">${servicenum }</span>
						<span>Service</span>
						
					</a>
				
					<a class="stat-column" href="#">
						
						<span class="number">${invitenum }</span>
						<span>Invitation</span>
						
					</a>
				
				</div>
			
			</div>
		
		</div>
		
		<div class="row">
		
			
		
			<div class="span10">
			
				<div class="slate">
				
					<div class="page-header">
						<h2><i class="icon-shopping-cart pull-right"></i>Latest Orders</h2>
					</div>
					
					<table class="orders-table table">
					<tbody>
					<c:forEach items="${list}" var="order">
						<tr>
							<td><a href="or_vieworder?orderid=${order.orderID }">${order.userID }</a> <span class="label label-info">${order.serviceTime }</span></td>
							<td>${order.servicePrice }</td>
						</tr>
					</c:forEach>	
					</tbody>
					</table>

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
<script src="assets/js/excanvas.min.js"></script>
<script src="assets/js/jquery.flot.min.js"></script>
<script src="assets/js/jquery.flot.resize.js"></script>
<script type="text/javascript">
$(function () {
    var d1 = [];
        d1.push([0, 32]);
        d1.push([1, 30]);
        d1.push([2, 24]);
        d1.push([3, 17]);
        d1.push([4, 11]);
        d1.push([5, 25]);
        d1.push([6, 28]);
        d1.push([7, 36]);
        d1.push([8, 44]);
        d1.push([9, 52]);
        d1.push([10, 53]);
        d1.push([11, 50]);
        d1.push([12, 45]);
        d1.push([13, 42]);
        d1.push([14, 40]);
        d1.push([15, 36]);
        d1.push([16, 34]);
        d1.push([17, 24]);
        d1.push([18, 17]);
        d1.push([19, 17]);
        d1.push([20, 20]);
        d1.push([21, 28]);
        d1.push([22, 36]);
        d1.push([23, 38]);

    $.plot($("#placeholder"), [ d1 ], { grid: { backgroundColor: 'white', color: '#999', borderWidth: 1, borderColor: '#DDD' }, colors: ["#FC6B0A"], series: { lines: { show: true, fill: true, fillColor: "rgba(253,108,11,0.4)" } } });
});
</script>

<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='utf-8'></script></div>
</body>
</html>