<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.atguigu.com/survey/gyx" prefix="gyx" %>
<div id="logoDiv" class="borderDiv">尚硅谷在线调查系统-GYX</div>

<div id="topDiv" class="borderDiv">

	<c:if test="${loginAdmin == null }">
		[<a href="manager/admin/toLogin">登录</a>]
	</c:if>
	
	<c:if test="${loginAdmin != null }">
		[欢迎您,${loginAdmin.adminName }]
		<gyx:authCheck servletPath="/manager/statistics/showAllSurvey">
			[<a href="manager/statistics/showAllSurvey">统计调查</a>]
		</gyx:authCheck>
		<gyx:authCheck servletPath="/manager/res/showList">
			[<a href="manager/res/showList">资源管理</a>]
		</gyx:authCheck>
		<gyx:authCheck servletPath="/manager/auth/toAddUI">
			[<a href="manager/auth/toAddUI">创建权限</a>]
		</gyx:authCheck>
		<gyx:authCheck servletPath="/manager/auth/showList">
			[<a href="manager/auth/showList">权限管理</a>]
		</gyx:authCheck>
		<gyx:authCheck servletPath="/manager/role/toAddUI">
			[<a href="manager/role/toAddUI">创建角色</a>]
		</gyx:authCheck>
		<gyx:authCheck servletPath="/manager/role/showList">
			[<a href="manager/role/showList">角色管理</a>]
		</gyx:authCheck>
		<gyx:authCheck servletPath="/manager/admin/toAddUI">
			[<a href="manager/admin/toAddUI">创建账号</a>]
		</gyx:authCheck>
		<gyx:authCheck servletPath="/manager/admin/showList">
			[<a href="manager/admin/showList">账号管理</a>]
		</gyx:authCheck>
		<gyx:authCheck servletPath="/manager/log/showList">
			[<a href="manager/log/showList">日志列表</a>]
		</gyx:authCheck>
		[<a href="manager/admin/logout">退出登录</a>]
	</c:if>

	<%-- 不论当前是否有管理员登录，都显示“首页”超链接 --%>
	[<a href="manager/admin/toMainUI">后台首页</a>]

</div>