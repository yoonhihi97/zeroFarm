<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우오ㅓ아아악아앙멘탈</title>
</head>
<body>
	<c:choose>
		<c:when test="${param.flag eq null }">
			<script>
				alert("회원 탈퇴에 성공하셨습니다. \n그동안 이용해주셔서 감사합니다.")
				window.opener.location.href = "${pageContext.request.contextPath}/user/Index.us"; // 부모창 index.html로 이동
				self.close(); // 자기 자신은 닫음.
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("회원 탈퇴에 실패하셨습니다.")
				window.close();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>