<%@page import="databean.UserDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<script src="${project}script.js"></script>

<h2>ㄷㄷ</h2>

<%	
	int result = (int) request.getAttribute("result");
	session.removeAttribute("studyDto");
	session.removeAttribute("studytimeDto");
	response.sendRedirect("sdelete.do");
%>