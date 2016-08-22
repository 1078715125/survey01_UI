<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.atguigu.com/survey/gyx" prefix="gyx" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/res_jsp/base.jsp"%>
<script type="text/javascript">

	$(function(){
		
		$("#checkAll").click(function(){
			var checked = $(this).attr("checked");
			$("[name='resIdList']").each(function(){
				
				if (checked == "checked") {
					$(this).attr("checked","checked");
				} else {
					$(this).removeAttr("checked");
				}
				
			});
			
		});
		
	});
</script>
</head>
<body>


	<%@include file="/res_jsp/manager_top.jsp"%>

	<div id="mainDiv" class="borderDiv">
		<h3>[请选择资源]</h3>
		<form action="manager/auth/dispatcher" method="post">
			<input type="hidden" name="authId" value="${authId }"/>
			<table class="dataTable">
				<c:if test="${empty resList }">
					<tr>
						<th>暂无资源列表</th>
					</tr>
				</c:if>
				<c:if test="${!empty resList }">
					<tr>
						<th><input type="checkbox" id="checkAll"/>资源名称</th>
					</tr>
					<c:forEach items="${resList }" var="res">
						<tr>
							<td>
								<input type="checkbox" name="resIdList" value="${res.resId }"
								id="label${res.resId}" 
								<gyx:isChecked currentId="${res.resId }" list="${currentResIdList }"/>
								/>
								<label for="label${res.resId}">${res.resName}</label>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td><input type="submit" value="确认分配"/></td>
					</tr>
				</c:if>
			
			</table>
		
		
		</form>
		
	</div>


	<%@include file="/res_jsp/manager_bottom.jsp"%>

</body>
</html>