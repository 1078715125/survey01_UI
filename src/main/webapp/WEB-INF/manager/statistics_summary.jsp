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
		<h3>[调查大纲]</h3>
		<table class="dataTable">
			<tr>
				<td><img alt="..." src="${survey.logoPath}"></td>
				<th>[调查名称：${survey.surveyName }]</th>
			</tr>
		</table>
		<hr color="red">
		<hr color="blue">
		<hr color="red">
		<table class="dataTable">
				<tr>
					<th colspan="2">包裹列表</th>
				</tr>
				<tr></tr>
				<tr></tr>
			<c:forEach items="${survey.bagSet }" var="bag">
				<tr>
					<th>${bag.bagName }</th>
					<td>统计结果</td>
				</tr>
				<tr>
					<td>问题列表</td>
					<td>
						<table class="dataTableMini">
							<c:forEach items="${bag.questionSet }" var="question">
								<tr>
									<td>${question.questionName }</td>
									<td>
										<c:if
											test="${question.questionType==0 || question.questionType==1 }">
											<img alt="..." src="manager/statistics/generateChart/${question.questionId}">
										</c:if>
										<c:if test="${question.questionType==2 }">
											<a
												href="manager/statistics/showTextList/${question.questionId}">以列表形式查看结果</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr><th colspan="2"><hr color="blue"></th></tr>
			</c:forEach>
		</table>

	</div>


	<%@include file="/res_jsp/manager_bottom.jsp"%>

</body>
</html>