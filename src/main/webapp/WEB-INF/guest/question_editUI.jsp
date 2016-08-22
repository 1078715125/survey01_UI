<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/res_jsp/base.jsp"%>
<script type="text/javascript">
	$(function() {
		var type = $(":radio:checked").val();
		if (type == 2) {
			$("textarea").parents("tr").hide();
		} else {
			$("textarea").parents("tr").show();
		}

		$(":radio").click(function() {
			var type = this.value;
			if (type == 2) {
				$("textarea").parents("tr").hide();
			} else {
				$("textarea").parents("tr").show();
			}
		});
	});
</script>
</head>
<body>
	<%@include file="/res_jsp/guest_top.jsp"%>

	<div id="mainDiv" class="borderDiv">
		[更新问题]
		<form:form action="guest/bag/updateQuestion" method="post"
			modelAttribute="question">
			<form:hidden path="questionId" />
			<form:hidden path="bag.bagId" />
			<input type="hidden" name="surveyId" value="${surveyId }" />
			<table class="formTable">
				<tr>
					<td>问题名称</td>
					<td><form:input path="questionName" cssClass="longInput" /></td>
				</tr>
				<tr>
					<td>问题类型</td>
					<td><form:radiobuttons path="questionType" items="${type }" /></td>
				</tr>
				<tr>
					<td>问题选项</td>
					<td><textarea name="options" class="multiInput">${question.optionsForEdit }</textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="更新"></td>
				</tr>
			</table>
		</form:form>
	</div>


	<%@include file="/res_jsp/guest_bottom.jsp"%>
</body>
</html>