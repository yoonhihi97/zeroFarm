<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="utf-8">

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/campaign_style.css">
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



  <!-- ================ contact section start ================= -->
  <section class="breadcrumb breadcrumb_bg">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="breadcrumb_iner">
            <div class="breadcrumb_iner_item">
              <h2>BEST 펀딩 사례</h2>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- breadcrumb start-->

  <!-- ================ contact section start ================= -->
  <section class="contact-section">
    <div class="container"  id="top">
      <div class="d-none d-sm-block mb-5 pb-4">
        <div class="subheader">
          <ul>
            <li class="best_seller active" onclick="best_seller()"><a href="#top">최다 판매</a></li>
            <li class="best_like" onclick="best_like()"><a href="#top">최다 좋아요</a></li>
            <li class="best_review" onclick="best_review()"><a href="#top">최다 리뷰</a></li>
          </ul>
        </div>
        <div class="best_month">
          <div class="sell">
            <div class="title">
              <h2>이 달의 최다 판매</h2>
            </div>
            <div class="image_txt">
              <img src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/many_seller.jpg" alt="">
              <p class="seller_name">김사과의 농장</p>
              <p class="seller_coment">#달콤한 샤인머스캣 #총 펀딩금액 <span>10,752,300</span>원</p>
            </div>
            <div class="info">
              <p>김사과 농부가 손녀를 생각하며 농사를 지어 "물에 씻지 않아도 먹을 수 있는 샤인머스캣" 문구를 내세우며 펀딩을 진행했다.</p>
              <p>이에 많은 기대를 받아 최다 펀딩을 이루었다.</p>
            </div>
            <div class="news">
              <strong>News</strong>
              <p><a href="#">"김사과 농부 펀딩 오픈 2시간만에 1000만원 달성"</a></p>
              <p><a href="#">"친환경 농부 김사과를 만나보다"</a></p>
            </div>
            <div class="seller_interview">
              <strong>김사과 농부의 한마디</strong>
              <p>"처음 펀딩을 시작할 때는 걱정이 앞섰는데 여러분들의 성원 덕분에 힘을 얻을 수 있었습니다. 감사합니다."</p>
            </div>
          </div>
        </div>
        <div class="best_month">
          <div class="like" style="display: none;">
            <div class="title">
              <h2>이 달의 최다 좋아요</h2>
            </div>
            <div class="image_txt">
              <img src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/many_like.png" alt="">
              <p class="seller_name">꽃구독해</p>
              <p class="seller_coment">#정해진 기간마다 당신의 방으로, 꽃 정기구독 서비스<br>#총 좋아요 <span>15789</span>개</p>
            </div>
            <div class="info">
              <p>"왜 우리는 해외처럼 소량의 꽃을 저렴하게 살 수 없을까?"</p>
              <p>코로나로 실내 활동이 늘어난 요즘, 매달 당신의 방으로 찾아갑니다.</p>
              <p>저렴한 가격으로 매달 내 방의 변화를!</p>
            </div>
            <div class="news">
              <strong>News</strong>
              <p><a href="#">"꽃구독해가 추구하는 방향은 무엇일까?"</a></p>
              <p><a href="#">"꽃구독해 대표 OOO을 만나보았다"</a></p>
            </div>
            <div class="seller_interview">
              <strong>꽃구독해의 한마디</strong>
              <p>"우리의 프로젝트가 여러분의 방의 큰 변화를 주기를 바랍니다. 많은 응원 감사합니다."</p>
            </div>
        </div>
        <div class="best_month">
          <div class="review" style="display: none;">
            <div class="title">
              <h2>이 달의 최다 리뷰</h2>
            </div>
            <div class="image_txt">
              <img src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/img/many_review.jpg" alt="">
              <p class="seller_name">토마토마토</p>
              <p class="seller_coment">#청년농부의 토마토 #총 리뷰 <span>3568</span>개</p>
            </div>
            <div class="info">
              <p>"토마토, 편식의 대상이 아닌 누구나 맛있게 즐 길수 있으면 좋겠습니다."</p>
              <p>"요리하지 않고 과일처럼 생으로 먹어도 맛있다고 자신있게 말할 수 있습니다."</p>
            </div>
            <div class="news">
              <strong>News</strong>
              <p><a href="#">"토마토마토의 토마토 앵콜 요청 쏟아져..."</a></p>
              <p><a href="#">"청년 농부 토마토마토의 OOO을 만나보다"</a></p>
            </div>
            <div class="seller_interview">
              <strong>토마토마토의 한마디</strong>
              <p>"여러분의 많은 리뷰를 보며 힘을 얻습니다. 감사합니다."</p>
            </div>
      </div>
    </div>
  </section>

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
    <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/stellar.js"></script>
    <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/price_rangs.js"></script>
    <!-- custom js -->
    <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/custom.js"></script>
    <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/bestfunding.js"></script>
      <!-- map -->
</body>

</html>