<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/res_jsp/base.jsp"%>
<script type="text/javascript">
	$(function(){
		
		$(".longInput").change(function(){
			var roleName = this.value;
			var roleId = this.id;
			
			if(roleName == ""){
				this.value = this.defaultValue;
				return;
			}
			
			//准备Ajax数据
			var url = "${pageContext.request.contextPath}/manager/role/updateRoleName";
			var param = {"roleName":roleName,"roleId":roleId,"time":new Date()};//加time防止浏览器缓存数据
			var callback = function(data){
				alert(data);
			};
			$.post(url,param,callback,"text");
			
		});
		
		$(":submit").click(function(){
			
			var roleName = "\r\n";
			$(":checked[name='roleIdList']").each(function(i){
				roleName += (i+1) + ". ";
				roleName += $(this).parents("tr").find(".longInput").val();
				roleName += "\r\n";
			});
			
			console.log(roleName);
			if(roleName == "\r\n"){
				alert("您没有选中任何数据！");
				return false;
			}
			
			return confirm("是否对以下角色进行批量删除？"+ roleName);
			
			
		});
		
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
		<h3>[角色管理]</h3>
		<form action="manager/role/delRole" method="post">
			<table class="dataTable">
				<c:if test="${empty roleList}">
					<tr>
						<th>暂无角色列表</th>
					</tr>
				</c:if>
				<c:if test="${!empty roleList}">
					<tr>
						<th>角色ID</th>
						<th>角色名称</th>
						<th><input type="checkbox" id="checkAll"/><label for="checkAll">删除</label></th>
						<th>分配</th>
					</tr>
					<c:forEach items="${roleList }" var="role">
						<tr>
							<td>${role.roleId }</td>
							<td><input type="text" class="longInput" value="${role.roleName }" id="${role.roleId }"/></td>
							<td><input type="checkbox" value="${role.roleId }" name="roleIdList"/></td>
							<td>
								<a href="manager/role/toDispatcher/${role.roleId }" >分配权限</a>
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