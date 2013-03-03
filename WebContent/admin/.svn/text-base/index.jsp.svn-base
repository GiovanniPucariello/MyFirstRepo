<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主界面</title>
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
	<jsp:include page="header.jsp" />
</body>
</html>