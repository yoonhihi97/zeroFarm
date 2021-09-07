<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="zxx">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>제로팜</title>
    <link rel="icon" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/logo.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/themify-icons.css">
    <!-- font awesome CSS -->
    <!-- swiper CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/campaign_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/global.css">
</head>

<body>
<%-- 비밀번호 변경 세션이 있을 때 그 세션의 값과 현재 내 비밀번호가 같으면 
	비밀번호 변경창으로 보낸다--%>
	<c:if test="${sessionScope.user != null && sessionScope.mail eq sessionScope.user.getPassword() }">
		<script>
		alert("비밀번호 변경을 권장하므로 비밀번호 변경창으로 이동합니다.");
		location.href = "${pageContext.request.contextPath}/user/ChangePw.us";
		</script>
	</c:if>
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
                             	                       <c:if test="${sessionScope.admin=='관리자'}">
					                          <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                               <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_1"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           쿠폰관리
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/app/coupon/couponwrite.jsp">쿠폰관리</a>
                                    </div>
                                </li>
                                </c:if>
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
   								 	<%--  카트, 하트 기능 굳이 필요 없을거같아서..
   								 	<a href=""><i class="ti-heart"></i></a>
   								 	<div class="dropdown cart">
                                		<a class="dropdown-toggle" href="#" id="navbarDropdown3" role="button"
                                    		data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    		<i class="fas fa-cart-plus"></i>
                                		</a>                             	
                                		<div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                   			 <div class="single_product">
                                   			 </div>
                                		</div>
                         		   </div>
   								 	--%>
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
        <div class="search_input" id="search_input_box">
            <div class="container ">
                <form class="d-flex justify-content-between search-inner">
                    <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                    <button type="submit" class="btn"></button>
                    <span class="ti-close" id="close_search" title="Close Search"></span>
                </form>
            </div>
        </div>
    </header>
    <!-- Header part end-->

    <!-- banner part start-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <div class="banner_slider owl-carousel">
                        <div class="single_banner_slider">
                            <div class="row">
                                <div class="col-lg-5 col-md-8">
                                    <div class="banner_text">
                                        <div class="banner_text_iner">
                                            <h1>서귀포<br>
                                                유기농 청귤
                                            </h1>
                                            <p>1년에 딱 한달만 만날 수 있습니다.<br>비타민 UP! 성분 UP!</p>
                                            <a href="${pageContext.request.contextPath}/funding/fundList.fd" class="btn_2">펀딩하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="banner_img d-none d-lg-block">
                                    <img src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/green-orange.png" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="single_banner_slider">
                            <div class="row">
                                <div class="col-lg-5 col-md-8">
                                    <div class="banner_text">
                                        <div class="banner_text_iner">
                                            <h1>서귀포<br>
                                                유기농 청귤
                                            </h1>
                                            <p>1년에 딱 한달만 만날 수 있습니다.<br>비타민 UP! 성분 UP!</p>
                                            <a href="${pageContext.request.contextPath}/funding/fundList.fd" class="btn_2">펀딩하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="banner_img d-none d-lg-block">
                                    <img src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/green-orange.png" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="single_banner_slider">
                            <div class="row">
                                <div class="col-lg-5 col-md-8">
                                    <div class="banner_text">
                                        <div class="banner_text_iner">
                                            <h1>서귀포<br>
                                                유기농 청귤
                                            </h1>
                                            <p>1년에 딱 한달만 만날 수 있습니다.<br>비타민 UP! 성분 UP!</p>
                                            <a href="${pageContext.request.contextPath}/funding/fundList.fd" class="btn_2">펀딩하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="banner_img d-none d-lg-block">
                                    <img src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/green-orange.png" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="slider-counter"></div>
                </div>
            </div>
        </div>
    </section>

    <section class="product_list best_seller section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="section_tittle text-center">
                        <h2 id="zero_fund_title">제로팜이 추천하는 펀딩</h2>
                    </div>
                </div>
            </div>
            <div class="row align-items-center justify-content-between">
                <div class="col-lg-12">
                    <div class="best_product_slider owl-carousel">
                        <div class="single_product_item">
                            <img src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/many_seller.jpg" alt="">
                            <div class="single_product_text">
                                <h4>달콤한 샤인머스캣</h4>
                                <h3>청년농부네</h3>
                            </div>
                        </div>
                        <div class="single_product_item">
                            <img src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/many_like.png" alt="">
                            <div class="single_product_text">
                                <h4>꽃 정기구독 서비스</h4>
                                <h3>꽃구독해</h3>
                            </div>
                        </div>
                        <div class="single_product_item">
                            <img src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/many_review.jpg" alt="">
                            <div class="single_product_text">
                                <h4>과일보다 달콤한 토마토</h4>
                                <h3>케찹농장</h3>
                            </div>
                        </div>
                        <div class="single_product_item">
                            <img src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/sweet potato.png" alt="">
                            <div class="single_product_text">
                                <h4>달콤한 꿀고구마</h4>
                                <h3>고구마협회</h3>
                            </div>
                        </div>
                        <div class="single_product_item">
                            <img src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/apple.jpg" alt="">
                            <div class="single_product_text">
                                <h4>사과킹! 여름 햇사과</h4>
                                <h3>김사과</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- product_list part end-->

    <!-- subscribe_area part start-->

    <!--::subscribe_area part end::-->

    <!-- subscribe_area part start-->
  
    <!--::subscribe_area part end::-->

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
    <!-- custom js -->
    <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/custom.js"></script>
</body>
</html>









