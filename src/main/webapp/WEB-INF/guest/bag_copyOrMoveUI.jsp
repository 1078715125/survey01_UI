<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/res_jsp/base.jsp"%>

</head>
<body>

	<%@include file="/res_jsp/guest_top.jsp"%>

	<div id="mainDiv" class="borderDiv">
		[选择一个目标调查]
		<table class="dataTable">
			<%-- 			<c:if test="${ex != null }"> --%>
			<!-- 				<tr> -->
			<%-- 					<td colspan="3"><spring:message code="${ex.class.name}" /></td> --%>
			<!-- 				</tr> -->
			<%-- 			</c:if> --%>

			<tr>
				<th>调查名称</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${page.list}" var="survey">
				<tr>
					<td>${survey.surveyName}</td>
					<td><c:if test="${survey.surveyId == surveyId}">
							当前调查
						</c:if> <c:if test="${survey.surveyId != surveyId}">
							<a href="guest/bag/moveToThisSurvey/${bagId}/${survey.surveyId}">移动到当前调查</a>
							<a href="guest/bag/copyToThisSurvey/${bagId}/${survey.surveyId}">复制到当前调查</a>
						</c:if></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="2"><c:set
						value="guest/bag/toTargetSurveyUI/${bagId}/${surveyId}"
						var="pageUrl" scope="page" /> <%@ include
						file="/res_jsp/navigator.jsp"%></td>
			</tr>
		</table>
	</div>


	<%@include file="/res_jsp/guest_bottom.jsp"%>

</body>
</html>