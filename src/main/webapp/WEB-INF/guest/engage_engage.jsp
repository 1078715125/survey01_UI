<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.atguigu.com/survey/gyx" prefix="gyx" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/res_jsp/base.jsp"%>

</head>
<body>


	<%@include file="/res_jsp/guest_top.jsp"%>

	<div id="mainDiv" class="borderDiv">

		[参与调查]
		<table class="dataTable">
			<tr>
				<th colspan="2">调查的基本信息</th>
			</tr>
			<tr>
				<td><img alt="..."
					src="${sessionScope.currentSurvey.logoPath }" /></td>
				<td>${sessionScope.currentSurvey.surveyName }</td>
			</tr>
		</table>
		<hr color="blue">
		<hr color="blue">

		<form action="guest/engage/engage" method="post">
			<input type="hidden" name="bagId"
				value="${requestScope.currentBag.bagId }" />
			<input type="hidden"
				name="currentIndex" value="${requestScope.currentIndex }" />
			<table class="dataTable">
				<tr>
					<th colspan="2">当前包裹</th>
				</tr>
				<tr>
					<th>${requestScope.currentBag.bagName }</th>
					<td>问题详情</td>
				</tr>

				<tr>
					<td>问题</td>
					<td>
						<table class="dataTableMini">
							<c:forEach items="${requestScope.currentBag.questionSet }"
								var="question">
								<tr>
									<td>${question.questionName }</td>
									<td>
										<%-- 单选题 --%> 
										<c:if test="${question.questionType == 0 }">
											<c:forEach items="${question.optionsArr }" var="option"
												varStatus="status">
												<input type="radio" name="q${question.questionId }"
													value="${status.index }" 
													<gyx:redisplay type="0" bagId="${currentBag.bagId }"
													quesId="q${question.questionId }"
													value="${status.index }"/>
													id="q${question.questionId }${status.index}" />
												<label for="q${question.questionId }${status.index}">${pageScope.option }</label>
											</c:forEach>
										</c:if> 
										<%-- 多选题 --%> 
										<c:if test="${question.questionType == 1 }">
											<c:forEach items="${question.optionsArr }" var="option"
												varStatus="status">
												<input type="checkbox" name="q${question.questionId }"
													value="${status.index }"
													<gyx:redisplay type="1" bagId="${currentBag.bagId }"
													quesId="q${question.questionId }"
													value="${status.index }"/>
													id="q${question.questionId }${status.index}" />
												<label for="q${question.questionId }${status.index}">${option }</label>
											</c:forEach>
										</c:if> 
										<%-- 简答题 --%> 
										<c:if test="${question.questionType == 2 }">
											<input type="text" name="q${question.questionId }"
												class="longInput" 
												value="<gyx:redisplay type="2" bagId="${currentBag.bagId }"
													quesId="q${question.questionId }"/>" />
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<c:if test="${requestScope.currentIndex > 0 }">
							<input type="submit" name="submit_prev" value="返回上一个包裹" />&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${requestScope.currentIndex < sessionScope.baglistSize-1 }">
							<input type="submit" name="submit_next" value="进入下一个包裹" />&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${requestScope.currentIndex == sessionScope.baglistSize-1 }">
							<input type="submit" name="submit_done" value="完成" />&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
						
						<input type="submit" name="submit_quit" value="放弃" />
					</td>
				</tr>
			</table>
		</form>
	</div>

	<%@include file="/res_jsp/guest_bottom.jsp"%>
</body>
</html>