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

		$(".del").click(function() {
			var surName = $(this).parents("tr").children("td:eq(1)").text();
			return confirm("确认要删除 [" + surName + "] 的调查吗？");
		});

	});
</script>
</head>
<body>
	<%@include file="/res_jsp/guest_top.jsp"%>

	<div id="mainDiv" class="borderDiv">
		[我未完成调查]
		<table class="dataTable">
			<%-- 				<c:if test="${ex != null }"> --%>
			<!-- 					<tr> -->
			<%-- 						<td colspan="2"><spring:message code="${ex.class.name}" /></td> --%>
			<!-- 					</tr> -->
			<%-- 				</c:if> --%>
			<c:if test="${empty page.list}">
				<tr>
					<th colspan="2">暂时没有未完成的调查</th>
				</tr>
			</c:if>

			<c:if test="${!empty page.list}">
				<tr>
					<th>调查ID</th>
					<th>调查名称</th>
					<th>logo图片</th>
					<th colspan="3">操作</th>
				</tr>
				<c:forEach items="${page.list}" var="survey">

					<tr>
						<td>${survey.surveyId }</td>
						<td>${survey.surveyName }</td>
						<td><img alt="..." src="${survey.logoPath }"></td>
						<td><a href="guest/survey/toDesignSurvey/${survey.surveyId }">设计</a></td>
						<td><a href="guest/survey/toUpdateMyUncompletedSurvey/${survey.surveyId }/${page.pageNo}">更新</a></td>
						<td><a
							href="guest/survey/removeMyUncompletedSurvey/${survey.surveyId }"
							class="del">删除</a></td>
					</tr>
				</c:forEach>
				<tr>
					<%-- 显示页码 --%>
					<td colspan="6"><c:set
							value="guest/survey/showMyUncompletedSurvey" var="pageUrl"
							scope="page" /> <%@include file="/res_jsp/navigator.jsp"%>
					</td>
				<tr>
			</c:if>
		</table>


	</div>


	<%@include file="/res_jsp/guest_bottom.jsp"%>
</body>
</html>