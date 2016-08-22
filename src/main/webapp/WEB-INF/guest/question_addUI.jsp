<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/res_jsp/base.jsp"%>
<script type="text/javascript">
	$(function() {
		$(":radio").click(function(){
			var type = this.value;
			if(type == 2){
				$("textarea").parents("tr").hide();
			}else{
				$("textarea").parents("tr").show();
			}
		});
	});
</script>
</head>
<body>
	<%@include file="/res_jsp/guest_top.jsp"%>

	<div id="mainDiv" class="borderDiv">
		[创建问题]
		<form action="guest/bag/saveQuestion" method="post">
			<input type="hidden" name="bag.bagId" value="${bagId }" /> <input
				type="hidden" name="surveyId" value="${surveyId }" />
			<table class="formTable">
				<tr>
					<td>问题名称</td>
					<td><input name="questionName" class="longInput" /></td>
				</tr>
				<tr>
					<td>问题类型</td>
					<td><input type="radio" name="questionType" id="0" value="0" 
						checked="checked" /> <label for="0">单选题</label> <input
						type="radio" name="questionType" id="1" value="1"/> <label for="1">多选题</label>
						<input type="radio" name="questionType" id="2" value="2"/> <label for="2">简答题</label>
					</td>
				</tr>
				<tr>
					<td>问题选项</td>
					<td><textarea name="options" class="multiInput"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="保存"></td>
				</tr>
			</table>
		</form>
	</div>


	<%@include file="/res_jsp/guest_bottom.jsp"%>
</body>
</html>