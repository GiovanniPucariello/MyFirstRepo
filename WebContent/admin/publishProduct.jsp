<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布产品</title>
<link rel="stylesheet" type="text/css" href="css/main_style.css" media="screen">
<script type="text/javascript">

	/* 限制textarea长度 使用方法在textarea标签上加上 maxlength="XX"长度属性 */
	function isMaxLen(o) {
		var nMaxLen = o.getAttribute ? parseInt(o.getAttribute("maxlength"))
				: "";
		if (o.getAttribute && o.value.length > nMaxLen) {
			o.value = o.value.substring(0, nMaxLen)
		}
	}

	function publish() {
		var dealer = document.form1.publishDealer.value;
		var product = document.form1.publishProduct.value;
		if (dealer.trim() == "请选择..." || product.trim() == "请选择...") {
			alert("请先选择经销商与产品！");
		} else {
			document.form1.submit();
		}
	}
</script>
</head>
<body>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="header.jsp" />
	<form name="form1" action="publish.action" method="post">
		<h2 align="left">发布产品</h2>
		<table align="center" class="one" rules="all" width="70%">
			<tr>
				<td width="20%">经销商</td>
				<td width="80%">
				<select name="publishDealer" style="width:70%">
					<option>请选择...</option>
					<s:iterator id="dd" value="dList">
					<option>
						<s:property value="name" /></option>
					</s:iterator>
				</select>
				</td>
			</tr>
			<tr>
				<td width="20%">产品</td>
				<td width="80%">
				<select name="publishProduct" style="width:70%">
					<option>请选择...</option>
					<s:iterator id="dd" value="pList">
					<option>
						<s:property value="productName" /></option>
					</s:iterator>
				</select>
				</td>
			</tr>
			<tr>
				<td>描述信息</td>
				<td>
					<textarea name="publishDescription" cols="40" rows="10" maxlength="50"  >
					</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2"  align="center" >
				<input type="reset" name="reset" value="重置" />
				<input type="button" name="qrole" value="查看已发布信息" onclick="javascript:window.location.href='queryPublishByPage.action'" />
				<input type="button" name="save" value="发布" onclick="publish()"/>
				</td>
			</tr>
		</table>
	</form>
	
<jsp:include page="footer.jsp" />
</body>
</html>