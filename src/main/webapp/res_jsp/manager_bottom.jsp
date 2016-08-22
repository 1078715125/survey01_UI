<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<div id="bottomDiv" class="borderDiv">
	<%
		String today = new SimpleDateFormat("yyyy年MM月dd日  HH:mm:ss")
				.format(new Date());
		pageContext.setAttribute("today", today);
	%>
	©CopyRight All Rights Reserved. 尚硅谷国际教育集团----&lt;日期:${today }&gt;---- [ <a
		href="index.jsp">回前台首页</a> ]
</div>