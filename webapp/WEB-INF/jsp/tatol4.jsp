<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.User,model.Mutter4,java.util.List,model.SiteEV4"%>
<%
//セッションスコープに保存されたユーザー情報を取得
User loginUser = (User) session.getAttribute("loginUser");
//アプリケーションスコープに保存されたつぶやきリストを取得
List<Mutter4> mutterList4 = (List<Mutter4>) application.getAttribute("mutterList4");
String errorMsg = (String) request.getAttribute("errorMsg");
%>
 <%
SiteEV4 siteEV4 = (SiteEV4) application.getAttribute("siteEV4");
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
<title>タートルズ(リブート)</title>
</head>
<body bgcolor="green" text="#fff">
<h1>ミュータントタートルズ（リブート）の紹介ページ</h1>
<table align="center" bgcolor="#800080"><tr>
<th>写真</th><th>ストーリー</th>
</tr>
<tr>
<td><img src="img/tatols4.jpg" width="100" height="100"  alt="タートルズの写真"></td>
<td>
<p>
チャンネル6のレポーター、エイプリル・オニールはニューヨーク市の港で犯罪シンジケート「フット団」の構成員達が<br>
忍者らしき集団に襲われる場面を目撃したが、上司から証拠が無い事を理由に信じられなかった。<br>
同じころ、ニューヨーク市はエイプリルの亡き父の勤務先だった大企業サックス社との契約を更新していた。<br>
「フット軍団」のボス、鍛練をしていたシュレッダーは、部下達の失態を聞く。<br>
殺されると分かっていても鍛練に付き合うほど「フット」の主従関係は徹底していた。<br>
シュレッダーは部下たちに忍者の正体を探ることを命じる。<br>
再び忍者集団が地下鉄に現れたフット軍団を叩きのめし、<br>
SWATの到着と入れ替わりに去っていき、エイプリルは様子を写真に収める事ができた。<br>
忍者の正体は人語を喋る亀で、師匠は人語を喋る鼠だった。<br>
そして、彼らとエイプリルとは過去に接点があった。<br>
一方、フット軍団たちはある邪悪な企みを遂行していた。
</p>
</td>
</tr>
</table>
<hr>
<div class="example">
	<p>

				<a href="/movie/Tatol4?action=like4">良いね</a>
				<%= siteEV4.getLike4() %>人
				<a href="/movie/Tatol4?action=dislike4">う～ん．．．</a>
				<%= siteEV4.getDislike4() %>人
			
				</P>
				</div>
				<div class="example">
	<p>
		<a href="/movie/Tatol">更新</a>
	</p>
	<form action="/movie/Tatol4" method="post">
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
	for (Mutter4 mutter4 : mutterList4) {
	%>
	<p><%=mutter4.getUserName()%>:<%=mutter4.getText4()%></p>
	<%
	}
	%>
<a href="/movie/Main">一覧に戻る</a>
</body>
</html>