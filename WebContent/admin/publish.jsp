<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品发布信息维护</title>
<link href="css/user.css" rel="Stylesheet" type="text/css" />
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript">
	function queryPublish(){
		document.form1.submit();
	}
	
	function deletePublish(){
		var c = document.getElementsByName("check");
		var array = new Array();
		var checked = false;
		for(var i=0; i<c.length; i++){
			if(c[i].checked){
				array.push(c[i].value);
				checked = true;
			}
		}
		if(!checked){
			alert("请至少选择一个要删除的发布产品！");
		}
		else{
			window.location.href="deletePublish.action?deletePublishArray=" + array.toString();
		}
	}
</script>
</head>
<body>
<jsp:include page="header.jsp" />

<%@ taglib prefix="s" uri="/struts-tags" %>
<h2 align="left">产品发布信息维护</h2>
<form name="form1" id="form1" action="queryPublishByPage.action" method="post">
<table  id="table1"  class="one"  rules="all" align="center" width="80%">
	<tr>
		<td width="15%">产品类型</td>
		<td width="35%">
			<select name="publishProductCatQ" style="width:90%">
				<option>请选择...</option>
				<option>汽车</option>
				<option>电视机</option>
				<option>笔记本</option>
				<option>台式电脑</option>
				<option>手机</option>
				<option>游戏机</option>
				<option>沙发</option>
				<option>餐桌</option>
			</select>
		</td>
		<td width="15%">经销商</td>
		<td width="35%">
		<input type="text" name="publishDealerQ" maxlength="50" style="width:88%"/>
		</td>
	</tr>
	<tr>
		<td width="15%">产品条形码</td>
		<td width="35%">
			<input type="text" name="publishSerialQ" maxlength="50" style="width:88%"/>
		</td>
		<td width="15%">产品名</td>
		<td width="35%">
			<input type="text" name="publishProductNameQ" maxlength="50" style="width:88%"/>
		</td>
	</tr>
</table>

<table class="one1" align="center" width="40%" style="margin-top:2px;">
	<tr style="width:100%">
		<td><input type="button" name="query" value="查询" style="width:80%" onclick="queryPublish();" /></td>
		<td><input type="button" name="add" value="增加" style="width:80%" onclick="javascript:window.location.href='publishInit.action';" /></td>
		<td><input type="button" name="delete" value="删除" style="width:80%" onclick="if(confirm('确定要删除所选的发布产品吗？')){deletePublish();}"/></td>
	</tr>
</table>
</form>

<hr />
<table rules="cols" align="center" width="90%" style="margin-top:2px;">
	<tr style="background:#CFDEFF;">
		<th></th>
		<th>产品类型</th>
		<th>产品条形码</th>
		<th>产品名</th>
		<th>经销商</th>
		<th>描述</th>
	</tr>
	<s:iterator id="pub" value="pageBeanPublish.list">
		<tr>
			<td><input type="checkbox" name="check" value="${pub[5]}"/></td>
			<td><s:property value="#pub[0]" /></td>
			<td><s:property value="#pub[1]" /></td>
			<td><s:property value="#pub[2]" /></td>
			<td><s:property value="#pub[3]" /></td>
			<td><s:property value="#pub[4]" /></td>
		</tr>
	</s:iterator>
	 
</table>
<div style="margin-top: 10px">
<table align="center" >
 <tr style="color:black">
 		<td>
 		  总共: <s:property value="pageBeanPublish.allRow"/> 条记录
 		</td> <td>&nbsp;&nbsp;</td> 
 	  	<td>
 	  	共：<s:property value="pageBeanPublish.totalPage"/>页
 	  	</td><td>&nbsp;&nbsp;</td>
 	  	<td>
 	  	当前第 <s:property value="pageBeanPublish.currentPage"/>页
 	  	</td><td>&nbsp;&nbsp;</td>
 	  	<td>
 	  		<s:if test="%{pageBeanPublish.currentPage == 1}">
 	  			第一页 上一页
 	  		</s:if>
 	  		<s:else>
 	  			<a href="queryPublishByPage.action?pagePublish=1">第一页</a>
 	  			<a href="queryPublishByPage.action?pagePublish=<s:property value="%{pageBeanPublish.currentPage-1}"/>">上一页</a>
 	  		</s:else>
 	  	</td><td>&nbsp;&nbsp;</td>
 	  	<td>
 	  		<s:if test="%{pageBeanPublish.currentPage != pageBeanPublish.totalPage}">
 	  			<a href="queryPublishByPage.action?pagePublish=<s:property value="%{pageBeanPublish.currentPage+1}"/>">下一页</a>
 	  			<a href="queryPublishByPage.action?pagePublish=<s:property value="%{pageBeanPublish.totalPage}"/>">最后一页</a>
 	  		</s:if>
 	  	     <s:else>
 	  	     	下一页 最后一页
 	  	     </s:else>
 	  	</td>
 	  </tr>

</table>

</div>

<jsp:include page="footer.jsp" />
</body>
</html>