<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="kor">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제로팜 이메일 인증</title>
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>제로팜</title>
    <link rel="icon" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/logo.png">
    <!-- 폰트 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/bootstrap.min.css">
    <!-- style CSS -->
    <!-- 이메일 인증 전용 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/email.css">
        <!-- 이메일 인증 전용 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/style.css">
</head>
<body>


<!-- 로고 및 헤더 -->
<div class ="header">
	<div class ="logo">
		<span class="logo_title">
			<img src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/logo.png" alt="logo">
		</span><hr>
	</div>
</div>
<!-- 본문 -->	
<div class ="aside">
	<div class ="comment">
		<span class ="comment_box">
		<p id ="title">Zerofarm</p>
		<h2>
			<span class ="strong_box">
			메일인증
			</span>
		 안내입니다.</h2>
		<span></span>
		<p>안녕하세요</p>
		<p>
			<span class ="strong_box">
				제로팜
			</span>
		 회원가입 인증 창입니다.
		 </p>
		<p>아래 이메일 인증을 통해 아이디 중복확인과</p>
		<p>이메일 인증을 완료하여주십시요</p>
		</span>
	</div>
</div>
	<div class ="email_box">
		<form action="${pageContext.request.contextPath}/user/mailAuthentic_join.us" method="post" name="checkform">
			<h3 class ="join_title">이메일</h3>
			<input name="email_front" placeholder="이메일을 입력하세요"/>@ 
			<select id="selbox" name="selbox">
				<option value="">이메일을 선택하세요</option>
				<option value="@naver.com">naver.com</option>
				<option value="@daum.net">daum.net</option>
				<option value="@gmail.com">gmail.com</option>
				<option value="@nate.com">nate.com</option>
				<option value="@paran.com">paran.com</option>
				<option value="direct">직접입력</option>
				<input type="text" id="selboxDirect" name="selboxDirect" />
			</select>
		</form>
	</div>
	<div class ="button_123">
	<%-- 기존 이메일 인증과 다른 경로로 보내줌 --%>
		<input type ="button" class="btn_1 btn_area" onclick="checkId()" value="인증번호 보내기"/>
	</div>
	
	   <!--::footer_part start::-->
    <footer>
        <div class="foot_area box_inner">
            <ul class="foot_list clear">
                <li><a href="#">이용약관</a></li>
                <li><a href="#">개인정보취급방침</a></li>
            </ul>
            <h2>제로팜</h2>
            <p class="addr">서울 강남구 테헤란로 146 현익빌딩 4층 
                <span class="gubun">/</span>
                <span class="br_line">대표전화 <span class="space0">02-0000-0000</span>
                <span class="gubun">/</span>
                <span class="br_line">E-mail : <span class="spce0">zerofarm@zerofarm.com</span></span></span></p>
                <p class="copy box_inner">Copyright(c) Zerofarm all right reserved</p>
        </div>
	</footer>
    <!--::footer_part end::-->
</body>
<script>let contextPath = "${pageContext.request.contextPath}";</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/user.js"></script>
</html>