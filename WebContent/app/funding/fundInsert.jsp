<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>

<style>
.file_delete_btn{
    border: none;
    background: url(${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/delete.png) no-repeat;
    width:200px;
    vertical-align:middle;
}
</style>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>제로팜</title>
    <link rel="icon" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/logo.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/owl.carousel.min.css">
<!-- nice select CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/nice-select.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/all.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/themify-icons.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/magnific-popup.css">
<!-- swiper CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/slick.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/price_rangs.css">
<!-- style CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/style.css">
</head>

<body>
	<!--::header part start::-->
	    <header class="main_menu home_menu">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/user/Index.us"> <img src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/logo.png" alt="logo"> </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="menu_icon"><i class="fas fa-bars"></i></span>
                        </button>

                        <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                  <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_1"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        기업소개
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/company_info/contact.bo">오시는길</a>
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/company_info/bestfunding.bo">BEST 펀딩사례</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_1"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        펀딩하기
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/funding/fundInsert.fd">펀딩 등록</a>
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/funding/fundList.fd">진행중인 펀딩</a>
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/funding/funding-single.fd">종료된 펀딩</a>
                                        
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/board/NoticeBoardList.bo" id="navbarDropdown_3"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        공지사항
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/board/NoticeBoardList.bo"> 공지사항</a>
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/board/EventBoardList.bo" >이벤트</a>
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/FAQ/faq.bo">FAQ</a>
                                        <!-- <a class="dropdown-item" href="cart.html">펀딩준비방법</a> -->
                                    </div>
                                </li>                                 
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/campaign/CampaignList.ca?page=1">모금하기</a>
                                </li>
                                <c:choose>
                                <%-- 로그인 안 했을 때 --%> 
                                	<c:when test ="${sessionScope.user eq null }">
    						   	<li class ="nav-item only_mobile">
                             		<a class ="nav-link" href="${pageContext.request.contextPath}/user/UserJoin.us" class="btn_4">회원가입</a>
    							</li>
    							<li class ="nav-item only_mobile">
    								<a class ="nav-link" href="${pageContext.request.contextPath}/user/UserLoginGo.us" class="btn_4">로그인</a>
                             	</li>
    						   		</c:when>
    						   		<c:otherwise>
    						   <%-- 로그인 했을 때 --%>
    						    <li class ="nav-item only_mobile">
                                	<a class ="nav-link" href="#" onclick="location.href='${pageContext.request.contextPath}/user/Index.us'">메인화면</a>
                                 </li>
    						   	<%-- 판매자 등록 안되있을 때 --%>
	                            <c:if test="${sessionScope.seller eq null }">
         	                       <li class="nav-item">
	                              		<a href="#" class="nav-link" onclick="location.href='${pageContext.request.contextPath}/seller/SellerJoin.sl'">판매자 등록</a>
							       </li>
		                        </c:if>
                                <%-- 판매자 등록 되있을 때 --%>
							    <li class ="nav-item only_mobile">
    								<a class ="nav-link"  href="#" onclick="location.href='${pageContext.request.contextPath}/user/Mypage.us'">마이페이지</a>
    	    					</li>
    							<li class ="nav-item only_mobile">
    						   		<a class ="nav-link" href="#" onclick="location.href='${pageContext.request.contextPath}/user/UserLogout.us'">로그아웃</a>
    						   	</li>
    						   		</c:otherwise>
                             	</c:choose>
                            </ul>	
                        </div>
                        <div class="hearer_icon d-flex">
                            <!-- 로그인 / 마이페이지 구역 -->
                                <div class ="login_part mypage_part" style="float:right;">
                                <%--  로그인 --%>
                                <%-- 로그인 안되어 있을때 --%>
                                <c:choose>
    								<c:when test="${sessionScope.user eq null}">
    									  <a href="${pageContext.request.contextPath}/user/UserLoginGo.us" class="btn_4">로그인</a>&nbsp;
                             			  <a href="${pageContext.request.contextPath}/user/UserJoin.us" class="btn_4">회원가입</a>
   									 </c:when>
   								 	<c:otherwise>	
   								 	<%-- 로그인이 된 상태라면 --%>
    									   <h6><strong>${sessionScope.user.getName()}</strong>님 어서오세요</h6>
    									   <a href="#" class="btn_5" onclick="location.href='${pageContext.request.contextPath}/user/UserLogout.us'">로그아웃</a>&nbsp;
    									   <a href="#" class="btn_5" onclick="location.href='${pageContext.request.contextPath}/user/Mypage.us'">마이페이지</a>&nbsp;
    								</c:otherwise>
								</c:choose>
                               </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
	<!-- Header part end-->

	<!--================Home Banner Area =================-->
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2>펀딩하기</h2>
							<p>
								펀딩하기 <span>-</span> 펀딩등록
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->
	<%-- <form id="funddata" name="funddata" action="${pageContext.request.contextPath}/funding/fundInsert.fd" method="post">
		<input type="text" name = "fundtitle"> 제목
		<input type="text" name = "fundinfo"> 정보
		<input type="text" name = "type"> 종류
		<input type="text" name = "startdate"> 시작날짜
		<input type="text" name = "enddate"> 종료날짜
		<input type="text" name = "goalprice"> 목표금액
		<input type="text" name = "unit"> 단위
		<input type="text" name = "price"> 가격
		<button form = "funddata">펀딩 시작</button>
	</form> --%>
	<!--================Checkout Area =================-->
	<section class="checkout_area padding_top">
		<div class="container">
			
			<div class="billing_details">
				<div class="row">
					<div class="col-lg-12">
						<h3>Funding Data</h3>
						<form id="dataform" class="row contact_form" action="${pageContext.request.contextPath}/funding/fundInsertOk.fd" method="post"
							novalidate="novalidate" enctype="multipart/form-data">
							<div class="col-md-12 form-group p_star">
								<input type="text" class="form-control" name="fundtitle" placeholder = "Title"/>
							</div>
							<div class="col-md-12 form-group p_star">
								<select class="country_select" name="type">
									<option value="fruit">fruit</option>
									<option value="vegetable">vegetable</option>
									<option value="plants">plants</option>
								</select>
							</div>
							<div class="col-md-12 form-group p_star">
								<h4>Start</h4>
								<div class="col-md-3 form-group p_star">
									<input type="text" class="form-control" name="start_yyyy" placeholder = "Year"/>
								</div>
								<div class="col-md-3 form-group p_star">
									<input type="text" class="form-control" name="start_mm" placeholder = "Month"/>
								</div>
								<div class="col-md-3 form-group p_star">
									<input type="text" class="form-control" name="start_dd" placeholder = "Day"/>
								</div>
							</div>
							<div class="col-md-12 form-group p_star">
								<h4>End</h4>
								<div class="col-md-3 form-group p_star">
									<input type="text" class="form-control" name="end_yyyy" placeholder = "Year"/>
								</div>
								<div class="col-md-3 form-group p_star">
									<input type="text" class="form-control" name="end_mm" placeholder = "Month"/>
								</div>
								<div class="col-md-3 form-group p_star">
									<input type="text" class="form-control" name="end_dd" placeholder = "Day"/>
								</div>
							</div>
							
							<div class="col-md-12 form-group p_star">
								<input type="text" class="form-control" name="goalprice" placeholder = "TargetAmount"/>
							</div>
							<div class="col-md-12 form-group p_star">
								<input type="text" class="form-control" name="unit" placeholder = "Unit"/>
							</div>
							<div class="col-md-12 form-group p_star">
								<input type="text" class="form-control" name="price" placeholder = "Price"/>
							</div>
							
							<div class="col-md-12 form-group">
								<textarea class="form-control" name="fundinfo" id="message"
									rows="1" placeholder="Info" style="resize:none;"></textarea>
							</div>
							<div class="col-md-12 form-group p_star">
								<div style="float:left" id="img_div">
									<label class="genric-btn default">이미지첨부
										<input type="file" accept="image/*" name="fundimg1" style="display:none;">
									</label>
									<label class="genric-btn default">이미지첨부
										<input type="file" accept="image/*" name="fundimg2" style="display:none;">
									</label>
									<label class="genric-btn default">이미지첨부
										<input type="file" accept="image/*" name="fundimg3" style="display:none;">
									</label>
									<label class="genric-btn default">이미지첨부
										<input type="file" accept="image/*" name="fundimg4" style="display:none;">
									</label>
									<label class="genric-btn default">이미지첨부
										<input type="file" accept="image/*" name="fundimg5" style="display:none;">
									</label>
								</div>
								<div style="float:right">
									<label class="genric-btn default" for="submitButton">등록
										<input type="submit" id="submitButton" style="display:none;">
									</label>
								</div>
								
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!--================End Checkout Area =================-->

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

	<!-- jquery plugins here-->
	<!-- jquery -->
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/bootstrap.min.js"></script>
	<!-- easing js -->
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/swiper.min.js"></script>
	<!-- swiper js -->
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/masonry.pkgd.js"></script>
	<!-- particles js -->
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/jquery.nice-select.min.js"></script>
	<!-- slick js -->
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/jquery.counterup.min.js"></script>
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/contact.js"></script>
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/jquery.ajaxchimp.min.js"></script>
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/jquery.form.js"></script>
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/mail-script.js"></script>
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/stellar.js"></script>
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/price_rangs.js"></script>
	<!-- custom js -->
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/custom.js"></script>
</body>
<script>
	var index=1;
	var text = "<label id=\"\" class=\"genric-btn default\">이미지첨부<input type=\"file\" accept=\"image/*\" name=\"fundimg" + ${index} + "\" style=\"display:none;\"></label>"
	var imgdiv = $("#img_div");
	
	
</script>
</html>

