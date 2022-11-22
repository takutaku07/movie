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

<meta charset="UTF-8">
<title>映画紹介</title>
<link href="css/botan.css" rel="stylesheet">
<link href="css/haikei.css" rel="stylesheet">
</head>
<body text="#000000">
<div class="inner">
<h1>映画紹介ログイン</h1>
<% if(loginUser !=null) { %>
<p>ログインに成功しました</p>

<p>ようこそ<%= loginUser.getName() %>さん</p>


<button class="button" onclick="location.href='Main'">メイン</button>
<% } else { %>
<p>ログインに失敗しました</p>

<button class="button" onclick="location.href='/movie/'">トップ</button>
<% } %>
</div>

</body>
</html>