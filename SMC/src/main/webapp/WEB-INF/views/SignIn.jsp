<%@ page import = "vo.User" %>
<%@ page import = "service.SignInService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form class = "SignIn" action = "/test/SignIn.chic" method = "post">
	<h3>로그인</h3>
 아이디 : <input type = "text" name = "id" required = "required">
 비밀번호 : <input type = "text" name = "pass" required = "required">
 	
  <button class = "btn" type = "submit">로그인</button>
  <% 
	String id = request.getParameter("id");
 	String pass = request.getParameter("pass");
 	SignInService sis = new SignInService();
 	if(id!=null){
 	int s = sis.signin(new User(id,pass,"."));
 	if(s==1){
 		session.setAttribute("loggedID", id);
 		out.println("<script>");
 		out.println("alert('로그인이 완료되었습니다.')");
 		out.println("location.href = '/test'");
 		out.println("</script>");
 	}
 	else{
 		out.println("<script>");
 		out.println("alert('로그인 정보가 일치하지 않습니다.')");
 		out.println("location.href = 'SignIn.chic'");
 		out.println("</script>");
 	}
 	}
 	%>
 </form>
</body>
</html>