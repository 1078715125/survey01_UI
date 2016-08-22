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

			// 			window.history.back();
			window.location = "${pageContext.request.contextPath}/index.jsp";

		});

	})
</script>
</head>
<body>


	<div id="mainDiv" class="borderDiv">

		<div>
			<h4>[成功消息]</h4>
			<div>
				<img alt="..." src="res_static/ok.gif">
			</div>
			<br /> <font color="blue"><spring:message
					code="${param.msg }" /></font> <br /> <br />
			<button>返回首页</button>
		</div>
	</div>
</body>
</html>