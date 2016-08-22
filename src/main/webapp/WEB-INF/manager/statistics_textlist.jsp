<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/res_jsp/base.jsp"%>
<script type="text/javascript">
	$(function(){
		
		$("button").click(function(){
			
			window.history.back();
		});
	});
</script>
</head>
<body>


	<%@include file="/res_jsp/manager_top.jsp"%>

	<div id="mainDiv" class="borderDiv">
		<h2>["${question.questionName }"的统计结果]</h2>

		<table class="dataTable">
			<c:if test="${empty textList }">
				<tr>
					<th>暂时没有答题数据</th>
				</tr>
			</c:if>
			<c:if test="${!empty textList }">
				<tr>
					<th colspan="2">答题详情</th>
				</tr>

				<c:forEach items="${textList }" var="text" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${text }</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<th colspan="2"><button>返回上一页</button></th>
			</tr>
		</table>
	</div>


	<%@include file="/res_jsp/manager_bottom.jsp"%>

</body>
</html>