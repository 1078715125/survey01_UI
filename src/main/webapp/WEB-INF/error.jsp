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

		$("button").click(function() {

			window.history.back();

		});

	})
</script>
</head>
<body>


	<div id="mainDiv" class="borderDiv">

		<div>
			<h4>[错误消息]</h4>
			<div>
				<img alt="..." src="res_static/error.gif">
			</div>
			<br />
			<c:if test="${ex != null }">
				<font color="red"><spring:message code="${ex.class.name }" /></font>
			</c:if>
			<br /> <br />
			<button>返回上一页</button>
		</div>
	</div>
</body>
</html>