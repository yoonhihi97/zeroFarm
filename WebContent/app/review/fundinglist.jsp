<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>funding 게시판</title>
<style>
	a:visited {
		text-decoration: none;
		color:#2196f3;
	}
	a:link {
		text-decoration: none;
		color:#2196f3;
	}
	a:hover {
		font-weight:bold;
	}

</style>
</head>
<body>
<!-- 
	<c:if test="${login_id == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/review.re);
		</script>
	</c:if>
-->
	<!-- FundingListAction.java 에서 보내주는 데이터들을 변수로 만들기 -->
	<c:set var="fundinglist" value="${requestScope.fundingList}"/>
	<c:set var="page" value="${requestScope.page}"/>
	<c:set var="startPage" value="${requestScope.startPage}"/>
	<c:set var="endPage" value="${requestScope.endPage}"/>
	<c:set var="totalCnt" value="${requestScope.totalCnt}"/>
	<c:set var="totalPage" value="${requestScope.totalPage}"/>
	
	<div style="text-align:center;">
		<table style="border:0px;width:900px;">
			<tr align="right" valign="middle">
				<td>
					${email}님 환영합니다.&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/fundingList.re">로그아웃</a>
				</td>			
			</tr>
		</table>
		<!-- 제목과 글 개수 띄워주는 테이블 -->
		<table style="width:900px;border:0px;">
			<tr align="center" valign="middle">
				<td><h3>funding</h3></td>
			</tr>
			<tr align="right" valign="middle">
				<td>글 개수 : ${totalCnt}개</td>
			</tr>
		</table>
		<!-- 게시글 리스트 띄우는 테이블 -->
		<table border="1" style="border-collapse:collapse; border-spacing:0; width:900px;">
			<tr align="center" valign="middle">
				<th width="8%">번호</th>
				<th width="50%">인포</th>
				<th width="15%">타입</th>
				<th width="17%">작성날짜</th>
				<th width="10%">마감날짜</th>
			</tr>
			<c:choose>
				<c:when test="${fundingList != null and fn:length(fundingList)>0 }">
					<!-- 보여줄 게시글 목록이 있음 -->
					<c:forEach items="${fundingList}" var="funding">
						<tr onmouseover="this.style.background='#f9fbe7'" onmouseout="this.style.background=''">
							<td height="25">${funding.fundnum}</td>
							<td>							 
								<a href="${pageContext.request.contextPath}/funding/review.re?fundnum=${funding.fundnum}">
									${funding.fundinfo}
								</a>
							</td>
							<td>${funding.type }</td>
							<td>${funding.startdate }</td>
							<td>${funding.enddate }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<!-- 보여줄 게시글 목록이 없음 -->
					<tr>
						<td colspan="5" align="center">
							등록된 펀딩이 없습니다.
						</td>
					</tr>
				</c:otherwise>
			</c:choose>

		</table><br>

		<!-- 페이징 처리하는 테이블 -->
		<table style="border:0px;width:900px">
			<tr align="center" valign="middle">
				<td>
					<c:if test="${page>1}">
						<a href="${pageContext.request.contextPath}/funding/fundingList.re?page=${page-1}">[&lt;]</a>
					</c:if>
					<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
						<c:choose>
							<c:when test="${page == i}">[${i}]</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/funding/fundingList.re?page=${i}">[${i}]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${page<totalPage}">
						<a href="${pageContext.request.contextPath}/board/BoardList.bo?page=${page+1}">[&gt;]</a>
					</c:if>
				</td>
			</tr>
		</table> 
		<!-- 글쓰기 버튼 배치하는 테이블 -->
		<table style="border:0px; width:900px;">
			<tr align="right" valign="middle">
				<td><a href="${pageContext.request.contextPath}/funding/fundingWrite.re?page=${page}">[글쓰기]</a></td>
			</tr>
		</table>
	</div>
</body>
</html>

