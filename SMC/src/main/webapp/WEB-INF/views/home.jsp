<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
	<title>세상의 모든 치킨</title>
	<meta charset="utf-8" />
</head>	
<body>
<%
String id = (String)session.getAttribute("loggedID");
if(id!=null){
%>
	<header>
			<img src = "resources/img/SMClogo.png" width = "50" height = "50">
			<a href = "/test"><img src = "resources/img/logo2.png" width = "140" height = "50"></a>
			<a href= "CList.chic"><img src = "resources/img/list.png" width = "120" height = "50"></a>
			<a href= "CInsert.chic"><img src = "resources/img/regist.png" width = "120" height = "50"></a>
			<div style = "width: 300px; height: 50px; float: right;" ><%=id%>님 환영합니다. <a href= "/test/UserPage.chic">MY PAGE</a><a href= "/test/logout.chic">로그아웃</a></div>
	</header>
<%
} else{
%>
	<header>
			<img src = "resources/img/SMClogo.png" width = "50" height = "50">
			<a href = "/test"><img src = "resources/img/logo2.png" width = "140" height = "50"></a>
			<a href= "CList.chic"><img src = "resources/img/list.png" width = "120" height = "50"></a>
			<a href= "CInsert.chic"><img src = "resources/img/regist.png" width = "120" height = "50"></a>
			<div style = "width: 120px; height: 50px; float: right;" ><a href= "SignUp.chic">회원가입</a></div>
			<div style = "width: 120px; height: 50px; float: right;" ><a href= "SignIn.chic">로그인</a></div>
	</header>
<%

}%>
</body>
</html>
