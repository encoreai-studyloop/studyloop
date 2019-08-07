<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:query var="rs" dataSource="jdbc/encore">
	select count(*) from ws_user where nick = ?
	<sql:param value="${param.nick}"/>
</sql:query>

<c:forEach var="row" items="${rs.rowsByIndex}">
	<c:if test="${row[0] != 0 }">
		<result><![CDATA[
				{
					result:"fail",
					message: "사용할 수 없는 닉네임 입니다."
					}
		]]></result>
	</c:if>
	<c:if test="${row[0] == 0}">
		<result><![CDATA[
				{
					result:"success",
					message: "사용할 수 있는 닉네임 입니다."
					}
		]]></result>
	</c:if>
</c:forEach>