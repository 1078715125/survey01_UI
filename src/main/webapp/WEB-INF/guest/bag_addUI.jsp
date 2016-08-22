<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/res_jsp/base.jsp"%>
<script type="text/javascript">
	$(function() {

	});
</script>
</head>
<body>
	<%@include file="/res_jsp/guest_top.jsp"%>

	<div id="mainDiv" class="borderDiv">
		[创建调查包裹]
		<form action="guest/bag/saveBag" method="post">
			<input type="hidden" name="survey.surveyId" value="${surveyId }" />
			<table class="formTable">
				<%-- 				<c:if test="${ex != null }"> --%>
				<!-- 					<tr> -->
				<%-- 						<td colspan="2"><spring:message code="${ex.class.name}" /></td> --%>
				<!-- 					</tr> -->
				<%-- 				</c:if> --%>
				<tr>
					<td>包裹名称</td>
					<td><input name="bagName" class="longInput" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="保存"></td>
				</tr>

			</table>
			</form>
	</div>


	<%@include file="/res_jsp/guest_bottom.jsp"%>
</body>
</html>