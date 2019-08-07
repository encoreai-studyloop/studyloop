<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%	

	int result = (int) request.getAttribute("res");

	if(result ==0){
		%>	
		<script>
		alert("입력 실패")
		window.close()
		</script>
		<%
	}
	else{ 
		%>	
		<script>
		alert("입력 성공")
		window.close()
		</script>
		<%
	
	}
%>