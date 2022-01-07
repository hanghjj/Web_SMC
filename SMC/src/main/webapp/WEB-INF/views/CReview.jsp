<%@ page import = "vo.Review" %>
<%@ page import = "service.ReviewInsertService" %>
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
 	String name = request.getParameter("name");
 	String id = (String)session.getAttribute("loggedID");
 %>
 <form class = "Rev-regist" action = "/test/CReview.chic" method = "get">
 <h3><%=name %> 리뷰 쓰기</h3>
 이름 : <input type = "text" name = "name" value ="<%=name %>" readonly>  작성자 : <input type = "text" name = "reviewer" value ="<%=id %>" readonly>
 평점 : <input type="number" min="0" max="5" step = 1 name ="grade" required = "required"><br>
 리뷰 : <textarea name = "text" cols="50" rows="10"></textarea>
 
	<% 
	name = request.getParameter("name");
	String grade = request.getParameter("grade");
 	String review = request.getParameter("text");
 	if(grade!=null&&name!=null){
 		Review rev = new Review(name,Integer.parseInt(grade),review,id);
 		ReviewInsertService ris = new ReviewInsertService();
 		int iS = ris.insertRev(rev);
 	 	
 		if(iS==1) out.println("등록 완료되었습니다.");
 		else if(iS==-1){out.println("등록 과정에서 오류가 발생했습니다.");}
 	 	else out.println("등록에 실패하였습니다.");
 	}
 	%>
 <button class = "btn" type = "submit">등록</button>

 </form>
 <form class = "Rev-list" action = "/test/Rlist.chic" method = "get">
 	<input type = "hidden" name = "name" value ="<%=name %>" >
 	<button class = "btn" type = "submit">리뷰 목록으로</button>
 </form>
</body>
</html>