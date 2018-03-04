<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>




  

 
		<div class="span2">
		
		<div class="main-left-col">
		
			<h1><i class="icon-shopping-cart icon-large"></i> Adminize</h1>
			
			<ul class="side-nav">

				<li class="active">
					<a href="m_manage"><i class="icon-home"></i>board</a>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="collapse" data-target="#website-dropdown" href="ser_wholeService"><i class="icon-sitemap"></i> DateService </a>	
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="collapse" data-target="#store-dropdown" href="or_wholeOrder"><i class="icon-shopping-cart"></i>MemberOrder </a>
					
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="collapse" data-target="#reports-dropdown" href="in_wholeInvitation"><i class="icon-signal"></i>invitation</a>
					
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="collapse" data-target="#members-dropdown" href="user_wholeusers"><i class="icon-group"></i> Members</a>				
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
				<a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user"></i><%=session.getAttribute("Name") %><b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
				
					<li class="divider">&nbsp;</li>
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
	
	
	