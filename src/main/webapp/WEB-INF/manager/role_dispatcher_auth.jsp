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
			$("[name='authIdList']").each(function(){
				
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
		<h3>[请选择权限]</h3>
		<form action="manager/role/dispatcher" method="post">
			<input type="hidden" name="roleId" value="${roleId }"/>
			<table class="dataTable">
				<c:if test="${empty authList }">
					<tr>
						<th>暂无权限列表</th>
					</tr>
				</c:if>
				<c:if test="${!empty authList }">
					<tr>
						<th><input type="checkbox" id="checkAll"/>权限名称</th>
					</tr>
					<c:forEach items="${authList }" var="auth">
						<tr>
							<td>
								<input type="checkbox" name="authIdList" value="${auth.authId }"
								id="label${auth.authId}" 
								<gyx:isChecked currentId="${auth.authId }" list="${currentAuthIdList }"/>
								/>
								<label for="label${auth.authId}">${auth.authName}</label>
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