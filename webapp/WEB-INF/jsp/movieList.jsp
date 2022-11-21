<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>映画リスト一覧</title>
</head>
<body>
<form action="/servlet/MovieListCheck" method="get">
</form>
<h1>映画作品一覧</h1>
<table border="1">
<tr>
<th>タイトル</th>
<th>上映日</th>
</tr>
<tr>
<td><a href="tatol.jsp">タートルズ</a></td>
<td>1990/3/30</td>
</tr>
<tr>
<td><a href="tatol2.jsp">タートルズ２</a></td>
<td>1991/3/22</td>
</tr>
<tr>
<td><a href="tatol3.jsp">タートルズ３</a></td>
<td>1993/3/17</td>
</tr>
<tr>
<td><a href="tatol4.jsp">タートルズ(リブート)</a> </td>
</tr>
</table>
</body>
</html>