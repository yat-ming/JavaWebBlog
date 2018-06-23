<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>后台模板</title>
    <link rel="stylesheet" href="../css/pure-min.css">
    <link rel="stylesheet" href="../css/writearticle.css">
</head>

<body>
    <%@ include file="topColumn.jsp" %>
    <%@ include file="adminmenu.html" %>
    <div id="content">
        <div id="wrap">
            <h1 style="font-weight:300">撰写新文章</h1>
            <form id="addArticle" action="addArticle.do" method="post" target="article_preview" class="pure-form">
                <div style="width:100%;min-width:500px;float:left;">
                    <input type="text" name="title" class="pure-input-1" style="margin-bottom:20px;" placeholder="在此输入标题" />
                    <textarea name="ckeditor" id="" cols="30" rows="10"></textarea>
                </div>
                <div class="fabu">
                    <h2>发布</h2>
                    <div class="inside">
                        <div style="margin-bottom:10px;">
                            <a class="pure-button" href="#">保存草稿</a>
                            <a class="pure-button" id="article_preview" href="#" style="float:right;">预览</a>
                        </div>
                        状态：草稿
                    </div>
                    <div class="clearfix" style="background-color:#f4f4f4;border-top:1px solid #a1a1a1;">
                        <input class="pure-button pure-button-primary" type="submit" style="float:right;margin:5px;" value="发布" />
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/script.js"></script>
    <script src="../ckeditor/ckeditor.js"></script>
    <script>
        CKEDITOR.replace('ckeditor', {
            height: '300px',
            filebrowserBrowseUrl: '/browser/browse.php',
            filebrowserUploadUrl: 'articleImageUpload.do'
        });
        $("#article_preview").click(function() {
            $("#addArticle").attr("action", "articlePre.jsp");
            $("#addArticle").submit();
            $("#addArticle").attr("action", "addArticle.do");
            return false;
        })
    </script>
</body>

</html>
