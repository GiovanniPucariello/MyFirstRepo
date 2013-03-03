<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>头页面</title>
<link rel="stylesheet" type="text/css" href="css/main_style.css"
	media="screen">

<link rel="stylesheet" type="text/css" href="css/superfish.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/superfish-vertical.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/superfish-navbar.css" media="screen">
<script type="text/javascript" src="js/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="js/hoverIntent.js"></script>
<script type="text/javascript" src="js/superfish.js"></script>
<script type="text/javascript" src="js/supersubs.js"></script>
<script type="text/javascript">
	// initialise plugins
	jQuery(function() {
		jQuery('ul.sf-menu').superfish();
	});
</script>
</head>
<%
String uname="";
if(request.getSession().getAttribute("UserName") != null){
	uname = request.getSession().getAttribute("UserName").toString();
}
%>
<body>
	<table align="center" width="100%;">
	 <tr>
	 	<td><img width="100%;" height="74" src="../images/logo.png" /></td>
	 </tr>
	</table>
	
	<div style="background:#F5F5F5;width:100%;height:40px;">
	<ul class="sf-menu">
		<li class="current"><a href="#a">用户管理</a>
			<ul>
				<li><a href="addUser.jsp">用户新增</a></li>
				<li><a href="queryUserByPage.action">用户信息</a></li>
				<li><a href="addRole.jsp">角色新增</a></li>
				<li><a href="queryRole.action">角色信息</a></li>
				<li><a href="userRoleDistribute.action">角色分派</a></li>
			</ul>
		</li>
		<li class="current"><a href="#a">客户管理</a>
			<ul>
				<li><a href="customerInit.action">客户新增</a></li>
				<li><a href="queryCustomerByPage.action">客户信息</a></li>
			</ul>
		</li>
		<li class="current"><a href="#a">产品管理</a>
			<ul>
				<li><a href="addProduct.jsp">产品新增</a></li>
				<li><a href="queryProductByPage.action">产品信息</a></li>
			</ul>
		</li>
		<li class="current"><a href="#a">经销商管理</a>
			<ul>
				<li><a href="addDealer.jsp">经销商新增</a></li>
				<li><a href="queryDealer.action">经销商信息</a></li>
			</ul>
		</li>
		
		<li class="current"><a href="#a">发布管理</a>
			<ul>
				<li><a href="publishInit.action">发布产品</a></li>
				<li><a href="queryPublishByPage.action">发布信息</a></li>
			</ul>
		</li>
	</ul>
	<ul>
		<li class="myli1"><a class="mytext1">欢迎你，<%=uname %></a>
		<li class="myli2"><a class="mytext" href="logout.action">退出</a></li>
	</ul>
	</div>
</body>
</html>