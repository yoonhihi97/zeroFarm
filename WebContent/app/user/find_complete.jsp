<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${!param.flag eq null }">
			<script>
				alert("비밀번호 변경에 실패했습니다.")
				window.close();
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("비밀번호 변경이 완료되었습니다. 로그인해주세요")
				window.opener.location.href = "${pageContext.request.contextPath}/user/UserLoginGo.us"; // 부모창 index.html로 이동
				self.close(); // 자기 자신은 닫음.
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>