<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.User,model.Mutter3,java.util.List,model.SiteEV3"%>
<%
//セッションスコープに保存されたユーザー情報を取得
User loginUser = (User) session.getAttribute("loginUser");
//アプリケーションスコープに保存されたつぶやきリストを取得
List<Mutter3> mutterList3 = (List<Mutter3>) application.getAttribute("mutterList3");
String errorMsg = (String) request.getAttribute("errorMsg");
%>
 <%
SiteEV3 siteEV3 = (SiteEV3) application.getAttribute("siteEV3");
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
<style>
.example{
    text-align: center;
}
</style>
<meta charset="UTF-8">
<title>タートルズ３</title>
</head>
<body bgcolor="green" text="#fff">
<h1>ミュータントタートルズ３の紹介ページ</h1>
<table align="center" bgcolor="#ffa500"><tr>
<th>写真</th><th>ストーリー</th>
</tr>
<tr>
<td><img src="img/tatols3.jpg" width="100" height="100"  alt="タートルズの写真"></td>
<td>
<p>ある日、エイプリルは骨董店で不思議な笏を手に入れたことにより、1603年の日本にある大名・ノリナガの城に転送されていた。<br>
魔女とみなされて牢屋に入れられた彼女は、イギリス人の海賊ホウィットと出会う。<br>
そのころ、ノリナガの子・ケンシンは彼女と入れ替えに現代に転送される。<br>
タートルズは1603年の日本に行ってエイプリルとホウィットを牢屋から出した後、紆余曲折を経て現代に戻り、ケンシンも1603年の日本に戻る。</p>
</td>
</tr>
</table>
<hr>
<div class="example">
	<p>

				<a href="/movie/Tatol3?action=like3">良いね</a>
				<%= siteEV3.getLike3() %>人
				<a href="/movie/Tatol3?action=dislike3">う～ん．．．</a>
				<%= siteEV3.getDislike3() %>人
			
				</P>
				</div>
				<div class="example">
	<p>
		<a href="/movie/Tatol">更新</a>
	</p>
	<form action="/movie/Tatol3" method="post">
		<input type="text" name="text"> <input type="submit"
			value="つぶやく">
	</form>
	</div>
	<%
	if (errorMsg != null) {
	%>
	<p><%=errorMsg%></p>
	<%
	}
	%>
	<%
	for (Mutter3 mutter3 : mutterList3) {
	%>
	<p><%=mutter3.getUserName()%>:<%=mutter3.getText3()%></p>
	<%
	}
	%>
<a href="/movie/Main">一覧に戻る</a>
</body>
</html>