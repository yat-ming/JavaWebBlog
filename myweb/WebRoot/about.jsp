<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>分享编程和二次元的快乐！</title>
	<link rel="stylesheet" type="text/css" href="css/about.css">
</head>
<body>
	<div id="wrapper">
		<%@ include file="header.html" %>
		<div id="content">
			<div id="left">
				<h3>关于我</h3>
				<div id="my-intro">
					<img src="image/myheadshot.jpg" alt="">
					<p>浩</p>
					<p>爱好：编程/看动画/看漫画</p>
				</div>
			</div>
			<div id="right">
				<div class="article">
					<h3>关于本站</h3>
					<p>
						这只是兴趣使然的个人小站。刚开始学编程的时候看到那些大神们都有自己的个人博客，非常羡慕，一直憧憬着自己也能有一个。这次就顺手写下了。
					</p>
				</div>
			</div>
		</div>
		<%@ include file="footer.html" %>
	</div>
</body>
</html>
