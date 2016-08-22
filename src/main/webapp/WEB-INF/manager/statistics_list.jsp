<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/res_jsp/base.jsp"%>

</head>
<body>


	<%@include file="/res_jsp/manager_top.jsp"%>

	<div id="mainDiv" class="borderDiv">
		<h3>[显示所有已完成调查]</h3>
		<table class="dataTable">
			<c:if test="${empty page.list }">
				<tr>
					<th>暂时没有已完成调查</th>
				</tr>
			</c:if>
			<c:if test="${!empty page.list }">
				<tr>
					<th>调查名称</th>
					<th>查看大纲</th>
					<th>导出数据</th>
				</tr>
				<c:forEach items="${page.list }" var="survey">
					<tr>
						<td>${survey.surveyName }</td>
						<td><a href="manager/statistics/showSummary/${survey.surveyId}">显示调查问题大纲</a></td>
						<td><a href="manager/statistics/exportExcel/${survey.surveyId}">导出EXCEL文件</a></td>
					</tr>
				</c:forEach>
				<%--显示页码 --%>
				<tr>
					<td colspan="3">
						<c:set value="manager/statistics/showAllSurvey" var="pageUrl" scope="page"/>
						<%@ include file="/res_jsp/navigator.jsp" %>
					</td>
				</tr>
			</c:if>
		</table>

	</div>


	<%@include file="/res_jsp/manager_bottom.jsp"%>

</body>
</html>