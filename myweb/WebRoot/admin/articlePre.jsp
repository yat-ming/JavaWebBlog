<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String content = request.getParameter("ckeditor");
	request.setAttribute("title", title);
	request.setAttribute("content", content);
	Date date = new Date();
	request.setAttribute("date", date);
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>分享编程和二次元的快乐！</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h1>浩·ShiFanhao</h1>
			<h2>不要哀求，主动争取，若得如此，必有所获</h2>
			<img src="../image/header.jpg" alt="这里是一张顶部图片">
		</div>
		<div id="nav">
			<a href="index.jsp">文章</a
			><a href="gallery.jsp">图片收集</a
			><a href="anime.jsp">动画列表</a
			><a href="message.jsp">留言板</a
			><a href="about.jsp">关于</a>
		</div>
		<div id="content">
			<div id="left">
				<h3>文章分类</h3>
				<ul>
					<li>
						<a href="#"><div class="triangle-right"></div>前端</a>
					</li>
					<li>
						<a href="#"><span class="triangle-right"></span>servlet & JSP</a>
					</li>
					<li>
						<a href="#"><span class="triangle-right"></span>数据库</a>
					</li>
				</ul>
			</div>
			<div id="right">
				<div class="article">
					<h1 class="article-title">
						<a href="#">${title }</a>
					</h1>
					<div class="article-time">
						发表于<span><fmt:formatDate value="${date }" pattern="yyyy年M月d日" /></span>
					</div>
					<div class="article-intro">
						${content }
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/footer.html" %>
	</div>
</body>
</html>