<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/res_jsp/base.jsp"%>

</head>
<body>


	<%@include file="/res_jsp/manager_top.jsp"%>

	<div id="mainDiv" class="borderDiv">
		<h3>[欢迎光临在线调查系统后台系统]</h3>
		<form action="manager/log/showList" method="post">
			<table class="dataTable">
			<tr><td><font>请选择日志信息（可多选）</font></td></tr>
				<tr><td>
					<select multiple="multiple" name="tableList">
						<c:if test="${empty tableNameList }">
						<option>暂无更多日志表</option>
						</c:if>
						<c:if test="${!empty tableNameList }">
							<c:forEach items="${tableNameList }" var="tableName">
								<option value="${tableName}" 
								<c:forEach items="${tableList }" var="table">
									<c:if test="${tableName == table}">selected="selected"</c:if>
								</c:forEach>>${tableName}
								</option>
							</c:forEach>
						</c:if>
					</select>
					<input type="submit" value="确认选择" />
				</td></tr>
			</table>
			</form>
	</div>


	<%@include file="/res_jsp/manager_bottom.jsp"%>

</body>
</html>