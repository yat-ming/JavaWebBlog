<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="dao.Dao"%>
<%@page import="bean.Article"%>
<%@page import="dao.DaoFactory"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	Dao<Article> articleDao = DaoFactory.getArticleDao();
	List<Article> articleList = articleDao.findAll();
	request.setAttribute("articleList", articleList);
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>分享编程和二次元的快乐！</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div id="wrapper">
		<%@ include file="header.html" %>
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
						<a href="#">myeclipse与eclipse</a>
					</h1>
					<div class="article-time">
						发表于<span>2017年3月3日</span>
					</div>
					<div class="article-intro">
						用惯了eclipse,或者有时候从网上下别人的源代码学习，发现是用myeclipse写的。正常的导入项目会发现，eclipse识别不出myeclipse的web project。只是把它当成普通java project而已。这里记下方法备忘:<br/><br>
						1.首先要告诉eclipse这是一个什么项目，项目右键Properties,找到Project Facets,勾选Dynamic Web Module.<br><br>
						2.由于eclipse将项目构建在WebContent而myeclipse则是WebRoot，因此还要修改默认的项目构建路径，需要切换到Navigator视图，可以在show view中找到，点开.settings,打开org.eclipse.wst.common.component文件，将其中的WebContent改为WebRoot即可。
					</div>
				</div>
				<c:forEach var="article" items="${articleList}">
				<div class="article">
					<h1 class="article-title">
						<a href="#">${article.title }</a>
					</h1>
					<div class="article-time">
						发表于<span><fmt:formatDate value="${article.date }" pattern="yyyy年M月d日" /></span>
					</div>
					<div class="article-intro">
						${article.content }
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
		<%@ include file="footer.html" %>
	</div>
</body>
</html>