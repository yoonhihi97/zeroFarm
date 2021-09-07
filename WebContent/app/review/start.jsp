<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="startForm" action="${pageContext.request.contextPath}/funding/startOk.re" method="post">
		<input type="text" name="email">
		<input type="button" value="들어가기" onclick="submit()">
	</form>
</body>
<script>let contextPath = "${pageContext.request.contextPath}";</script>
</html>
