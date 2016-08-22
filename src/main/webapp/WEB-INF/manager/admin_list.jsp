<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/res_jsp/base.jsp"%>
<script type="text/javascript">
	$(function(){
		
		
		$(":submit").click(function(){
			
			var roleName = "\r\n";
			$(":checked[name='adminIdList']").each(function(i){
				roleName += (i+1) + ". ";
				roleName += $(this).parents("tr").children("td:eq(1)").text();
				roleName += "\r\n";
			});
			
			console.log(roleName);
			if(roleName == "\r\n"){
				alert("您没有选中任何数据！");
				return false;
			}
			
			return confirm("是否对以下账号进行批量删除？"+ roleName);
			
			
		});
		
		$("#checkAll").click(function(){
			var checked = $(this).attr("checked");
			$("[name='adminIdList']").each(function(){
				
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
		<h3>[账号管理]</h3>
		<form action="manager/admin/delAdmin" method="post">
			<table class="dataTable">
				<c:if test="${empty adminList}">
					<tr>
						<th>暂无账号列表</th>
					</tr>
				</c:if>
				<c:if test="${!empty adminList}">
					<tr>
						<th>账号ID</th>
						<th>账号名称</th>
						<th><input type="checkbox" id="checkAll"/><label for="checkAll">删除</label></th>
						<th>分配</th>
					</tr>
					<c:forEach items="${adminList }" var="admin">
						<tr>
							<td>${admin.adminId }</td>
							<td>${admin.adminName }</td>
							<td><input type="checkbox" value="${admin.adminId }" name="adminIdList"/></td>
							<td>
								<a href="manager/admin/toDispatcher/${admin.adminId }" >分配角色</a>
							</td>
						</tr>
					</c:forEach>
					<tr><td colspan="4"><input type="submit" value="批量删除"/></td></tr>
				</c:if>

			</table>

		</form>
	</div>


	<%@include file="/res_jsp/manager_bottom.jsp"%>

</body>
</html>