<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC2 게시판</title>
</head>
<body>
	<c:if test="${login_id == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
	<div style="text-align:center;">
		<table style="border:0px;width:900px;">
			<tr>
				<td>
					${login_id}님 환영합니다.&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/user/UserLogoutOk.us">로그아웃</a>
				</td>			
			</tr>
		</table>
		<!-- 제목과 글 개수 띄워주는 테이블 -->
		<table style="width:900px;border:0px;">
			<tr align="center" valign="middle">
				<td><h3>MVC 게시판</h3></td>
			</tr>
			<tr align="right" valign="middle">
				<td>글 개수 : ????개</td>
			</tr>
		</table>
		<!-- 게시글 리스트 띄우는 테이블 -->
		<table border="1" style="border-collapse:collapse; border-spacing:0; width:900px;">
			<tr align="center" valign="middle">
				<th width="8%">번호</th>
				<th width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="17%">날짜</th>
				<th width="10%">조회수</th>
			</tr>

		</table><br>

		<!-- 페이징 처리하는 테이블 -->
		<table style="border:0px;width:900px">
			<tr align="center" valign="middle">
	
			</tr>
		</table> 
		<!-- 글쓰기 버튼 배치하는 테이블 -->
		<table style="border:0px; width:900px;">
			<tr align="right" valign="middle">
				<td>[글쓰기]</td>
			</tr>
		</table>
	</div>
</body>
</html>

