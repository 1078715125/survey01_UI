<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/res_jsp/base.jsp"%>
<script type="text/javascript">
	$(function(){
		
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
		
		$(".toggleStatus").click(function(){
			
			var resId = this.id;
			var $obj = $(this);
			
			//准备Ajax数据
			var url = "${pageContext.request.contextPath}/manager/res/updateResStatus";
			var param = {"resId":resId,"time":new Date()};
			var callback = function(data){
				$obj.val(data);
			};
			$.post(url,param,callback,"text");
		});
		
		$(":submit").click(function(){
			
			var resName = "\r\n";
			$(":checked[name='resIdList']").each(function(i){
				resName += (i+1) + ". ";
// 				resName += $(this).parents("tr").find(".hugeInput").val();
				resName += $(this).parents("tr").children("td:eq(1)").text();
				resName += "\r\n";
			});
			
			console.log(resName);
			if(resName == "\r\n"){
				alert("您没有选中任何数据！");
				return false;
			}
			
			return confirm("是否对以下资源进行批量删除？"+ resName);
			
			
		});
		
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
		<h3>[资源管理]</h3>
		<form action="manager/res/delRes" method="post">
			<table class="dataTable">
				<c:if test="${empty resList }">
					<tr>
						<th>暂无资源信息</th>
					</tr>
				</c:if>
				<c:if test="${!empty resList }">
					<tr>
						<th>资源ID</th>
						<th>资源名称</th>
						<th>资源状态</th>
						<th><input type="checkbox" id="checkAll" /><label for="checkAll">删除</label></th>
					</tr>
					<c:forEach items="${resList }" var="res">
						<tr>
							<td>${res.resId }</td>
<%-- 							<td><input type="hidden" value="${res.resName }" id="${res.resId }" --%>
<!-- 								class="hugeInput" /></td> -->
							<td>${res.resName }</td>
							<td>
								<c:if test="${res.publicRes }">
									<input class="toggleStatus" type="button" value="公共资源" id="${res.resId }"/>
								</c:if> 
								<c:if test="${!res.publicRes }">
									<input class="toggleStatus" type="button" value="受保护资源" id="${res.resId }"/>
								</c:if>
							</td>
							<td><input type="checkbox" name="resIdList"
								value="${res.resId }" /></td>
						</tr>
					</c:forEach>

					<tr>
						<th colspan="4"><input type="submit" value="批量删除" /></th>
					</tr>

				</c:if>
			</table>

		</form>

	</div>


	<%@include file="/res_jsp/manager_bottom.jsp"%>

</body>
</html>