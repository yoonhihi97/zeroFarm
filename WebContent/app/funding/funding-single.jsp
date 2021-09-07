<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	    	<div class="row s_product_inner justify-content-between">
	      		<div class="col-lg-7 col-xl-7">
	        		<div class="product_slider_img">
	          			<div id="vertical">
	          				<c:choose>
	          					<c:when test="${fn:length(fundImg) > 0}">
	          						<c:forEach var = "i" begin = "0" end = "${fn:length(fundImg)-1}">
	          							<c:if test="${fundImg[i] != null}">
	          								<div data-thumb="<c:url value='/app/file/${fundImg[i]}'/>">
	              								<img src="<c:url value='/app/file/${fundImg[i]}'/>"/>
	           								</div>
	           							</c:if>
	          						</c:forEach>
	          					</c:when>
	          				</c:choose>
	          			</div>
	        		</div>
	      		</div>
	        	<div class="col-lg-5 col-xl-4">
	          		<div class="s_product_text">
        				<form id="fundForm" action="${pageContext.request.contextPath}/funding/funding-order.fd" method="post">
	          				<input type="text" name="fundPrice" value="${funding.price}" style="display:none">
	          				<input type="text" name="fundNum" value="${funding.fundnum}" style="display:none">
	          				<h3>${funding.fundtitle}</h3>
				            <h2>${funding.price}원</h2>
				            <ul class="list">
	              				<li>
	                  				<span>Category</span> : ${funding.type}</a>
		              			</li>
		              			<li>
		              				<span>Unit</span> : ${funding.unit }
		              			</li>
						   	</ul>
						  	<p>
						     	${funding.fundinfo}
						   	</p>
						   	<div class="row">
		            			<div class="card_area d-flex justify-content-between align-items-center">
		              				<div class="product_count col-lg-6">
		                				<span class="inumber-decrement"> <i class="ti-minus"></i></span>
		            	    			<input name = "fundCnt" class="input-number" type="text" value="1" min="1" max="10">
		        	        			<span class="number-increment"> <i class="ti-plus"></i></span>
		    	          			</div>
		    	          			<div class="col-lg-6">
				              			<button type="button" class="btn_3 fund_btn" onclick="logincheck('fundForm')">fund</button>
		    	          			</div>
			            		</div>
								<div>
									<button type="button" class="btn_3 fund_btn" onclick="logincheck('fundForm')">찜하기</button>
								</div>
						   	</div>
        				</form>
		          	</div>
		        </div>
      		</div>
    	</div>
    </div>
  <!--================End Single Product Area =================-->

  <!--================Product Description Area =================-->
	<c:set var="reviews" value="${requestScope.review}"/>
	<section class="product_description_area">
		<div class="container">
      		<div class="tab-content" id="myTabContent">
        		<div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
          			<div class="row">
            			<!-- 시작 -->
            			<div class="col-lg-6">
              				<%-- <div class="row total_rate">
                				<div class="col-12">
                  					<div class="box_total">
						                <h5>Like</h5>
						                <h4>좋아요수</h4>
						                <h6>${fn:length(reviews)} reviews</h6>
                  					</div>
                				</div>
              				</div>
              				<div>
              					<br>
              				</div> --%>
            				<c:choose>
								<c:when test="${reviews != null and fn:length(reviews)>0 }">
									<c:set var="i" value="0"/>
				            		<c:forEach items="${reviews}" var="review">
				            			<c:set var="i" value="${i+1}"/>
				            			<div class="review_list">
					            			<div class="review_item">
							        			<div class="media">
								        			<div class="media-body">
								          				<h4>${review.email}</h4>
								        			</div>
							        			</div>
							        			<p>
							       					<!-- ${review.content }  -->
							        				<textarea class="form-control" name="review${i}" id="review${i}" rows="2" style="resize:none; width:100%; font-size:0.8rem;" readonly display="none">${review.content}</textarea>
							        				<p style="font-size:0.5rem; text-align:right;">작성일 &nbsp; ${review.wdate} &nbsp; 수정일 &nbsp; ${review.udate} &nbsp; 
							        				<c:if test="${review.email != sessionScope.user.getEmail()}">
							        				<a href="${pageContext.request.contextPath}/funding/LikeUpOk.re?reviewnumber=${review.reviewnumber}&fundnum=${funding.fundnum}"><label style="font-size:0.5rem;">좋아요&nbsp;${review.like}&nbsp;</label></a><br>
							        				</c:if>
							        				<c:if test="${review.email == sessionScope.user.getEmail()}">
							        				<label style="font-size:0.5rem;">좋아요&nbsp;${review.like}&nbsp;</label>
							        				</c:if>
							        		<c:if test="${review.email == sessionScope.user.getEmail()}">
							        				
							        				<button style="font-size: 0.5rem; padding: 0.03rem 0.5rem;" id="ready${i}" type="button" class="btn_3 fund_btn" onclick="updateReview(${i})">수정</button>
							        				<button style="display:none; font-size: 0.5rem; padding: 0.03rem 0.5rem;" id="ok${i}" style="display:none;" type="button" class="btn_3 fund_btn" onclick="updateOk(${review.reviewnumber},${i})">수정완료</button>
													<a class="btn_3 fund_btn" href="${pageContext.request.contextPath}/funding/ReviewDeleteOk.re?reviewnumber=${review.reviewnumber}&fundnum=${funding.fundnum}" style="color:white;font-size: 0.5rem; padding: 0.03rem 0.5rem;">삭제</a>
													
											</c:if>
							        			</p>
							        			<div>
              										<br>
              									</div>
					            			</div>
				            			</div>
				            		</c:forEach>
								</c:when>
							<c:otherwise>
								<!-- 보여줄 리뷰가 없음 -->
								<div class="review_list">
					            	<div class="review_item">
							        	<div class="media">
								        	<div class="media-body">
								          		<h4></h4>
								        	</div>
							        	</div>
							        	<p>
							        		등록된 리뷰가 없습니다.
							        	</p>
					            	</div>
				            	</div>
							</c:otherwise>
						</c:choose>
            			</div>
            			<!-- 끝 -->
			            <div class="col-lg-6">
			            	<div class="review_box">
			               		<h4>Add a Review</h4>
			                	<form id="reviewForm" name="reviewForm" class="row contact_form" 
			                		action="${pageContext.request.contextPath}/review/ReviewWriteOk.re" method="post" novalidate="novalidate">
			                		<input type="hidden" value="${funding.fundnum}" name="fundnum">
			                  		<div class="col-md-12">
			                    		<div class="form-group">
			                   				<textarea class="form-control" name="message" rows="5" placeholder="Review"></textarea>
			                    		</div>
				            		</div>
				                	<div class="col-md-12 text-right">
				                		<button type="button" class="btn_3 fund_btn" onclick="logincheck('reviewForm')">
				                    		Submit Now
				                    	</button>
				                	</div>
				           		</form>
				          	</div>
				       	</div>
				 	</div>
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
  <script>
	function logincheck(id){
		if(!"${sessionScope.user}"){
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");		
		}else{
			document.getElementById(id).submit();
		}
	}
	</script>
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
</body>

</html>