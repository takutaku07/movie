<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>映画紹介</title>
<link href="css/botan.css" rel="stylesheet">
<link href="css/haikei2.css" rel="stylesheet">
</head> 
<body text="#ffffff">
<div class="inner">
<h1>映画紹介へようこそ</h1>
<form action="/movie/Login" method="post">

<p>ユーザー名:<input type="text" name="name"></p>

<p>パスワード:<input type="password" name="pass"></p>


<button class="button" onclick="location.href='Login'">ログイン</button>


</form>
</div>
</body>
</html>