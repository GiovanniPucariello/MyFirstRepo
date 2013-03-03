<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="s" uri="/struts-tags"%>
   <body>
	<s:if test="hasFieldErrors()">
		<s:iterator value="fieldErrors">
			<s:iterator value="value" status="statu">
				<s:set name="index" value="#statu.index"/>
				<s:set name="msg" value="#msg==null?'':#msg+
				value.get(#request.index).toString()+'///n'"/>
			 </s:iterator>
		</s:iterator>
	</s:if>

	<s:if test="hasActionErrors()">
		<s:iterator value="actionErrors">
		       <script  language="JavaScript">
				alert("<s:property escape="false"/>");
		       </script>
	        </s:iterator>
	</s:if>

	<s:if test="hasActionMessages()">
		<s:iterator value="actionMessages">
			<script language="JavaScript">
				alert("<s:property escape="false"/>");
			</script>
		</s:iterator>
	 </s:if>

	<s:if test="#msg.length()>0">
		<script language="JavaScript">
			alert("<s:property escape='false' value='#msg'/>");
		</script>
	</s:if>
	</body>
</html>