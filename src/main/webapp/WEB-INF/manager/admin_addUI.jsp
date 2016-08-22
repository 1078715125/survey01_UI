<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/res_jsp/base.jsp"%>

</head>
<body>


	<%@include file="/res_jsp/manager_top.jsp"%>

	<div id="mainDiv" class="borderDiv">
		<h3>[创建管理账号]</h3>
		<form action="manager/admin/saveAdmin" method="post">
			<table class="formTable">
				<c:if test="${ex != null }">
					<tr>
						<td colspan="2"><spring:message code="${ex.class.name }"/></td>
					</tr>
				</c:if>
				<tr>
					<td>管理账号</td>
					<td><input type="text" name="adminName" class="longInput"/></td>
				</tr>
				<tr>
					<td>账号密码</td>
					<td><input type="password" name="adminPwd" class="longInput"/></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="保存"/></td>
				</tr>
			</table>
		
		</form>
	</div>


	<%@include file="/res_jsp/manager_bottom.jsp"%>

</body>
</html>