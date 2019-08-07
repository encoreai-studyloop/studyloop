<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="${project}js/script.js"></script>
	</head>
	<body>
		${sessionScope.userDto = userDto}
		<c:if test="${resultAttendee == 0}">
			<script type = "text/javascript">
				<!--
				alert( applyerror );
				//-->
			</script>
		</c:if>
		<c:if test="${resultAttendee != 0}">
		resultAttendee : ${resultAttendee}
		resultSchool : ${resultSchool}
		resultCareer ${resultCareer}
		resultLang ${resultLang}
		resultCert ${resultCert}
				<!--
				alert( resultcheck );
				//-->
		<script>
		window.close()
		</script>
		</c:if>
	</body>
</html>