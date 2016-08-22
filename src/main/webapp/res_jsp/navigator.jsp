<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	$(function() {
		$(".shortInput")
				.change(
						function() {

							if (this.value == "" || isNaN(this.value)) {
								this.value = this.defaultValue;
								return false;
							}

							window.location.href = "${pageContext.request.contextPath }/${pageUrl }?pageNo="
									+ this.value;
						});
	});
</script>

<%-- 显示页码 --%>
<c:if test="${page.hasPrev }">
	<a href="${pageUrl }?pageNo=1">首页</a>
	<a href="${pageUrl }?pageNo=${page.prev }">上一页</a>
</c:if>
当前页：
<input type="text" class="shortInput" value="${page.pageNo}" />
/共${page.totalPageNo }页， 共${page.totalRecordNo }条记录
<c:if test="${page.hasNext }">
	<a href="${pageUrl }?pageNo=${page.next }">下一页</a>
	<a
		href="${pageUrl }?pageNo=${page.totalPageNo }">末页</a>
</c:if>