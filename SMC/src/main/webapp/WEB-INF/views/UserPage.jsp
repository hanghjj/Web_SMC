<%@ page import = "service.UserPageService"  %>
<%@ page import = "service.ReviewListService" %>
<%@ page import = "vo.User"  %>
<%@ page import = "vo.Review" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<style>
table {
    margin-left:auto; 
    margin-right:auto;
}

table,  th {
    border-collapse : collapse;
    border : 1px solid black;
    
}
td{
	border : 1px solid black;

}
;
</style>
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
	ReviewListService rls = new ReviewListService();
	ArrayList<Review> rlist = rls.getRlist(id);
%>	
	<table style="1px solid black; width:30%; height:100px; margin : auto; text-align = center";>
	
 	<tr>
 		<td>이름 :  </td>
 		<td> <%=u.getName()%></td>
 		
 	</tr>
 	<tr>
 		<td>아이디 :</td>
 		<td> <%=u.getId()%></td>
 	</tr>
 	</table>
 	<h3>작성한 리뷰 목록 </h3>
 	<table>
 	<tr>
 		<td width = "200">이름</td>
 		<td width = "50">평점</td>
 		<td width = "200">내용</td>
 		<td width = "100">작성자</td>
 		
 	</tr>
<%

		if(rlist.size()!=0){
			for(int i=0; i<rlist.size();i++){
%>
	<tr> 
 		<td><% String names = rlist.get(i).getName(); out.println(names); %></td>
 		<td><%=rlist.get(i).getGrade() %></td>
 		<td><%=rlist.get(i).getText() %></td>
 		<td><%=rlist.get(i).getReviewer() %></td>
 	</tr>
				
<%
				
			}
			
		}
		else{%>
			<tr><td colspan="2"> 등록된 리뷰가 없습니다. </td></tr>
			<%
		}
	}else{
		

%> 

<%
	out.println("<script>");
	out.println("alert('오류가 발생하였습니다.')");
	out.println("location.href = '/test'");
	out.println("</script>");
}
%>	
</body>
</html>