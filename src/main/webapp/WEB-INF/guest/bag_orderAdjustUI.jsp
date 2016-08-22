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
		$(":text").change(function(){
			order = this.value;
			if(order == null || isNaN(order)){
				this.value = this.defaultValue;
				return;
			}
		});
	});
</script>
</head>
<body>
	<%@include file="/res_jsp/guest_top.jsp"%>

	<div id="mainDiv" class="borderDiv">
		[调整包裹顺序]
		<form action="guest/bag/adjustOrder" method="post">
			<input type="hidden" name="surveyId" value="${surveyId}" />
			<table class="dataTable">
				<c:if test="${ex != null }">
					<tr>
						<td colspan="3"><spring:message code="${ex.class.name}" /></td>
					</tr>
				</c:if>

				<c:if test="${empty bagList }">
					<tr>
						<th>暂无包裹可调整</th>
					</tr>
				</c:if>
				<c:if test="${!empty bagList }">
					<tr>
						<th>ID</th>
						<th>名称</th>
						<th>序号</th>
					</tr>
					<c:forEach items="${bagList}" var="bag">
						<tr>
							<td>${bag.bagId }</td>
							<td>${bag.bagName }</td>
							<td><input type="hidden" name="bagIdList"
								value="${bag.bagId}" /> <input type="text" name="bagOrderList"
								class="longInput" value="${bag.bagOrder}" /></td>
						</tr>
					</c:forEach>
				</c:if>
				<tr>
					<td colspan="3"><input type="submit" value="保存"></td>
				</tr>

			</table>
		</form>
	</div>


	<%@include file="/res_jsp/guest_bottom.jsp"%>
</body>
</html>