<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User,model.Mutter,java.util.List,model.SiteEV"%>

<%
//セッションスコープに保存されたユーザー情報を取得
User loginUser = (User) session.getAttribute("loginUser");
//アプリケーションスコープに保存されたつぶやきリストを取得
List<Mutter> mutterList = (List<Mutter>) application.getAttribute("mutterList");
String errorMsg = (String) request.getAttribute("errorMsg");
%>
<%
SiteEV siteEV = (SiteEV) application.getAttribute("siteEV");
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
<style>
.border-outset {
        border: 30px outset #ff0000;
      }
      </style> 
      



<meta charset="UTF-8">

<title>タートルズ</title>
</head>

<body bgcolor="green" text="#fff">
	<p style="text-align:center"><font size="7">ミュータントタートルズの紹介ページ</font></p>
	<p>
		<%=loginUser.getName()%>さん、ログイン中 <a href="/movie/Logout">ログアウト</a>
	</p>
	<div class="border border-outset">
	<table  align="center" bgcolor="#ff0000">
	
		<tr>
			<th>写真</th><th>ストーリー</th>
		</tr>
		<tr>
			<td><img src="img/tatols1.jpg" 
				alt="タートルズの写真"></td>
			<td>
				<p><font size="6">
					人気女性キャスターのエイプリルは、ニューヨークで暗躍するフット団を追跡しようとしたところを襲われてしまい<br>
					ラファエロ、レオナルド、ミケランジェロ、ドナテルロという4匹の大きな亀たちに助けられる。<br>
					彼らはある方法によって人間のような姿と人語をはなす能力を得、<br>
					同様に人間のような姿となったネズミのスプリンターの元で忍術の修業に励んでいた。<br>
					エイプリルが彼らと親しくなったのもつかの間、スプリンターがフット団に攫われる。<br>
					青年・ケーシーの協力を得て亀たちは救出に向かう。
				</font></p>
				
			</td>
		</tr>
	</table>
	</div>
	<hr>
<div class="example">
    
	<p>

				<a href="/movie/Tatol?action=like">良いね</a>
				<%= siteEV.getLike() %>人
				<a href="/movie/Tatol?action=dislike">う～ん．．．</a>
				<%= siteEV.getDislike() %>人
			
				</P>
				</div>
<div class="example">
	<p>
	
		<a href="/movie/Tatol">更新</a>
	</p>
	<form action="/movie/Tatol" method="post">
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
	for (Mutter mutter : mutterList) {
	%>
	<p><%=mutter.getUserName()%>:<%=mutter.getText()%></p>
	<%
	}
	%>

	<a href="/movie/Main">一覧に戻る</a>

</body>
</html>