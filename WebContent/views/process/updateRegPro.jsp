<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%	

	int result = (int) request.getAttribute("result");

	if(result ==0){ //실패
		%>
		<script>
		alert("평점을 다시 매겨주세요")
		</script>
		<%
		
		response.sendRedirect("mypage.do");
	}
	else{ //성공
		%>
		<script>
		alert("평점이 등록되었습니다")
		</script>
		<%
		
		response.sendRedirect("mypage.do");
	}
%>