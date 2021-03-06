<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/res_jsp/base.jsp"%>
<script type="text/javascript">
	$(function() {

		$(":submit").click(function() {

			var userName = $("#userName").val();
			var pwd = $(":password[name='userPwd']").val();

			if (userName == null || userName == "") {
				alert("您的用户名不能为空，请输入！");
				$(":password").val("");
				return false;
			}
			if (pwd == null || pwd == "") {
				alert("您的密码不能为空，请输入！");
				$(":password").val("");
				return false;
			}

		});

	});
</script>
</head>
<body>
	<%@include file="/res_jsp/guest_top.jsp"%>

	<div id="mainDiv" class="borderDiv">
		[用户登录]
		<form action="guest/user/login" method="post">

			<table class="formTable">
				<c:if test="${ex != null }">
					<tr>
						<td colspan="2"><spring:message code="${ex.class.name}" /></td>
					</tr>
				</c:if>
				<tr>
					<td>用户名</td>
					<td><input type="text" name="userName" class="longInput"
						id="userName"></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><input type="password" name="userPwd" class="longInput"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="登录"></td>
				</tr>

			</table>
		</form>


	</div>


	<%@include file="/res_jsp/guest_bottom.jsp"%>
</body>
</html>