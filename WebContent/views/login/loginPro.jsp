<%@page import="databean.UserDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<script src="${project}js/login.js"></script>

<h2>${page_login}</h2>

<%	
	String email = (String) request.getAttribute("email");
	int result = (int) request.getAttribute("result");

	if(result ==0){ //아이디 없음
		session.setAttribute("fail", "1");
		response.sendRedirect("login.do?fail=1");
	}
	else if(result==-1){ //비밀번호 다름
		session.setAttribute("fail", "1");
		response.sendRedirect("login.do?fail=1");
	}
	else{ //로그인 성공 - 세션 만들기
		UserDataBean userDto = (UserDataBean)request.getAttribute("userDto");
		session.setAttribute("userDto", userDto);
		session.setAttribute("userEmail", email);
		
		response.sendRedirect("main.do");
	}
%>