
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
 <h3>치킨 목록 </h3>
 	<table style="1px solid black; width:30%; height:100px; margin : auto; text-align = center";>
 	<tr>
 		<td>이름</td>
 		<td>가격</td>
 		
 	</tr>
 	<%
 		if(clist!=null){
 			for(int i=0; i<clist.size();i++){
 		
 	%>
 	<form action = "/test/CReview.chic"><tr> 
 		<td><% String name = clist.get(i).getName(); out.println(name); %></td>
 		<td><%=clist.get(i).getPrice() %></td>
 		<td><button type = "submit" onclick = "location.href ='CReview.chic'" name = "name" value = "<%=name%>" formmethod = "get">리뷰 쓰기</button></td>
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