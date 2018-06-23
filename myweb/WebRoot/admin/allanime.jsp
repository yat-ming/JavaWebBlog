<%@ page pageEncoding="UTF-8" %>
<%@page import="dao.Dao"%>
<%@page import="bean.Anime"%>
<%@page import="dao.DaoFactory"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	Dao<Anime> animeDao = DaoFactory.getAnimeDao();
	List<Anime> animeList = animeDao.findAll();
	request.setAttribute("animeList", animeList); 
 %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>动画列表管理</title>
    <link rel="stylesheet" href="../css/pure-min.css">
    <link rel="stylesheet" href="../css/style2.css">
</head>

<body>
    <%@ include file="topColumn.jsp" %>
    <%@ include file="adminmenu.html" %>
    <div id="content">
        <div id="wrap">
            <h1>动画列表</h1>
            <form action="AddAnime" method="post" class="pure-form pure-form-stacked" style="width:80%;">
                <fieldset>
                    <legend>添加新内容</legend>
                    <div class="pure-g" style="float:left;width:90%;">
                        <div class="pure-u-7-24">
                            <label for="anime-name">名称</label>
                            <input id="anime-name" name="name" class="pure-u-23-24" type="text">
                        </div>

                        <div class="pure-u-3-24">
                            <label for="anime-year">年份</label>
                            <input id="anime-year" name="year" class="pure-u-23-24" type="text">
                        </div>

                        <div class="pure-u-7-24">
                            <label for="email">制作公司</label>
                            <input id="email" name="company" class="pure-u-23-24" type="text">
                        </div>

                        <div class="pure-u-5-24">
                            <label for="anime-type">类型</label>
                            <input id="anime-type" name="type" class="pure-u-23-24" type="text">
                        </div>
                    </div>
                    <input type="submit" class="pure-button pure-button-primary" style="float:left;margin-top:27px;" value="添加">
                </fieldset>
            </form>
            <form action="BatchDeleteAnime" method="post">
                <table class="pure-table pure-table-horizontal" style="width:80%;text-align:center;margin-top:10px;margin-bottom:15px;">
                    <thead>
                        <tr>
                            <th style="width:50px;"><input type="checkbox"></th>
                            <th>名称</th>
                            <th style="width:100px;">年份</th>
                            <th>制作公司</th>
                            <th style="width:100px;">类型</th>
                            <th style="width:200px;">修改</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="anime" items="${animeList}">
                    	<tr>
                            <th><input type="checkbox" value="${anime.id }" name="batchAnimeId"></th>
                            <td>${anime.name }</td>
                            <td>${anime.year }</td>
                            <td>${anime.company }</td>
                            <td>${anime.type }</td>
                            <td><a href="">编辑</a>&emsp;|&emsp;<a href="DeleteAnime?id=${anime.id}">删除</a></td>
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
