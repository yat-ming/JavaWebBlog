<%@ page pageEncoding="UTF-8" %>
<%@page import="dao.Dao"%>
<%@page import="dao.DaoFactory"%>
<%@page import="bean.Message"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	Dao<Message> messageDao = DaoFactory.getMessageDao();
	List<Message> messageList = messageDao.findAll();
	request.setAttribute("messageList", messageList);
 %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>留言管理</title>
    <link rel="stylesheet" href="../css/pure-min.css">
    <link rel="stylesheet" href="../css/style2.css">
</head>

<body>
    <%@ include file="topColumn.jsp" %>
    <%@ include file="adminmenu.html" %>
    <div id="content">
        <div id="wrap">
            <h1>留言</h1>
            <div class="pure-menu pure-menu-horizontal">
                <a href="#" class="pure-menu-heading pure-menu-link" style="padding:3px;">全部（4）</a> |
                <ul class="pure-menu-list">
                    <li class="pure-menu-item"><a href="#" class="pure-menu-link" style="padding:5px;">已审批（3）</a></li> |
                    <li class="pure-menu-item"><a href="#" class="pure-menu-link" style="padding:5px;">回收站（1）</a></li>
                </ul>
            </div>
            <form action="" method="post">
                <table class="pure-table pure-table-horizontal" style="width:80%;text-align:center;margin-top:10px;margin-bottom:15px;">
                <thead>
                    <tr>
                        <th style="width:50px;"><input type="checkbox"></th>
                        <th>用户</th>
                        <th>邮箱</th>
                        <th>内容</th>
                        <th style="width:150px;">时间</th>
                        <th style="width:200px;">修改</th>
                    </tr>
                </thead>
                <tbody>
                   
                    <c:forEach var="message" items="${messageList}">
                    <tr>
                    	<td><input type="checkbox" value="${message.id }"></td>
                    	<td>${message.name }</td>
                    	<td>无</td>
                    	<td>${message.content }</td>
                    	<td><fmt:formatDate value="${message.datetime}" pattern="yyyy年M月d日HH:mm"/></td>
                    	<td><a href="">编辑</a>&emsp;|&emsp;<a href="deleteMessage.do?id=${message.id }">删除</a></td>
                    </tr>
                    </c:forEach>

                </tbody>
            </table>
            <input value="批量删除" type="submit" class="pure-button pure-button-primary">
            </form>
            
        </div>
    </div>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/script.js"></script>
</body>

</html>
