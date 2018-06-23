<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="dao.Dao"%>
<%@page import="bean.Message"%>
<%@page import="dao.DaoFactory"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	Dao<Message> messageDao = DaoFactory.getMessageDao();
	List<Message> messages = messageDao.findAll();
	request.setAttribute("messages", messages);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=GBK">
	<title>分享编程和二次元的快乐！</title>
	<link rel="stylesheet" type="text/css" href="css/message.css">
</head>
<body>
	<div id="wrapper"> 
		<%@ include file="header.html" %>
		<div id="content">
			<div id="left">
				<h3>留言板</h3>
				<p>有什么想对我说的话，或者对本站有什么建议或意见，都可以在这里写下来。</p>
				<form action="#" id="login">
					<h3>Login</h3>
					<label for="">name</label>
					<input type="text" name="username" />
					<label for="">password</label>
					<input type="text" name="password" />
					<input type="submit" value="login" />
				</form>
			</div>
			<div id="right">
				<ul>
					<c:forEach var="message" items="${messages}">
					<li class="message">
						<div class="message-meta">
							<img src="image/visitor.png" alt="" class="headshot">
							${message.name } 在 <span><fmt:formatDate value="${message.datetime}" pattern="yyyy年M月d日HH:mm"/></span>说道：
						</div>
						<p class="message-content">
							<c:out value="${message.content }"/>
						</p>
						<div class="reply">
						</div>
					</li>
					</c:forEach>
				</ul>
				<form action="addMessage.do" id="publishComment" method="post">
					<div>
						名字:<input type="text" name="name">
					</div>
					<textarea name="comment" id="" cols="30" rows="10"></textarea>
					<input type="submit" value="发送留言">
				</form>
			</div>
		</div>
		<%@ include file="footer.html" %>
	</div>
</body>
</html>
