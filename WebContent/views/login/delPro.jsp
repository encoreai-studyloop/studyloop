<%@page import="databean.UserDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<script src="${project}js/login.js"></script>

<h2>${page_login}</h2>

<%	
	int result = (int) request.getAttribute("result");
	session.removeAttribute("userDto");
	response.sendRedirect("main.do");
%>