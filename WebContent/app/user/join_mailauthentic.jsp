<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/style.css">
</head>
<body>
<div class ="header">
	<div class ="logo">
		<span class="logo_title">
			<img src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/logo.png" alt="logo">
		</span><hr>
	</div>
</div>
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
		<p>아래 이메일 인증을 완료하고</p>
		<p>회원가입을 진행하여주십시요</p>
		</span>
	</div>

	<form>
		<div class ="email_box">
				<input name="auth" id="auth" class ="auth" placeholder= "인증번호 입력">
				<input type="button" class="btn_area" onclick="joinAuthCheck();" value="인증하기">
		</div>
	</form>
</div>
  <!--::footer_part start::-->
    <footer style="margin-top: 30px;">
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




<script>
let id_join = "${param.toEmail }";
</script>
<script>let contextPath = "${pageContext.request.contextPath}";</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/user.js"></script>
</html>