<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<sql:query var="rs" dataSource="jdbc/encore">
	select purpose, goal from ws_attendee where user_id=? and study_id=?
		<sql:param value="${param.user_id}"/>
		<sql:param value="${param.study_id}"/>
</sql:query>

<result>
	{
		code: "success", 
		data : [
			<c:forEach var="row" items="${rs.rows}">
				{
					purpose: "${row.purpose}", 
					goal: "${row.goal}"
				},
			</c:forEach>
		]
	}
</result>