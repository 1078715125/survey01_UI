<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/res_jsp/base.jsp"%>
<script type="text/javascript">
	$(function() {

		$(".del").click(function() {
			var name = $(this).parents("tr").children("td:first").text();
			return confirm("确定要删除 【" + name + "】 这个调查包裹吗？");
		});

		$(".delQue").click(function() {
			var name = $(this).parents("tr").children("td:first").text();
			return confirm("确定要删除 【" + name + "】 这个问题吗？");
		});

	});
</script>
</head>
<body>
	<%@include file="/res_jsp/guest_top.jsp"%>
	<div id="mainDiv" class="borderDiv">
		<h3>[设计调查]</h3>
		<table class="dataTable">
			<tr>
				<th colspan="6">调查基本信息</th>
			</tr>
			<tr>
				<td><img alt="..." src="${requestScope.survey.logoPath}"></td>
				<td>${requestScope.survey.surveyName}</td>
				<td><a href="guest/bag/toAddUI/${survey.surveyId }">创建包裹</a></td>
				<td><a href="guest/bag/toOrderAdjustUI/${survey.surveyId }">调整包裹的顺序</a></td>
			</tr>
		</table>
		<hr color="blue" />
		<hr color="blue" />
		<table class="dataTable">
			<c:if test="${empty requestScope.survey.bagSet }">
				<tr>
					<th>暂无包裹</th>
				</tr>
			</c:if>
			<c:if test="${!empty requestScope.survey.bagSet }">
				<tr>
					<th colspan="2">包裹信息</th>
				</tr>
				<c:forEach items="${requestScope.survey.bagSet}" var="bag">
					<tr>
						<td><font color="rgb(244,239,32)">${bag.bagName }</font></td>
						<td><a class="del" href="guest/bag/removeBag/${bag.bagId }">删除包裹</a>
							<a href="guest/bag/toEditUI/${bag.bagId }">更新包裹</a> <a
							href="guest/bag/toTargetSurveyUI/${bag.bagId}/${survey.surveyId}"
							style="color: green;">移动/复制包裹</a> <a
							href="guest/question/toAddUI/${bag.bagId }/${requestScope.survey.surveyId}">创建问题</a>
						</td>
					</tr>
					<tr>
						<th>|--问题</th>
						<td align="center">
							<table class="dataTableMini">
								<c:if test="${empty bag.questionSet}">
									<tr align="center">
										<th>暂无问题</th>
									</tr>
								</c:if>
								<c:if test="${!empty bag.questionSet}">
									<c:forEach items="${bag.questionSet}" var="question">
										<tr>
											<td hidden="true">${question.questionName}</td>
											<td>${question.questionName}:
											<%-- 问题类型 --%> 
											<c:if test="${question.questionType == 0}">
												<c:forEach items="${question.optionsArr }" var="option" varStatus="status">
													<input type="radio" name="q${question.questionId}" 
													id="q${question.questionId}${status.index}" />
													<label for="q${question.questionId}${status.index}">${option }</label>
												</c:forEach>
											</c:if> 
											<c:if test="${question.questionType == 1}">
												<c:forEach items="${question.optionsArr }" var="option" varStatus="status">
													<input type="checkbox" name="q${question.questionId}" 
													id="q${question.questionId}${status.index}" />
													<label for="q${question.questionId}${status.index}">${option }</label>
												</c:forEach>
											</c:if> 
											<c:if test="${question.questionType == 2}">
												<input class="longInput" />
											</c:if>
											</td>
											<td><a class="delQue"
												href="guest/question/removeQuestion/${question.questionId }">删除问题</a>
												<a
												href="guest/question/toEditUI/${question.questionId }/${requestScope.survey.surveyId}">更新问题</a>
											</td>
										</tr>
									</c:forEach>
								</c:if>

							</table>
						</td>
					</tr>
					<tr>
						<th colspan="2"><hr color="red" style="border-style: dashed;" />
						<th>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="2"><a href="guest/survey/complete/${survey.surveyId}">完成调查</a></td>
			</tr>
		</table>

	</div>


	<%@include file="/res_jsp/guest_bottom.jsp"%>

</body>
</html>