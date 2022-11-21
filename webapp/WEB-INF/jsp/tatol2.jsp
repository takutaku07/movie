<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User,model.Mutter2,java.util.List,model.SiteEV2"%>
<% 
User loginUser = (User)session.getAttribute("loginUser");
 //アプリケーションスコープに保存されたつぶやきリストを取得 
 List<Mutter2> mutterList2 = (List<Mutter2>)application.getAttribute("mutterList2"); 
 String errorMsg = (String)request.getAttribute("errorMsg"); 
 %> 
 <%
SiteEV2 siteEV2 = (SiteEV2) application.getAttribute("siteEV2");
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
<title>タートルズ２</title>
</head>
<body bgcolor="green" text="#fff">
	<h1>ミュータントタートルズ２の紹介ページ</h1>
	<table align="center" bgcolor="#0000ff">
		<tr>
			<th>写真</th><th>ストーリー</th>
		</tr>
		<tr>
			<td><img src="img/tatols2.jpg" width="100" height="100"
				alt="タートルズの写真"></td>
			<td>
				<p>
					タートルズとスプリンターはフット団を撲滅するも、下水道にあった住居を失い、エイプリルの家に居候していた。<br>
					ある日、エイプリルはジョルダン・ペリー教授という人物にTGRI社の化学廃棄物処理について取材する。<br>
					一方ゴミ捨て場で生き延びていたシュレッダーは、廃棄物がタートルズが突然変異する原因だと突き止める。<br>
					シュレッダーはペリー教授を誘拐し、研究所から盗んできた廃棄物を用いてカミツキガメとオオカミをミュータントにする。<br>
					それぞれトッカとレイザーと名付けられた二体は、ペリー教授を助けに来たタートルズにけしかけられる。<br>
					だが、教授の細工によりこの二体の知能は3歳児程度しかなかった上、教授が用意した解毒剤によって元の姿に戻される。<br>
					追い詰められたシュレッダーは、自ら廃棄物を浴び、スーパーシュレッダーなるミュータントに変貌するも、タートルズによって撃破される。
				</p>
			</td>
		</tr>
	</table>
	<hr>
	<div class="example">
	<p>

				<a href="/movie/Tatol2?action=like2">良いね</a>
				<%= siteEV2.getLike2() %>人
				<a href="/movie/Tatol2?action=dislike2">う～ん．．．</a>
				<%= siteEV2.getDislike2() %>人
			
				</P>
				</div>
				<div class="example">
	<p>
	<a href="/movie/Tatol2">更新</a>
	</p>
	<form action="/movie/Tatol2" method="post">
	<input type="text" name="text">
	<input type="submit" value="つぶやく">
	</form>
	</div>
	<%
	if (errorMsg != null) {
	%>
	<p><%=errorMsg %></p>
	<% } %>
	<%
	for (Mutter2 mutter2 : mutterList2) {
	%>
	<p><%=mutter2.getUserName()%>:<%=mutter2.getText2()%></p>
	<%
	}
	%>
	<a href="/movie/Main">一覧に戻る</a>
</body>
</html>