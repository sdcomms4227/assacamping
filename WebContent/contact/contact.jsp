<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<title>ASSA Camping - 나혼자간다</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="ASSA Camping - 나혼자간다">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" href="${contextPath}/css/common.css">
<link rel="stylesheet" href="${contextPath}/css/common_responsive.css">
<link rel="stylesheet" href="${contextPath}/css/contact.css">
<link rel="stylesheet" href="${contextPath}/css/contact_responsive.css">
</head>
<body>

<div class="super_container">
	
	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

	<!-- Menu -->
	<jsp:include page="../inc/menu.jsp" />

	<!-- Home -->

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="${contextPath}/images/contact.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_container">
						<div class="home_content">
							<div class="home_title">고객센터</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Google Map -->
		
	<div class="map">
		<div id="daum_map" class="daum_map">
			<div class="map_container">
				<div id="map"></div>
			</div>
		</div>
	</div>
	
	<!-- Contact Form -->

	<div class="contact">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="review_form_container">
						<div class="review_form_title">문의하기</div>
						<div class="review_form_content">
							<form action="#" id="review_form" class="review_form">
								<div class="d-flex flex-md-row flex-column align-items-start justify-content-between">
									<input type="text" class="review_form_input" placeholder="Name" required="required">
									<input type="email" class="review_form_input" placeholder="E-mail" required="required">
									<input type="text" class="review_form_input" placeholder="Subject">
								</div>
								<textarea class="review_form_text" name="review_form_text" placeholder="Message"></textarea>
								<button type="submit" class="review_form_button">문의하기</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Contact Text -->

	<div class="contact_text">
		<div class="container">
			<div class="row">

				<!-- Contact Info -->
				<div class="col-lg-5">

					<div class="contact_info">
						<div class="contact_title">Contact info</div>
						<div class="contact_info_content">
							<ul>
								<li>
									<div class="contact_info_icon"><img src="${contextPath}/images/contact_info_1.png" alt=""></div>
									<div class="contact_info_text ml-2">부산광역시 부산진구 부전1동 동천로 109</div>
								</li>
								<li>
									<div class="contact_info_icon"><img src="${contextPath}/images/contact_info_2.png" alt=""></div>
									<div class="contact_info_text ml-2">help@assacamping.shop</div>
								</li>
								<li>
									<div class="contact_info_icon"><img src="${contextPath}/images/contact_info_3.png" alt=""></div>
									<div class="contact_info_text ml-2">02-1234-1234</div>
								</li>
							</ul>
						</div>
						<div class="contact_info_social">
							<ul>
								<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-reddit-alien" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>
				</div>

				<!-- FAQ -->
				<div class="col-lg-7">
					<div class="faq">
						<div class="contact_title">faq</div>
						<div class="faq_content">

							<!-- Accordions -->
							<div class="accordions">
								<c:choose>
									<c:when test="${totalCount==0}">	
										<div class="accordion_container">
											<div class="accordion d-flex flex-row align-items-center"><div>등록된 자주 하는 질문이 없습니다.</div></div>
										</div>
									</c:when>	
									<c:otherwise>
										<c:forEach var="faqVO" items="${faqList}">
											<div class="accordion_container">
												<div class="accordion d-flex flex-row align-items-center"><div>${faqVO.faqTitle}</div></div>
												<div class="accordion_panel">
													<p>${faqVO.faqContent}</p>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Newsletter -->

	<div class="newsletter">
		<div class="newsletter_content">
			<div class="newsletter_image" style="background-image:url(${contextPath}/images/newsletter.jpg)"></div>
			<div class="container">
				<div class="row newsletter_row">
					<div class="col">
						<div class="section_title_container text-center">
							<div class="section_subtitle">only the best</div>
							<div class="section_title">subscribe for a 20% discount</div>
						</div>
					</div>
				</div>
				<div class="row newsletter_container">
					<div class="col-lg-10 offset-lg-1">
						<div class="newsletter_form_container">
							<form action="#">
								<input type="email" class="newsletter_input" required="required" placeholder="E-mail here">
								<button type="submit" class="newsletter_button">subscribe</button>
							</form>
						</div>
						<div class="newsletter_text">Integer ut imperdiet erat. Quisque ultricies lectus tellus, eu tristique magna pharetra nec. Fusce vel lorem libero. Integer ex mi, facilisis sed nisi ut, vestib ulum ultrices nulla. Aliquam egestas tempor leo.</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="../inc/footer.jsp" />
	
</div>

<script src="${contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${contextPath}/js/popper.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/plugins/easing/easing.js"></script>
<script src="${contextPath}/plugins/parallax-js-master/parallax.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ca35d38c74be43dc75518f378804191&libraries=services"></script>
<script src="${contextPath}/js/custom.js"></script>
<script src="${contextPath}/js/contact_custom.js"></script>
</body>
</html>