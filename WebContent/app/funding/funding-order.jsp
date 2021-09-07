<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/lightslider.min.css">
		<!-- font awesome CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/all.css">
		<!-- flaticon CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/flaticon.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/themify-icons.css">
		<!-- font awesome CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/magnific-popup.css">
		<!-- style CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/aranoz-master/aranoz-master/css/style.css">
		
	</head>
	
	<body>
	<c:if test="${request.getParameter('flag') != null && request.getParameter('flag')==false}">
		<script>
			alert("댓글 작성에 실패했습니다.");
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

	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
    	<div class="container">
      		<div class="row justify-content-center">
        		<div class="col-lg-8">
					<div class="breadcrumb_iner">
            			<div class="breadcrumb_iner_item">
              				<h2>펀딩하기</h2>
              				<p>펀딩하기 <span>-</span> 진행중인 펀딩</p>
            			</div>
          			</div>
        		</div>
      		</div>
    	</div>
  	</section>
  	<!-- breadcrumb start-->
  	<!--================End Home Banner Area =================-->

  	<!--================Single Product Area =================-->
	<div class="product_image_area section_padding">
		<div class="container">
	    	<div class="content_wrap">
          <div class="order_wrap">
              <div class="order_content">
                  <form class="form_box" name="orderForm" method="post" action="${pageContext.request.contextPath}/funding/fundingOrderOk.fd">
                  <input type="hidden" name="fundPrice" value="${funding.price}">
	          	  <input type="hidden" name="fundNum" value="${funding.fundnum}">
	          	  <input type="hidden" name="fundCnt" value="${fundcnt}">
	          	  <input type="hidden" name="fundtitle" value="${funding.fundtitle}">
                      <h2>배송 정보</h2>
                      <div class="info_write_wrap">
                          <div class="input_set address">
                              <dl>
                                  <dt>주소</dt>
                                  <dd>
                                    <input type="text" id="sample6_postcode" placeholder="우편번호" name="zipcode">
                                    <input type="button" id="postcode_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                                    <input type="text" id="sample6_address" placeholder="주소" name="address1"><br>
                                    <input type="text" id="sample6_detailAddress" placeholder="상세주소"name="address2">
                                    <input type="text" id="sample6_extraAddress" placeholder="참고항목"name="address3">
                                  </dd>
                              </dl>
                          </div>
                          <div class="input_set">
                              <dl>
                                  <dt>전화번호</dt>
                                  <dd>
                                      <span class="form_text">
                                          <input type="text" maxlength="13" placeholder="'-'를 포함하여 전화번호를 입력하세요" value="${sessionScope.user.phonenum}">
                                      </span>
                                  </dd>
                              </dl>
                          </div>
                          <div class="input_set">
                            <dl>
                                <dt>배송시 요청사항</dt>
                                <dd>
                                    <span class="form_text">
                                        <input type="text" maxlength="50" placeholder="배송시 요청사항을 입력하세요">
                                    </span>
                                </dd>
                            </dl>
                        </div>
                      </div>

                      <h2>할인 방법 선택</h2>
                      <div class="info_write_wrap">
                          <div class="input_set">
                              <dl>
                                  <dt>포인트 사용</dt>
                                  <dd>
                                      <div class="use_point">
                                          <span class="form_text">
                                              <input type="text" value = "0" id="point_input" name="point_input" placeholder="사용금액 입력" class="point_input" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                                          	<input type="hidden" value="${sessionScope.user.point}" name="userpoint">
                                          </span>
                                          <p>
                                              <span>보유 포인트 :</span>
                                              <strong>${sessionScope.user.point}</strong>
                                          </p>
                                      </div>
                                      <div class="btn_input">
                                          <a href="javascript:void(0);" class="btn" onclick="pointUse()">
                                          <span>사용</span>
                                          </a>
                                      </div>
                                  </dd>
                              </dl>
                          </div>
                      </div>
                      <h2>결제 수단 선택</h2>
                      <div class="info_write_wrap">
                          <div class="input_set">
                              <dl>
                                <dt>결제 수단</dt>
                                <dd>
                                    <div class="form_radio square">
                                        <label>
                                            <input type="radio" checked name="payment">
                                            <span class="shape">
                                                신용카드
                                            </span>
                                        </label>
                                        <label>
                                          <input type="radio" name="payment">
                                          <span class="shape">
                                              계좌이체
                                          </span>
                                        </label>
                                        <label>
                                          <input type="radio" name="payment">
                                          <span class="shape">
                                              휴대폰
                                          </span>
                                        </label>
                                    </div>
                                </dd>
                                  
                              </dl>
                          </div>
                      </div>
                  </form>
                  <div class="order_list_wrap">
                  <fmt:parseNumber var="fundcnt" type="number" value="${fundcnt}" />
                  <fmt:parseNumber var="price" type="number" value="${funding.price}" />
                  <c:set var="totalprice" value="${fundcnt*funding.price}"/>
                      <h2>주문 내역</h2>
                      <div class="content">
                          <div class="order_table">
                            <div class="name">
                              <strong>${funding.fundtitle}</strong>
                            </div>
                          <div class="unit">
                              <span>${funding.unit} / </span>
                              <span>${funding.price}</span>
                          </div>
                          <div class="count">
                              <strong>${fundcnt}</strong>개
                          </div>
                          <div class="sum">
                                  <strong>${totalprice}</strong>
                                  <em>원</em>
                          </div>
                          </div>
                      </div>
                  </div>
                  <div class="amount">
                      <h2>총 결제 금액</h2>
                      <dl class="order_sum">
                          <dt>결제 금액</dt>
                          <dd>
                              <strong id="orderTotal">${totalprice}</strong>
                              원
                          </dd>
                      </dl>
                      <dl class="detail_sum">
                          <dt>포인트 사용 </dt>
                          <dd><strong id="point_use">0</strong>원</dd>
                          <dt>배송비 </dt>
                          <dd><strong id="delivery_pay">+ 3,000</strong>원</dd>
                      </dl>
                      <div class="payment_agree">
                          <dl>
                              <dt>
                                  <label class="form_checkbox">
                                      <input id="paymentAgree" type="checkbox" name="paymentAgree">
                                     <span class="icon"></span><strong>결제진행 동의</strong>
                                  </label>
                              </dt>
                              <dd>
                                  <ul>
                                      <li class="order_caution">상품 특성상 단순변심에 의한 교환이나 환불은 어렵습니다.</li>
                                      <li class="order_caution red">배송이 시작되면 주문을 취소할 수 없습니다.</li>
                                  </ul>
                              </dd>
                          </dl>
                      </div>
                      <div class="btn_area">
                          <a class="order_btn" id="startOrder" href="javascript:sendit();"><span>결제하기</span></a>
                      </div>
                  </div>
              </div>
          </div>
      </div>
    	</div>
    </div>
  <!--================End Single Product Area =================-->

  <!--================Product Description Area =================-->
	
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
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/lightslider.min.js"></script>
  <!-- swiper js -->
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/masonry.pkgd.js"></script>
  <!-- particles js -->
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/jquery.nice-select.min.js"></script>
  <!-- slick js -->
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/slick.min.js"></script>
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/swiper.jquery.js"></script>
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/jquery.counterup.min.js"></script>
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/contact.js"></script>
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/jquery.ajaxchimp.min.js"></script>
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/jquery.form.js"></script>
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/jquery.validate.min.js"></script>
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/mail-script.js"></script>
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/stellar.js"></script>
  <!-- custom js -->
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/theme.js"></script>
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/custom.js"></script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${pageContext.request.contextPath}/aranoz-master/aranoz-master/js/funding.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <script>
	function logincheck(id){
		if(!"${sessionScope.user}"){
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");		
		}else{
			document.getElementById(id).submit();
		}
	}
	
	function sendit(){
		let frm = document.orderForm;
		let zipcode = frm.zipcode.value;
		let address1 = frm.address1.value;
		let address2 = frm.address2.value;
		let point_input = Number(frm.point_input.value);
		let userpoint = Number(frm.userpoint.value);
		let paymentAgree = document.getElementById('paymentAgree');
		if(zipcode == "" || zipcode == null ||address1 == "" || address1 == null ||address2 == "" || address2 == null){
			Swal.fire(
					  '주소 미입력',
					  '주소를 입력해주세요',
					  'error'
					)
			return false;
		}
		if($(paymentAgree).is(":checked") == false){
			Swal.fire(
					  '결제 진행 미동의',
					  '동의 버튼을 체크해주세요',
					  'error'
					)
			return false;
		}
		
		if(userpoint<point_input){
			Swal.fire(
					  '포인트부족',
					  '보유 포인트를 확인해주세요',
					  'error'
					)
			return false;
		}
		
		
		document.orderForm.submit();
	}
	</script>

</body>

</html>