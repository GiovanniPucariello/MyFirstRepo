<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>经销商管理页面</title>
</head>

<script type="text/javascript">
	function queryDealer() {
			document.queryDealerForm.submit();
	}
	
	function deleteDealer(){
		var c = document.getElementsByName("radio");
		var did;
		var checked = false;
		for(var i=0; i<c.length; i++){
			if(c[i].checked){
				did = c[i].value;
				checked = true;
			}
		}
		if(!checked){
			alert("请先选择一个要删除的经销商！");
		}
		else{
			window.location.href="deleteDealer.action?dealerId=" + did;
		}
	}
	
	function modifyDealer(){
		var dname = document.getElementsByName("d1");
		var daddress = document.getElementsByName("d2");
		var ddescription = document.getElementsByName("d3");
		var c = document.getElementsByName("radio");
		
		var did = 1;
		var dna;
		var dad;
		var dde;

		var checked = false;
		for(var i=0; i<c.length; i++){
			if(c[i].checked){
				checked = true;
				did = c[i].value;
				dna = dname[i].value;
				dad = daddress[i].value;
				dde =ddescription[i].value;
			}
		}
		if(!checked){
			alert("请至少选择一个要修改的经销商！");
		}
		else{
			window.location.href="modifyDealer.jsp?dealerId=" + did + "&dealerName=" + dna
				+"&dealerAddress="+dad + "&dealerDescription=" + dde;
		
		}
	}
</script>

<body>
<jsp:include page="header.jsp" />
	<h2 align="left">经销商信息维护</h2>
	<form name="queryDealerForm" action="queryDealer.action" method="post">
	<table align="center"  class="one" rules="all" width="80%">
		<tr>
			<td>经销商名称</td>
			<td width="50%"><input type="text" name="dealerName" style="width:80%" /></td>
			<td align="center">
			<input type="button" name="query" value="查询" onclick="queryDealer()" /> 
			<input type="button" name="add" value="增加" onclick="javascript:window.location.href='addDealer.jsp';" /> 
			<input type="button" name="modify" value="修改" onclick="modifyDealer();" /> 
			<input type="button" name="delete" value="删除" onclick="if(confirm('确定要删除所选经销商吗？')){deleteDealer();}" /> 
			</td>
		</tr>
	</table>
	
	<br/>
	<hr />
	
	<table rules="cols" align="center" width="80%">
		<tr style="background:#CFDEFF;">
			<th></th>
			<th>经销商名称</th>
			<th>经销商地址</th>
			<th>经销商描述</th>
		</tr>
		<s:iterator id="dealer" value="dealerList">
			<s:hidden name="d1" value="${dealer.name}" id="d1"></s:hidden>
			<s:hidden name="d2" value="${dealer.address}" id="d2"></s:hidden>
			<s:hidden name="d3" value="${dealer.description}" id="d3"></s:hidden>
			<tr>
				<td><input type="radio" name="radio" id="radio" value="${dealer.id}" /></td>
				<td><s:property value="name" /></td>
				<td><s:property value="address" /></td>
				<td><s:property value="description" /></td>
			</tr>
		</s:iterator>
	</table>
	</form>
	
	<jsp:include page="footer.jsp" />
</body>
</html>

