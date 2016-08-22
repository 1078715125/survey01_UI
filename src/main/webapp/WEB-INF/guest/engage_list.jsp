<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/res_jsp/base.jsp"%>

</head>
<body>


	<%@include file="/res_jsp/guest_top.jsp"%>

	<div id="mainDiv" class="borderDiv">

		[亲，选择调查吧]

		<table class="dataTable">
			<c:if test="${empty page.list}">
				<tr>
					<th>暂无调查可用。。。</th>
				</tr>
			</c:if>
			<c:if test="${!empty page.list}">
				<tr>
					<th>logo</th>
					<th>调查名称</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${page.list }" var="survey">
					<tr>
						<td><img alt="..." src="${survey.logoPath }"></td>
						<td>${survey.surveyName }</td>
						<td><a href="guest/engage/entry/${survey.surveyId}">进入调查</a></td>
					</tr>
				</c:forEach>

				<tr>
					<td colspan="3"><c:set
							value="guest/engage/showAllAvailableSurvey" var="pageUrl"
							scope="page" /> <%@include file="/res_jsp/navigator.jsp"%>
					</td>

				</tr>


			</c:if>
		</table>

	</div>


	<%@include file="/res_jsp/guest_bottom.jsp"%>

</body>
</html>