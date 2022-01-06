<%@ page import = "service.UserPageService"  %>
<%@ page import = "vo.User"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY Page</title>
</head>
<body>
<%
String id = (String)session.getAttribute("loggedID");
if(id==null){
		out.println("<script>");
		out.println("alert('로그인 후 이용 가능합니다.')");
		out.println("location.href = '/test'");
		out.println("</script>");
}
UserPageService usp = new UserPageService();
User u = usp.getUinfromation(id);
if(!u.getName().equals("0000")){
%>
	<table style="1px solid black; width:30%; height:200px; margin : auto; text-align = center";>
 	<tr>
 		<td>이름 :  </td>
 		<td> <%=u.getName()%></td>
 		
 	</tr>
 	<tr>
 		<td>아이디 :</td>
 		<td> <%=u.getId()%></td>
 	</tr>
 	</table>
<%}
else{
	out.println("<script>");
	out.println("alert('오류가 발생하였습니다.')");
	out.println("location.href = '/test'");
	out.println("</script>");
}
%>
</body>
</html>