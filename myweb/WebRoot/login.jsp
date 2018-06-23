<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";	
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>登录后台</title>
    <link rel="stylesheet" href="<%=basePath %>css/pure-min.css">
    <style>
        label {
            display: block;
        }
    </style>
</head>

<body>
    <div style="width:250px;margin:0 auto;margin-top:150px;">
       <h1 style="text-align:center;margin-bottom:20px;">hao's blog</h1>
        <form action="<%=path %>/LoginCheck" method="post" style="border:1px solid #606060;padding:15px;" class="pure-form pure-form-stacked">
            <fieldset>
                <legend>后台登录</legend>

                <label for="name">用户名</label>
                <input name="name" id="name" type="text" placeholder="Name">
                <span class="pure-form-message">This is a required field.</span>

                <label for="password">密码</label>
                <input name="password" id="password" type="password" placeholder="Password">

                <label for="remember" class="pure-checkbox">
                    <input id="remember" type="checkbox"> Remember me
                </label>

                <input style="float:right;" type="submit" value="登录" class="pure-button pure-button-primary">
            </fieldset>
        </form>
    </div>
    <script src="../js/jquery.min.js"></script>
</body>

</html>
