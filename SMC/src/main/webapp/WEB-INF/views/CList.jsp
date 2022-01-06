
<%@ page  import = "vo.Chicken"%>
<%@ page  import = "java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 치킨</title>
<%
	ArrayList<Chicken> clist =  (ArrayList<Chicken>)request.getAttribute("chic");
	
	
%>
</head>
<body>
<%
String id = (String)session.getAttribute("loggedID");
if(id==null){
		out.println("<script>");
		out.println("alert('로그인 후 이용 가능합니다.')");
		out.println("location.href = '/test'");
		out.println("</script>");
}%>
 <header>
			<img src = "resources/img/SMClogo.png" width = "50" height = "50">
			<a href = "/test"><img src = "resources/img/logo2.png" width = "140" height = "50"></a>
			<a href= "CList.chic"><img src = "resources/img/list.png" width = "120" height = "50"></a>
			<a href= "CInsert.chic"><img src = "resources/img/regist.png" width = "120" height = "50"></a>
			<div style = "width: 300px; height: 50px; float: right;" ><%=id%>님 환영합니다. <a href= "/test/logout.chic">로그아웃</a></div>
</header>


 <h3>치킨 목록 </h3>
 	<table style="1px solid black; width:30%; height:200px; margin : auto; text-align = center";>
 	<tr>
 		<td>이름</td>
 		<td>가격</td>
 		
 	</tr>
 	<%
 		if(clist!=null){
 			for(int i=0; i<clist.size();i++){
 		
 	%>
 	<form action = "/test/CReview.chic">
 	<tr> 
 		<td><% String name = clist.get(i).getName(); out.println(name); %></td>
 		<td><%=clist.get(i).getPrice() %></td>
 		<td><button type = "submit" onclick = "location.href ='CReview.chic'" name = "name" value = "<%=name%>" formmethod = "get">리뷰 쓰기</button></td>
 	</tr>
 	</form>
 	<form class = "Rev-list" action = "/test/Rlist.chic" method = "get">
 	
 	 <tr> 
 		<td><input type = "hidden" name = "name" value ="<%=name %>" ></td>
 		<td><button class = "btn" type = "submit">리뷰 목록</button></td>
 	</tr> 
 	</form>
 	
 	<%
 		}
 	} else{
 	%>
 	 <tr><td colspan="2"> 등록된 치킨이 없습니다. </td></tr>
 	<%
 	}
 	%>
 	
 	
 	</table>
 
</body>
</html>