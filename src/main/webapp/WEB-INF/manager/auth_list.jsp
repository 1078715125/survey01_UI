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
			var authName = this.value;
			var authId = this.id;
			
			if(authName == ""){
				this.value = this.defaultValue;
				return;
			}
			
			//准备Ajax数据
			var url = "${pageContext.request.contextPath}/manager/auth/updateAuthName";
			var param = {"authName":authName,"authId":authId,"time":new Date()};//加time防止浏览器缓存数据
			var callback = function(data){
				alert(data);
			};
			$.post(url,param,callback,"text");
			
		});
		
		$(":submit").click(function(){
			
			var authName = "\r\n";
			$(":checked[name='authIdList']").each(function(i){
				authName += (i+1) + ". ";
				authName += $(this).parents("tr").find(".longInput").val();
				authName += "\r\n";
			});
			
			console.log(authName);
			if(authName == "\r\n"){
				alert("您没有选中任何数据！");
				return false;
			}
			
			return confirm("是否对以下权限进行批量删除？"+ authName);
			
			
		});
		
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
		<h3>[权限管理]</h3>
		<form action="manager/auth/delAuth" method="post">
			<table class="dataTable">
				<c:if test="${empty authList}">
					<tr>
						<th>暂无权限列表</th>
					</tr>
				</c:if>
				<c:if test="${!empty authList}">
					<tr>
						<th>权限ID</th>
						<th>权限名称</th>
						<th><input type="checkbox" id="checkAll"/>删除</th>
						<th>分配</th>
					</tr>
					<c:forEach items="${authList }" var="auth">
						<tr>
							<td>${auth.authId }</td>
							<td><input type="text" class="longInput" value="${auth.authName }" id="${auth.authId }"/></td>
							<td><input type="checkbox" value="${auth.authId }" name="authIdList"/></td>
							<td>
								<a href="manager/auth/toDispatcher/${auth.authId }" >分配资源</a>
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