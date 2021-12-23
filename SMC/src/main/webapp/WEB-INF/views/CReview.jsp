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
		
	

 <%
 	String name = request.getParameter("name");
 %>
 <form class = "Rev-regist" action = "/test/CReview.chic" method = "get">
 <h3><%=name %> 리뷰 쓰기</h3>
 이름 : <input type = "text" name = "name" value ="<%=name %>" readonly>
 평점 : <input type="number" min="0" max="5" step = 1 name ="grade" required = "required"><br>
 리뷰 : <textarea name = "text" cols="50" rows="10"></textarea>
 
	<% 
	name = request.getParameter("name");
	String grade = request.getParameter("grade");
 	String review = request.getParameter("text");
 	if(grade!=null&&name!=null){
 		Review rev = new Review(name,Integer.parseInt(grade),review);
 		ReviewInsertService ris = new ReviewInsertService();
 		int iS = ris.insertRev(rev);
 	 	
 		if(iS==1) out.println("등록 완료되었습니다.");
 		else if(iS==-1){out.println("등록 과정에서 오류가 발생했습니다.");}
 	 	else out.println("등록에 실패하였습니다.");
 	}
 	%>
 <button class = "btn" type = "submit">등록</button>
 </form>
</body>
</html>