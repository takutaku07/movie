<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.User" %>
    <%
    //セッションスコープに保存されたユーザー情報を取得
    User loginUser = (User) session.getAttribute("loginUser");
    %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>映画リスト一覧</title>

<link href="css/botan.css" rel="stylesheet">
<link href="css/haikei3.css" rel="stylesheet">
</head>
<body text="#000000">
<div class="inner">
<p style="text-align:center"><font size="7"><span>映画作品一覧</span></font></p>

<%= loginUser.getName() %>さん、ログイン中

<p>
<div class="wrap">
<button class="button" onclick="location.href='Logout'">ログアウト</button>
</div>

<div class="border border-outset">
<table border="1" align="center" >
<tr>
<th>タイトル</th><th>上映日</th>
</tr>
<tr>
<td><a href="/movie/Tatol">タートルズ</a></td>
<td>1990/3/30</td>
</tr>
<tr>
<td><a href="/movie/Tatol2">タートルズ２</a></td>
<td>1991/3/22</td>
</tr>
<tr>
<td><a href="/movie/Tatol3">タートルズ３</a></td>
<td>1993/3/17</td>
</tr>
<tr>
<td><a href="/movie/Tatol4">タートルズ(リブート)</a> </td>
<td>2015/2/7</td>
</tr>
</table>
</div>
</div>

</body>
</html>