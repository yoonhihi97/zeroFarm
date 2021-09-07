<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
		<table style="border: 0px; width: 900px;">
			<tr>
				<td align="right">${email}님 환영합니다.&nbsp;&nbsp; <a
					href="${pageContext.request.contextPath}/fundingList.re">로그아웃</a>
				</td>
			</tr>
		</table>
		<br> <br>
		<table style="width: 900px; border: 0px;">
			<tr align="center" valign="middle">
				<td><h3>funding</h3></td>
			</tr>
		</table>
		<c:set var="review" value="${requestScope.review}"/>
		<!-- 게시글 보여주는 인풋들 배치 테이블 -->
		<table border="1" style="border-collapse: collapse;">
			<tr height="30px">
				<th align="center" width="150px">제 목</th>
				<td><input name="fundinfo" value="${funding.fundinfo}" size="50" maxlength="100" readonly>
				</td>
			</tr>
			<tr height="30px">
				<th align="center" width="150px">글쓴이</th>
				<td><input name="type" size="10" maxlength="20" value="${funding.type}"
					readonly></td>
			</tr>
			<tr height="300px">
				<th align="center" width="150px">내 용</th>
				<td><textarea name="unit"
						style="width: 700px; height: 250px; resize: none;" readonly>${funding.unit}</textarea>
				</td>
			</tr>
			
		</table>
		<table style="border: 0px;">
			<tr align="right" valign="middle">
				<td>
					<a href="${pageContext.request.contextPath}/funding/fundingList.re?page=${requestScope.page}">[목록]</a>
				</td>
			</tr>
		</table>
<!-- 리뷰 뷰단 시작 -->
<form name="reviewForm" method="post" action="${pageContext.request.contextPath}/funding/ReviewWriteOk.re">
			<input type="hidden" value="${funding.fundnum}" name="fundnum">
			<table>
			<tr height="10px">
				<td style="text-align:center">
						리 뷰 작 성
				</td>
			</tr>
			<tr height="200px">
					
				<td style="text-align:right">
					<textarea name="content" style="width:900px;height:85px;resize:none;"></textarea><br>
					<a href="javascript:document.reviewForm.submit();">[등록]</a>
				</td>
			</tr>
			</table>
		</form>
		<form name="updateForm" action="${pageContext.request.contextPath }/funding/ReviewModifyOk.re" method="post">
			<input type="hidden" name="fundnum" value="${funding.fundnum}">
		<table border="1" style="border-collapse: collapse;width:900px;">
			<tr>
				<th style="width:150px;">작성자(email)</th>
				<th style="width:500px;">리뷰 내용</th>
				<th style="width:100px;">작성일</th>
				<th style="width:100px;">수정일</th>
				<th style="width:50px;">좋아요</th>
			</tr>
			<c:choose>
				<c:when test="${review != null and fn:length(review)>0}">
					<c:set var="i" value="0"/>
					<c:forEach items="${review}" var="review">
						<c:set var="i" value="${i+1}"/>
						<tr>
							<td align="center">${review.email}</td>
							<td valign="top">
								<table style="width:500px;">
									<tr>
										<td align="center">
											<textarea name="review${i}" id="review${i}" rows="5" style="resize:none; width:500px;" readonly>${review.content}</textarea>
										</td>
									</tr>
									<tr>
										<td align="right">
											<c:if test="${review.email == sessionScope.email}">
												<a id="ready${i}" href="javascript:updateReview(${i});">[수정]</a>
												<a id="ok${i}" style="display:none;" href="javascript:updateOk(${review.reviewnumber},${i})">[수정완료]</a>&nbsp;&nbsp;
												<a href="${pageContext.request.contextPath}/funding/ReviewDeleteOk.re?reviewnumber=${review.reviewnumber}&fundnum=${funding.fundnum}">[삭제]</a>
											</c:if>
										</td>
									</tr>
								</table>
							</td>
							<td align="center">
								${review.wdate}<!-- ${fn:substring(review.wdate,0,10)}  --> 
							</td>
							<td align="center">
								${review.udate}<!-- ${fn:substring(review.udate,0,10)}  -->
							</td>
							<td align="center">
								<a href="${pageContext.request.contextPath}/funding/LikeUpOk.re?reviewnumber=${review.reviewnumber}&fundnum=${funding.fundnum}">${review.like}</a>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5" align="center">작성 된 리뷰가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		</form>
		<!-- 리뷰 뷰단 끝 -->
</body>
<!-- 리뷰 스크립트 시작 -->
<script>
	function updateReview(num){
		let udBtn = document.getElementById("ready"+num);
		let okBtn = document.getElementById("ok"+num);
		let reviewTag = document.getElementById("review"+num);
		
		udBtn.style.display="none";
		okBtn.style.display="";
		reviewTag.removeAttribute("readonly");
	}
	function updateOk(reviewnumber, num){
		let udBtn = document.getElementById("ready"+num);
		let okBtn = document.getElementById("ok"+num);
		let reviewTag = document.getElementById("review"+num);
		
		udBtn.style.display="";
		okBtn.style.display="none";
		reviewTag.setAttribute("readonly","readonly");
		
		//localhost:9090/board/ReplyModifyOk.bo?replynum=101&num=3&boardnum=100012
		document.updateForm.setAttribute("action","${pageContext.request.contextPath}"
						+"/funding/ReviewModifyOk.re?reviewnumber="+reviewnumber+"&num="+num);
		document.updateForm.submit();
	}
</script>
<!-- 리뷰 스크립트 끝 -->
</html>