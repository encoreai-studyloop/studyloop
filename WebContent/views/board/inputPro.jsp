<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<%
int res = (Integer)request.getAttribute("res");
if(res ==0){
	%>
	<script>
	alert("글 작성 실패..");
	
	</script>
	<%
}
else{
	%>
	<script>
	alert("글 작성 성공");
	</script>
	<c:redirect url="boardlist.do"/>
	<%
}
%>