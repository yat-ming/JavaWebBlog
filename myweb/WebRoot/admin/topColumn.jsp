<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.util.Date"%>
<%
	Date date = new Date();
	request.setAttribute("date", date);
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div id="top-column">
    <div id="top-column-left">
        <span>这里是博客后台,今天是： <fmt:formatDate value="${date}" pattern="yyyy年M月d日  EEEE"/></span>
        <a href="<%=basePath %>index.jsp" target="front">查看前台</a>
    </div>
    <div id="top-column-right">
        <span>用户名：${adminName }</span>
        <a href="">退出登录</a>
    </div>
</div>