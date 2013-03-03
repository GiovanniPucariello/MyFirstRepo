<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改产品信息页面</title>
<link rel="stylesheet" type="text/css" href="css/main_style.css" media="screen">
<script src="js/jsdate.js" type="text/javascript"></script>

<script type="text/javascript">

	/* 限制textarea长度 使用方法在textarea标签上加上 maxlength="XX"长度属性 */
	function isMaxLen(o) {
		var nMaxLen = o.getAttribute ? parseInt(o.getAttribute("maxlength"))
				: "";
		if (o.getAttribute && o.value.length > nMaxLen) {
			o.value = o.value.substring(0, nMaxLen)
		}
	}
	
</script>

</head>
<body>
<jsp:include page="header.jsp" />
	<%@ taglib prefix="s" uri="/struts-tags" %>
	<%
		String pName = request.getParameter("pName");
		String productCat=request.getParameter("productCat");
		String serialNum=request.getParameter("serialNum");
		String lot=request.getParameter("lot");
		String manufactureDate=request.getParameter("manufactureDate");
		String validityDate=request.getParameter("validityDate");
		String description=request.getParameter("description");
		String price=request.getParameter("price");
		String pid = request.getParameter("pid");

		String catNum = "0";
		
		if(pid == null){
			pid = "";
		}else{
			pid = new String(pid.getBytes("iso-8859-1"),"UTF-8");
		}
		if (pName == null) {
			pName = "";
		}else {
			pName = new String(pName.getBytes("iso-8859-1"), "UTF-8");
		}
		if (productCat == null) {
			productCat = "";
		}else {
			productCat = new String(productCat.getBytes("iso-8859-1"), "UTF-8");
		}
		if (lot == null) {
			lot = "";
		}else {
			lot = new String(lot.getBytes("iso-8859-1"), "UTF-8");
		}
		
		if (manufactureDate == null) {
			manufactureDate = "";
		}else {
			manufactureDate = new String(manufactureDate.getBytes("iso-8859-1"), "UTF-8");
		}
		
		if (validityDate == null) {
			validityDate = "";
		}else {
			validityDate = new String(validityDate.getBytes("iso-8859-1"), "UTF-8");
		}
		
		if (description == null) {
			description = "";
		}else {
			description = new String(description.getBytes("iso-8859-1"), "UTF-8");
		}
		
		if (price == null) {
			price = "";
		}else {
			price = new String(price.getBytes("iso-8859-1"), "UTF-8");
		}
		
		if("汽车".equals(productCat)) {
			catNum = "1";
		}
		if("电视机".equals(productCat)) {
			catNum = "2";
		}
		if("笔记本".equals(productCat)) {
			catNum = "3";
		}
	    if("台式电脑".equals(productCat)) {
			catNum = "4";
		}
		if("手机".equals(productCat)) {
			catNum = "5";
		}
		if("游戏机".equals(productCat)) {
			catNum = "6";
		}
		if("沙发".equals(productCat)) {
			catNum = "7";
		}
		if("餐桌".equals(productCat)) {
			catNum = "8";
		}
		
	%>	
	<form name="addForm" action="modifyProduct.action" method="post">
	<h2 align="left">修改产品信息</h2>
	<table align="center" class="one" width="70%">
			<tr>
				<td width="13%">产品ID</td>
				<td width="37%">
					<input type="text" name="productId" value="<%=pid %>" readonly="readonly" maxlength="20" style="width: 80%"/>
				</td>
				<td width="13%">产品名</td>
				<td width="37%">
					<input type="text" name="productName" readonly="readonly" id="productName"
					value="<%=pName%>" maxlength="50" style="width: 80%" /></td>
			</tr>
			<tr>
			<td width="13%">产品条形码</td>
				<td width="37%">
					<input type="text" name="productSerialNum" readonly="readonly" value="<%=serialNum%>" id="serialNum"
					maxlength="50" style="width: 80%" /></td>
					
				<td width="13%">产品价格</td>
				<td width="37%">
					<input type="text" name="price" value="<%=price%>" id="price"
					maxlength="50" style="width: 80%" /></td>
			</tr>
			<tr>
			<td width="13%">产品类别</td>
				<td width="37%">
				<s:set name="cNum" value="<%=catNum %>"></s:set>
			<select name="productCatSelect" id="productCatSelect" style="width: 80%">
				<option
					<s:if test="${cNum==0}">
						selected='selected'
					</s:if>
				>请选择...</option>
				<option
					<s:if test="${cNum==1}">
						selected='selected'
					</s:if>
				>汽车</option>
				<option
					<s:if test="${cNum==2}">
						selected='selected'
					</s:if>
				>电视机</option>
				<option
					<s:if test="${cNum==3}">
						selected='selected'
					</s:if>
				>笔记本</option>
				<option
					<s:if test="${cNum==4}">
						selected='selected'
					</s:if>
				>台式电脑</option>
				<option
					<s:if test="${cNum==5}">
						selected='selected'
					</s:if>
				>手机</option>
				<option
					<s:if test="${cNum==6}">
						selected='selected'
					</s:if>
				>游戏机</option>
				<option
					<s:if test="${cNum==7}">
						selected='selected'
					</s:if>
				>沙发</option>
				<option
					<s:if test="${cNum==8}">
						selected='selected'
					</s:if>
				>餐桌</option>
				</select>
				</td>
				<td width="13%">产品批次</td>
				<td width="37%" >
					<input type="text" name="productLot" id="productLot"
					value="<%=lot%>" maxlength="20" style="width: 80%" /></td>
			</tr>
			<tr>
				<td width="13%">生产日期</td>
				<td colspan="3" width="37%" align="left">
				&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="manufactureDate" id="manufactureDate"
					value="<%=manufactureDate%>" maxlength="20" size="35" onclick="SelectDate(this,'yyyy-MM-dd')" /></td>
			</tr>
			<tr>
				<td width="13%">有效期</td>
				<td colspan="3" width="37%" align="left">
				&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="validityDate" id="validityDate"
					value="<%=validityDate%>" maxlength="20" size="35" onclick="SelectDate(this,'yyyy-MM-dd')" /></td>
			</tr>
			<tr>
				<td width="13%">描述</td>
				<td colspan="3">
					<textarea name="productDescription"  style="width:91%;height:80px" maxlength="50" ><%=description%>
					</textarea>
				</td>
			</tr>
		<tr align="center">
			<td colspan="4">
				<br/>
				<input type="reset" name="reset" value="重置" />
				<input type="button" name="return1" value="查看产品信息" 
					 onclick="window.location.href='queryProductByPage.action';" />
				<input type="submit" name="save" value="更新产品信息"/>
			</td>
		</tr>
</table>
</form>
<jsp:include page="footer.jsp" />
</body>
</html>