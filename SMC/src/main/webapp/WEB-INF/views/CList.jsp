
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
 	<tr>
 		<td><%=clist.get(i).getName() %></td>
 		<td><%=clist.get(i).getPrice() %></td>
 	</tr>
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