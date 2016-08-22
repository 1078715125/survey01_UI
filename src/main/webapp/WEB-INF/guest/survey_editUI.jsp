<%@page import="com.atguigu.survey.entity.guest.Survey"%>
<%@page import="com.atguigu.survey.utils.GlobalNames"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
		[更新调查]
		<form:form action="guest/survey/updateSurvey" method="post"
			enctype="multipart/form-data" modelAttribute="survey">
			<form:hidden path="surveyId"/>
			<form:hidden path="logoPath"/>
			<input type="hidden" name="pageNo" value="${pageNo }"/>
			<table class="formTable">
				<c:if test="${ex != null }">
					<tr>
						<td colspan="2"><spring:message code="${ex.class.name}" /></td>
					</tr>
				</c:if>
				<tr>
					<td>调查名称</td>
					<td><form:input path="surveyName" cssClass="longInput"/></td>
				</tr>
				<tr>
					<td>当前logo图片</td>
					<td><img alt="" src="${survey.logoPath }"></td>
				</tr>
				<tr>
					<td>新的logo图片</td>
					<td><input type="file" name="logoFile" class="longInput"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="修改"></td>
				</tr>

			</table>
		</form:form>


	</div>


	<%@include file="/res_jsp/guest_bottom.jsp"%>
</body>
</html>