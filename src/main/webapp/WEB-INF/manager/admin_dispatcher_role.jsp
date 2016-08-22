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
			$("[name='roleIdList']").each(function(){
				
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
		<h3>[请选择角色]</h3>
		<form action="manager/admin/dispatcher" method="post">
			<input type="hidden" name="adminId" value="${adminId }"/>
			<table class="dataTable">
				<c:if test="${empty roleList }">
					<tr>
						<th>暂无角色限列表</th>
					</tr>
				</c:if>
				<c:if test="${!empty roleList }">
					<tr>
						<th><input type="checkbox" id="checkAll"/>角色名称</th>
					</tr>
					<c:forEach items="${roleList }" var="role">
						<tr>
							<td>
								<input type="checkbox" name="roleIdList" value="${role.roleId}"
								id="label${role.roleId}" 
								<gyx:isChecked currentId="${role.roleId }" list="${currentRoleIdList }"/>
								/>
								<label for="label${role.roleId}">${role.roleName}</label>
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