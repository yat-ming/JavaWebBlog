<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="dao.Dao"%>
<%@page import="bean.Article"%>
<%@page import="dao.DaoFactory"%>
<%@page import="java.util.List"%><%
	Dao<Article> articleDao = DaoFactory.getArticleDao();
	List<Article> articleList = articleDao.findAll();
	request.setAttribute("articleList", articleList);
 %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>后台模板</title>
    <link rel="stylesheet" href="../css/pure-min.css">
    <link rel="stylesheet" href="../css/style2.css">
</head>

<body>
    <%@ include file="topColumn.jsp" %>
    <%@ include file="adminmenu.html" %>
    <div id="content">
        <div id="wrap">
            <h1>文章</h1>
            <div class="pure-menu pure-menu-horizontal">
                <a href="#" class="pure-menu-heading pure-menu-link" style="padding:3px;">全部（4）</a> |
                <ul class="pure-menu-list">
                    <li class="pure-menu-item"><a href="#" class="pure-menu-link" style="padding:5px;">已发布（3）</a></li> |
                    <li class="pure-menu-item"><a href="#" class="pure-menu-link" style="padding:5px;">草稿（1）</a></li>
                </ul>
            </div>
            <form action="BatchDeleteArticle" method="post">
                <table class="pure-table pure-table-horizontal" style="width:80%;text-align:center;margin-top:10px;margin-bottom:15px;">
                <thead>
                    <tr>
                        <th style="width:50px;"><input type="checkbox"></th>
                        <th>标题</th>
                        <th>分类</th>
                        <th style="width:150px;">时间</th>
                        <th style="width:200px;">修改</th>
                    </tr>
                </thead>
                <tbody>
					<c:forEach var="article" items="${articleList}">
					<tr>
						<th><input type="checkbox" value="${article.id }" name="batchArticleId"></th>
                        <td>${article.title }</td>
                        <td>无</td>
                        <td><fmt:formatDate value="${article.date }" pattern="yyyy年M月d日" /></td>
                        <td><a href="articleUpdate.jsp?id=${article.id }">编辑</a>&emsp;|&emsp;<a href="deleteArticle?id=${article.id }">删除</a></td>
					</tr>
					</c:forEach>
                </tbody>
            </table>
            <input class="pure-button pure-button-primary" type="submit" value="批量删除">
            </form>
        </div>
    </div>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/script.js"></script>
</body>

</html>
