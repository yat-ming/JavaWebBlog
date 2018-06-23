<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="dao.Dao"%>
<%@page import="dao.DaoFactory"%>
<%@page import="bean.Image"%>
<%@page import="java.util.List"%>
<%
	Dao<Image> imageDao = DaoFactory.getImageDao();
	List<Image> imageList = imageDao.findAll();
	request.setAttribute("imageList",imageList);
 %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>图片库</title>
    <link rel="stylesheet" href="../css/pure-min.css">
    <link rel="stylesheet" href="../css/library.css">
</head>

<body>
    <%@ include file="topColumn.jsp" %>
    <%@ include file="adminmenu.html" %>
    <div id="content">
        <div id="wrap">
            <h1>图片库</h1>
            <div>
                <a class="pure-button" href="#">列表视图</a>
                <a class="pure-button" href="#">平铺视图</a>
                <a class="pure-button" id="addImage_button" href="#">添加</a>
            </div>
            <form action="batchDeleteImage.do" method="post">
                <table class="pure-table pure-table-horizontal" style="width:80%;text-align:center;margin-top:10px;margin-bottom:15px;">
                <thead>
                    <tr>
                        <th style="width:50px;"><input type="checkbox"></th>
                        <th>图片</th>
                        <th>图片id</th>
                        <th>简介</th>
                        <th style="width:100px;">上传时间</th>
                        <th style="width:200px;">修改</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="image" items="${imageList}">
                	<tr>
                        <th><input type="checkbox" name="batchImageId" value="${image.id }"></th>
                        <td><img alt="" src="<%=basePath %>${image.src}" style="width:64px;"></td>
                        <td>Accord</td>
                        <td>Accord</td>
                        <td>2009</td>
                        <td><a href="">编辑</a>&emsp;|&emsp;<a href="deleteImage.do?id=${image.id }">删除</a></td>
                    </tr>
                	</c:forEach>
                </tbody>
            </table>
            <a class="pure-button pure-button-primary" href="#">批量删除</a>
            </form>
            <form action="AddImage" method="post" id="addImage" enctype="multipart/form-data">
                <div id="addImage_menu">
                    <a class="pure-button pure-button-primary" id="addImage_shutdown" href="#">关闭</a>
                    <span>上传的图片不能超过5m</span>
                </div>
                <div id="addImage_display" style="margin:5px;margin-top:10px;">
                    <div id="addImage_button2">
                        <input id="inputFile" type="file" name="fileupload">
                        <img src="../image/jiahao.png" alt="">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/script.js"></script>
    <script src="../js/jquery.form.min.js"></script>
    <script src="../js/library.js"></script>
</body>

</html>
