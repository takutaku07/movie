<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.User" %>
    <%
    //セッションスコープからユーザー情報を取得
    User loginUser = (User) session.getAttribute("loginUser");
    %>
<!DOCTYPE html>
<html>
<head>
<style>
h1{
text-align: center;
}
.center{
text-align: center;
}
</style>
<meta charset="UTF-8">
<title>映画紹介</title>
<link href="css/color.css" rel="stylesheet">
</head>
<body>

<div class="gradient">
<div style="text-align:center;">
<h1>映画紹介ログイン</h1>
<p class="center"></p>
<% if(loginUser !=null) { %>
<p>ログインに成功しました</p>
<p>ようこそ<%= loginUser.getName() %>さん</p>
<a href="/movie/Main" class="btn">メインへ</a>
<% } else { %>
<p>ログインに失敗しました</p>
<a href="/movie/">トップへ</a>
<% } %>
</div>
</div>
</body>
</html>