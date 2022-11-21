<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	 
<h1>映画紹介へようこそ</h1>
<p class="center"></p>
<form action="/movie/Login" method="post">
<p class="center">
ユーザー名:<input type="text" name="name"><br>
<p class="center">
パスワード:<input type="password" name="pass"><br>
<input type="submit" value="ログイン">
<p class="center">
</form>
</div>

</body>
</html>