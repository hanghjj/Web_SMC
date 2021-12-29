<%@ page  import = "vo.Review"%>
<%@ page  import = "service.ReviewListService"%>
<%@ page  import = "java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Title</title>
</head>
<body>
<header>
			<img src = "resources/img/SMClogo.png" width = "50" height = "50">
			<a href = "/test"><img src = "resources/img/logo2.png" width = "140" height = "50"></a>
			<a href= "CList.chic"><img src = "resources/img/list.png" width = "120" height = "50"></a>
			<a href= "CInsert.chic"><img src = "resources/img/regist.png" width = "120" height = "50"></a>
</header>
<%
	ArrayList<Review> temp = (ArrayList<Review>)request.getAttribute("review");
	String name = (String)request.getParameter("name");
	out.println(name);
	ReviewListService rls = new ReviewListService();
	ArrayList<Review> rlist = rls.getspecificRlist(temp, name);
%>

 <h3>리뷰 목록 </h3>
 	<table style="1px solid black; width:30%; height:100px; margin : auto; text-align = center";>
 	<tr>
 		<td>이름</td>
 		<td>평점</td>
 		<td>내용</td>
 		
 	</tr>
 	<%
 		if(rlist.size()!=0){
 			for(int i=0; i<rlist.size();i++){
 		
 	%>
	<tr> 
 		<td><% String names = rlist.get(i).getName(); out.println(name); %></td>
 		<td><%=rlist.get(i).getGrade() %></td>
 		<td><%=rlist.get(i).getText() %></td>
 	</tr>
 	<%
 		}
 	} else{
 	%>
 	 <tr><td colspan="2"> 등록된 리뷰가 없습니다. </td></tr>
 	<%
 	}
 	%>
 	
 	
 	</table>
 


</body>
</html>