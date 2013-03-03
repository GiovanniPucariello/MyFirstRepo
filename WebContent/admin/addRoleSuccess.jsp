<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加成功提示</title>
<link rel="stylesheet" type="text/css" href="css/main_style.css" media="screen">
<script language="javascript">
	function displayError(){
		alert("添加成功!");
		location.replace("addRole.jsp");
	}
</script>
</head>
<body onload="displayError();">
</body>
</html>