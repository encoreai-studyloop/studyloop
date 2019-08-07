<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "setting.jsp" %>


<h2>회원가입</h2>
<c:if test="${result == 0}">

		<script>
		alert("실패")
		</script>
</c:if>
<c:if test="${result != 0}">
		<c:redirect url="login.do"/>
</c:if>
	
