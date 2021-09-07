<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		margin:0 auto;
		width:900px;
	}
	th{
		background-color:#f48fb1;
	}
</style>
</head>
<body>
<!-- 
	<c:if test="${login_id == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
-->
	<div>
		<table style="border:0px;width:900px;">
			<tr>
				<td align="right">
					${email}님 환영합니다.&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/fundingList.re">로그아웃</a>
				</td>			
			</tr>
		</table>
		<br>
		<br>
		<table style="width: 900px; border: 0px;">
			<tr align="center" valign="middle">
				<td><h3>funding</h3></td>
			</tr>
		</table>
		<form method="post" name="fundingForm" action="${pageContext.request.contextPath}/funding/fundingWriteOk.re">	
			<!-- 게시글 작성하는 인풋들 배치 테이블 -->
			<table border="1" style="border-collapse:collapse;">
				<tr height="30px">
					<th align="center" width="150px">
						제 목
					</th>
					<td>
						<input name="fundinfo" size="50" maxlength="100" placeholder="제목을 입력하세요">
					</td>
				</tr>
				<tr height="30px">
					<th align="center" width="150px">
						타입
					</th>
					<td>
						<input name="type" size="10" maxlength="20">
					</td>
				</tr>
				<tr height="300px">
					<th align="center" width="150px">
						유 닛
					</th>
					<td>
						<textarea name="unit" style="width:700px;height:250px;resize:none;"></textarea>					
					</td>
				</tr>
			</table>
			<table style="border:0px;">
				<tr align="right" valign="middle">
					<td>
						<a href="javascript:sendit()">[등록]</a>&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/funding/fundingList.re?page=${requestScope.page}">[목록]</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script>
	function sendit(){
		//유효성 검사
		document.fundingForm.submit();
		
	}
</script>
</html>




