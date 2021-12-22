
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
<form class = "Chic-regist" action = "/test/CInsert.chic" method = "get">
 	이름 : <input type="text" name = "name" required = "required"><br>
 	가격 : <input type="text" name = "price" required = "required"><br>
 	<button class = "btn" type = "submit">등록</button>
 </form>
 <%
 	String name = request.getParameter("name");
 	String price = request.getParameter("price");
 	if(name!=null){
 	Chicken chic = new Chicken(name, Integer.parseInt(price));
 	ChickenInsertService cis = new ChickenInsertService();
 	boolean iS = cis.insertChicken(chic);
 	if(iS) System.out.println("저장 성공");
 	else System.out.println("저장 실패");
 	}
 %>
</body>
</html>