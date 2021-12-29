
<%@ page import = "vo.Chicken" %>
<%@ page import = "service.ChickenInsertService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>치킨 정보 등록</title>
</head>
<body>
<header>
			<img src = "resources/img/SMClogo.png" width = "50" height = "50">
			<a href = "/test"><img src = "resources/img/logo2.png" width = "140" height = "50"></a>
			<a href= "CList.chic"><img src = "resources/img/list.png" width = "120" height = "50"></a>
			<a href= "CInsert.chic"><img src = "resources/img/regist.png" width = "120" height = "50"></a>
</header>
<form class = "Chic-regist" action = "/test/CInsert.chic" method = "get">
 	이름 : <input type="text" name = "name" required = "required"><br>
 	가격 : <input type="text" name = "price" required = "required"><br>
 	<button class = "btn" type = "submit">등록</button>
 </form>
 
  <a href= "CList.chic">치킨 목록</a>
 
 <%
 	String name = request.getParameter("name");
 	String price = request.getParameter("price");
 	
 		if(name!=null){
 			Chicken chic = new Chicken(name, Integer.parseInt(price));
 			ChickenInsertService cis = new ChickenInsertService();
 			int iS = cis.insertChicken(chic);
 			if(iS==1) out.println("등록 완료되었습니다.");
 			else if(iS==-1){out.println("이미 등록되어있는 치킨입니다.");}
 			else out.println("등록에 실패하였습니다.");
 		}
 	
 %>
</body>
</html>