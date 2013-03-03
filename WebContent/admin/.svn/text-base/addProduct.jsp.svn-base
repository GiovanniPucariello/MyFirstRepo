<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品信息增加</title>
<link href="css/user.css" rel="Stylesheet" type="text/css" />
<script type="text/javascript" src="js/js.js"></script>
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

function addProduct(){
	var productName = document.form1.productName.value;
	var productCatSelect = document.form1.productCatSelect.value;
	var productSerialNum = document.form1.productSerialNum.value;
	var manufactureDate = document.form1.manufactureDate.value;
	var validityDate = document.form1.validityDate.value;
	var price = document.form1.price.value;
	
	if(productName.trim()==""){
		alert("请输入产品名!")
	}
	else if(productCatSelect=="请选择..."){
		alert("请选择产品类别！");
	}
	else if(productSerialNum.trim()==""){
		alert("请输入产品条码号!");
	}
	else if((/^[A-Za-z0-9]*$/).test(productSerialNum)==false){
		alert("产品条形码只能输入字母和数字");
	}
	else if(manufactureDate.trim()==""){
		alert("请输入产品生产日期!");
	}
	else if(validityDate.trim()==""){
		alert("请输入产品有效期!");
	}
	else if( price.match(/^([1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0)$/)== null ){
		alert("价格输入错误，请输入正确数字，精确到小数位，例如：113.2 ");
	}
	else if(price <= 0) {
		alert("价格输入错误，请输入正确数字，例如：113.02 ");
	}
	else{
		document.form1.submit();
	}
}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%@ taglib prefix="s" uri="/struts-tags"%>
	<h2 align="left">产品信息增加</h2>
	<form name="form1" action="addProduct.action" method="post">
		<table id="table1" class="one" rules="all" align="center" width="80%">
			<tr>
				<td width="13%">产品名</td>
				<td width="37%">
					<input type="text" name="productName" id="productName"
					maxlength="50" style="width: 80%" /></td>
				<td width="13%">产品条形码</td>
				<td width="37%">
					<input type="text" name="productSerialNum" id="productSerialNum"
					maxlength="50" style="width: 80%" /></td>
			</tr>
			<tr>
				<td width="13%">产品价格</td>
				<td width="37%">
					<input type="text" name="price" id="price"
					maxlength="50" style="width: 80%" /></td>
				<td width="13%">产品类别</td>
				<td width="37%">
				<select name="productCatSelect" style="width: 80%">
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
			</tr>
			<tr>
				<td width="13%">产品批次</td>
				<td colspan="3" width="37%" align="left">
				&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="productLot" id="productLot"
					maxlength="20" size="35" /></td>
			</tr>
			<tr>
				<td width="13%">生产日期</td>
				<td colspan="3" width="37%" align="left">
				&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="manufactureDate" id="manufactureDate"
					maxlength="20" size="35" onclick="SelectDate(this,'yyyy-MM-dd')" /></td>
			</tr>
			<tr>
				<td width="13%">有效期</td>
				<td colspan="3" width="37%" align="left">
				&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="validityDate" id="validityDate"
					maxlength="20" size="35" onclick="SelectDate(this,'yyyy-MM-dd')" /></td>
			</tr>
			<tr>
				<td width="13%">描述</td>
				<td colspan="3">
					<textarea name="productDescription"  style="width:91%;height:80px" maxlength="50" >
					</textarea>
				</td>
			</tr>
		</table>
		<table  class="one1" align="center" width="40%" style="margin-top: 2px;">
			<tr style="width: 100%">
				<td><input type="reset" class="one" name="reset" value="重置"
					style="width: 40%" onclick="" />
				</td>
				<td><input type="button" name="add" value="增加"
					style="width: 40%" onclick="addProduct()" />
				</td>
			</tr>
		</table>
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>