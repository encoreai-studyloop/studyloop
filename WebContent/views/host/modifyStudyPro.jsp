<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="setting.jsp" %>
<script src="${project}script.js"></script>

<% int result = (int) request.getAttribute("result");%>
<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
			alert("수정실패")
		-->
	</script>
	<meta http-equiv="refresh" content="0; url=main.do">
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="main.do"/>
</c:if> 

<!-- <form name="modifystudyproform" method="post" enctype="multipart/form-data"></form> -->