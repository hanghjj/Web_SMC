<%@ page import = "vo.User" %>
<%@ page import = "service.SignUpService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
<form class = "User" action = "/test/SignUp.chic" method = "post">
	<h3>회원가입</h3>
 이름 : <input type = "text" name = "name" required = "required">
 아이디 : <input type = "text" name = "id" required = "required">
 비밀번호 : <input type = "text" name = "pass" required = "required">
 	
  <button class = "btn" type = "submit">회원가입</button>
  <% 
	String name = request.getParameter("name");
	String id = request.getParameter("id");
 	String pass = request.getParameter("pass");
 	SignUpService sus = new SignUpService();
 	if(id!=null){
 	int s = sus.signup(new User(id,pass,name));
 	if(s==1){
 		out.println("<script>");
 		out.println("alert('회원가입이 완료되었습니다.')");
 		out.println("location.href = '/test'");
 		out.println("</script>");
 	}
 	else if(s==-1){
 		out.println("<script>");
 		out.println("alert('동일한 아이디가 존재합니다.')");
 		out.println("location.href = 'SignUp.chic'");
 		out.println("</script>");
 	}
 	else{
 		out.println("<script>");
 		out.println("alert('회원가입에 실패하였습니다.')");
 		out.println("location.href = 'SignUp.chic'");
 		out.println("</script>");
 	}
 	}
 	%>
 </form>
</body>
</html>