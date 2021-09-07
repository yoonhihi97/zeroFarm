<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang="zxx">

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
<!-- font awesome CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/all.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/themify-icons.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/magnific-popup.css">
<!-- swiper CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/slick.css">
<!-- style CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/style.css?ver=1.1">
</head>

<body>




	<!--::header part start::-->
	<!-- BoardListAction.java 에서 보내주는 데이터들로 변수 만들기 -->

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
         	                       <li class="nav-item only_mobile">
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
							<h2>이벤트</h2>
							<p>
								공지사항 <span>-</span> 이벤트
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!-- ================ contact section start ================= -->
	<section class="contact-section padding_top">
		<c:set var="eventboardlist" value="${requestScope.eventboardlist}" />
		<c:set var="page" value="${requestScope.page}" />
		<c:set var="startPage" value="${requestScope.startPage}" />
		<c:set var="endPage" value="${requestScope.endPage}" />
		<c:set var="eventCnt" value="${requestScope.eventCnt}" />
		<c:set var="totalPage" value="${requestScope.totalPage}" />
		<div id="container">
			<!-- 본문 -->
			<div class="bodytext_area box_inner">
				<!-- summary : 리더기에서 읽도록 넣은것 -->
				<table class="bbsListTbl" summary="제목, 작성자, 날짜, 타입, 조회수 등을 제공하는 표">
					<thead>
						<tr>
							<th scope="col">제목</th>
							<th scope="col">날짜</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when
								test="${eventboardlist != null and fn:length(eventboardlist)>0 }">
								<!-- 보여줄 게시글 목록이 있음 -->
								<!-- for(BoardDTO board : boardList) -->
								<c:forEach items="${eventboardlist}" var="board">
									<tr onmouseover="this.style.background='#f9fbe7'"
										onmouseout="this.style.background=''">
										<td><a href="${pageContext.request.contextPath }/board/BoardView.bo?boardnum=${board.boardnum}">${board.boardtitle}</a></td>
										<td>${fn:substring(board.boardcreatedate,0,10)}</td>
										<td>${board.boardcnt}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<!-- 보여줄 게시글 목록이 없음 -->
								<tr>
									<td colspan="5" align="center">등록된 게시글이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div class="pagenation">
					<tr align="center" valign="middle">
						<td><c:if test="${page>1}">
								<a class="arr prev"
									href="${pageContext.request.contextPath}/board/EventBoardList.bo?page=${page-1}"></a>
							</c:if> <c:forEach begin="${startPage}" end="${endPage}" step="1"
								var="i">
								<c:choose>
									<c:when test="${page == i}"><strong class="page_strong_num">${i}</strong></c:when>
									<c:otherwise>
										<a class="page_num"
											href="${pageContext.request.contextPath}/board/EventBoardList.bo?page=${i}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach> <c:if test="${page<totalPage}">
								<a class="arr next"
									href="${pageContext.request.contextPath}/board/EventBoardList.bo?page=${page+1}"></a>
							</c:if></td>
					</tr>
				</div>
			<p class="btn_line txt_right">
					<a> 
							<c:if test="${sessionScope.admin=='관리자'}">
							<a class="btn_2" href="${pageContext.request.contextPath}/board/BoardWrite.bo?page=${page}">글쓰기</a>
							</c:if>
					</a>
				</p>
			</div>
		</div>
	</section>
	<!-- ================ contact section end ================= -->

	<!--::footer_part start::-->
	<footer>
		<div class="foot_area box_inner">
			<ul class="foot_list clear">
				<li><a href="#">이용약관</a></li>
				<li><a href="#">개인정보취급방침</a></li>
			</ul>
			<h2>제로팜</h2>
			<p class="addr">
				서울 강남구 테헤란로 146 현익빌딩 4층 <span class="gubun">/</span> <span
					class="br_line">대표전화 <span class="space0">02-0000-0000</span>
					<span class="gubun">/</span> <span class="br_line">E-mail :
						<span class="spce0">zerofarm@zerofarm.com</span>
				</span></span>
			</p>
			<p class="copy box_inner">Copyright(c) Zerofarm all right
				reserved</p>
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
	<!-- custom js -->
	<script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/custom.js"></script>
</body>

</html>