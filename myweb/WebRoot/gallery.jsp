<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.Dao"%>
<%@page import="bean.Image"%>
<%@page import="dao.DaoFactory"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Dao<Image> imageDao = DaoFactory.getImageDao();
	List<Image> images = imageDao.findAll();
	request.setAttribute("images", images);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>分享编程和二次元的快乐！</title>
	<link rel="stylesheet" type="text/css" href="css/gallery.css">
</head>
<body>
	<div id="wrapper">&nbsp; 
		<%@ include file="header.html" %>
		<div id="content">
			<div id="left">
				<h3>图片收集</h3>
				<p>这些是平时收集的一些插图，如果觉得反复点开大图晃眼，可以用快速预览。</p>
				<div id="switch">快速预览</div>
			</div>
			<div id="right">
			<c:forEach var="image" items="${images}">
				<img src="${image.src }" alt="">
			</c:forEach>
			</div>
			<div id="quicklook">
				<a href="" id="goback"><-返回</a>
				<img src="image/img/01.jpg" alt="" id="picture">
				<div id="control">
					<div class="pre-picture"></div>
					<div id="pic-scroll">
						<div id="pic-list">
							<c:forEach var="image" items="${images}">
								<img src="${image.src }" alt="">
							</c:forEach>
						</div>
					</div>
					<div class="next-picture"></div>
				</div>
				<span id="hint">1/10</span>
			</div>
			<div id="display">
				<img src="" alt="">
			</div>
		</div>
		<%@ include file="footer.html" %>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/galler.js"></script>
</body>
</html>
