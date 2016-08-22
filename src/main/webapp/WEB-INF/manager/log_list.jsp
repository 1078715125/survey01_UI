<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/res_jsp/base.jsp"%>
<script type="text/javascript">
	// 		$(".hugeInput").change(function(){
	// 			var resName = this.value;
	// 			var resId = this.id;

	// 			if(resName == ""){
	// 				this.value = this.defaultValue;
	// 				return;
	// 			}

	// 			//准备Ajax数据
	// 			var url = "${pageContext.request.contextPath}/manager/res/updateResName";
	// 			var param = {"resId":resId,"resName":resName,"time":new Date()};//加time防止浏览器缓存数据
	// 			var callback = function(data){
	// 				alert(data);
	// 			};
	// 			$.post(url,param,callback,"text");
	// 		});
</script>
</head>
<body>


	<%@include file="/res_jsp/manager_top.jsp"%>

	<div id="mainDiv" class="borderDiv">
		<h3>[日志列表]</h3>
		<form action="manager/log/showList" method="post">
			<table class="dataTable">
				<c:if test="${empty page.list }">
					<tr>
						<th>暂无日志信息</th>
					</tr>
				</c:if>
				<c:if test="${!empty page.list }">
					<tr>
						<th style="width: 15px;">入参</th>
						<th>返回值</th>
						<th style="width: 5px;">异常类型</th>
						<th>异常信息</th>
					</tr>
					<tr>
						<th colspan="4"><hr color="red"></th>
					</tr>
					<tr>
						<th colspan="4"><hr color="blue"></th>
					</tr>
					<tr>
						<th colspan="4"><hr color="red"></th>
					</tr>
					<c:forEach items="${page.list }" var="log">
						<tr>
							<th colspan="4">日期：${log.operateTime } ---->
								操作人：${log.operator }</th>
						</tr>
						<tr>
							<td colspan="4">类.方法：${log.typeName}.${log.methodName }</td>
						</tr>
						<tr>
							<td>${log.params }</td>
							<td>${log.returnValue }</td>
							<td>${log.exceptionType }</td>
							<td>${log.exceptionMsg }</td>
						</tr>
						<tr>
							<th colspan="4"><hr color="blue" /></th>
						</tr>
					</c:forEach>
					<!-- 显示页码 -->
					<tr>
						<td colspan="5"><c:set value="manager/log/showList"
								var="pageUrl" scope="page" /> 
								<%@include file="/res_jsp/navigator.jsp"%></td>
					</tr>


				</c:if>
			</table>

		</form>

	</div>


	<%@include file="/res_jsp/manager_bottom.jsp"%>

</body>
</html>