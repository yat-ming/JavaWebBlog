<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.Dao"%>
<%@page import="bean.Anime"%>
<%@page import="dao.DaoFactory"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Dao<Anime> animeDao = DaoFactory.getAnimeDao();
	List<Anime> animes = animeDao.findAll();
	request.setAttribute("animes", animes);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>分享编程和二次元的快乐！</title>
	<link rel="stylesheet" type="text/css" href="css/anime.css">
</head>
<body>
	<div id="wrapper">
		<%@ include file="header.html" %>
		<div id="content">
			<div id="left">
				<h3>动画列表</h3>
				<p>这里记录着我看过的大部分动画，有些动画久了就忘了，写在这里备忘。也可以更有计划的补番。</p>
			</div>
			<div id="right">
				<div id="search">
					<label for="filterName">搜索：</label>
					<input type="text" id="filterName">
				</div>
				<table>
                	<thead>
                    	<tr>
                        	<th>名称</th>
                        	<th>年份</th>
                        	<th>制作公司</th>
                        	<th id="last-th">类型</th>
                    	</tr>
                	</thead>
                	<tbody>
                	<c:forEach var="anime" items="${animes}">
                		<tr>
                      		<td>${anime.name }</td>
                       		<td>${anime.year }</td>
                       		<td>${anime.company }</td>
                       		<td>${anime.type }</td>
                   		</tr>
                	</c:forEach>
                	</tbody>
            </table>
			</div>
		</div>
		<%@ include file="footer.html" %>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/anime.js"></script>
</body>
</html>
