<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="map" value="${map}"/>
<c:set var="totalDelivery" value="${map.totalDelivery}"/>

<!DOCTYPE html>
<html lang="kr">
<head>
<title>ASSA Camping - 나혼자간다</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="ASSA Camping - 나혼자간다">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap_custom.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/checkout.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/checkout_responsive.css">
</head>
<body>

<div class="super_container">
	
	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

	<!-- Menu -->
	<jsp:include page="../inc/menu.jsp" />

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/categories.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_container">
						<div class="home_content">
							<div class="home_title">Checkout</div>
							<div class="breadcrumbs">
								<ul>
									<li><a href="index.html">Home</a></li>
									<li><a href="index.html">Shopping Cart</a></li>
									<li>Shopping Cart</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Checkout -->
<form action="${contextPath}/cartorder/pay.do" method="post" id="checkout_form">
	<div class="checkout">
		<div class="container">
			<div class="row">

				<!-- Billing Details -->
				<div class="col-lg-6">
					<div class="billing">
						<div class="checkout_title">billing details</div>
						<div class="checkout_form_container">
							
								<div class="d-flex flex-lg-row flex-column align-items-start justify-content-between">
									<input type="text" class="checkout_input checkout_input_50"  name="userName"value="${uservo.userName}"placeholder=" 이름" required="required">
									
								</div>
								<input type="text" class="checkout_input" name="userEmail" value="${uservo.userEmail}" placeholder="이메일" required="required">
								<!-- 주소 api연동 해쥬세여 -->
								
								<input type="text" class="checkout_input" name="userAddress1"value="${uservo.userAddress1}" placeholder="주소" required="required">
								<input type="text" class="checkout_input" name="userAddress2" value="${uservo.userAddress2}" placeholder="상세주소" required="required">
								<div class="d-flex flex-lg-row flex-column align-items-start justify-content-between">
									<input type="text" class="checkout_input checkout_input_50" name="userZipcode" value="${uservo.userZipcode}"  placeholder="우편번호" required="required">
									<input type="text" class="checkout_input checkout_input_50" name="userPhone" value="${uservo.userPhone}" placeholder="전화번호" required="required">
								</div>
								  <p>요청사항 &nbsp;&nbsp;&nbsp; <select name="userComment"  id="userComment" class="userComment">
				                           <option>배송전 연락 바랍니다</option>
				                           <option>부재시 경비실에 맡겨주세요</option>
				                           <option>부재시 연락 바랍니다</option>
                                   </select>
								</p>
								<div class="billing_options">
									
								</div>
							
						</div>
					</div>
				</div>

				<!-- Cart Details -->
				<div class="col-lg-6">
					<div class="cart_details">
						<div class="checkout_title">cart total</div>
						<div class="cart_total">
							<ul>
							
							
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="cart_total_title">Product</div>
									<div class="cart_total_price ml-auto">Total:${ordercount}</div>
								
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
								<c:choose>
								<c:when test="${orderList != null}">
								<c:set  value="${orderList}" scope="session" var="orderList"/>
								
                                <c:forEach begin="0" end="0" items="${orderList}" var="order">
								  <div class="cart_total_title" > ${order.productName} 외 ${ordercount}개</div>
								<div class="cart_total_price ml-auto">${productTotalPrice}</div>
										
								     </c:forEach>
								   </c:when>
							 </c:choose>
								 </li>
							
								
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="cart_total_title">Subtotal</div>
									<div class="cart_total_price ml-auto" ><fmt:formatNumber  type="number" maxFractionDigits="3" value="${map.totalPrice}" /></div>
								   
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="cart_total_title">Shipping</div>
									<div class="cart_total_price ml-auto" ><fmt:formatNumber  type="number" maxFractionDigits="3" value="${totalDelivery}" /></div>
								   <input type="hidden" name="productDelivery" value="${totalDelivery}">
								</li>
								<li class="d-flex flex-row align-items-start justify-content-start total_row">
									<div class="cart_total_title">Total</div>
									<div class="cart_total_price ml-auto">
									
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${map.totalPrice+totalDelivery}" /></div>
							    <input type="hidden" name="productPayment"  value="${map.totalPrice+totalDelivery}">
							    
								</li>
								 
							</ul>
						</div>
						
						<div class="payment_options">
							 
							
							<div>
								<input type="radio" id="radio_payment_1" name="regular_radio" class="regular_radio" >
								<label for="radio_payment_1">cash on delivery</label>
							</div>
							<div>
								<input type="radio" id="radio_payment_2" name="regular_radio" class="regular_radio" checked>
								<label for="radio_payment_2">paypal</label>
								<div class="visa payment_option"><a href="#"><img src="images/visa.jpg" alt=""></a></div>
								<div class="master payment_option"><a href="#"><img src="images/master.jpg" alt=""></a></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="submit" class="cart_total_button" value="결제하기">
</form>
	<!-- Newsletter -->

	<div class="newsletter">
		<div class="newsletter_content">
			<div class="newsletter_image parallax-window" data-parallax="scroll" data-image-src="images/cart_nl.jpg" data-speed="0.8"></div>
			<div class="container">
				<div class="row options">

					<!-- Options Item -->
					<div class="col-lg-3">
						<div class="options_item d-flex flex-row align-items-center justify-content-start">
							<div class="option_image"><img src="images/option_1.png" alt=""></div>
							<div class="option_content">
								<div class="option_title">30 Days Returns</div>
								<div class="option_subtitle">No questions asked</div>
							</div>
						</div>
					</div>

					<!-- Options Item -->
					<div class="col-lg-3">
						<div class="options_item d-flex flex-row align-items-center justify-content-start">
							<div class="option_image"><img src="images/option_2.png" alt=""></div>
							<div class="option_content">
								<div class="option_title">Free Delivery</div>
								<div class="option_subtitle">On all orders</div>
							</div>
						</div>
					</div>

					<!-- Options Item -->
					<div class="col-lg-3">
						<div class="options_item d-flex flex-row align-items-center justify-content-start">
							<div class="option_image"><img src="images/option_3.png" alt=""></div>
							<div class="option_content">
								<div class="option_title">Secure Payments</div>
								<div class="option_subtitle">No need to worry</div>
							</div>
						</div>
					</div>

					<!-- Options Item -->
					<div class="col-lg-3">
						<div class="options_item d-flex flex-row align-items-center justify-content-start">
							<div class="option_image"><img src="images/option_4.png" alt=""></div>
							<div class="option_content">
								<div class="option_title">24/7 Support</div>
								<div class="option_subtitle">Just call us</div>
							</div>
						</div>
					</div>

				</div>
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
<script src="${contextPath}/js/custom.js"></script>
<script src="${contextPath}/js/checkout_custom.js"></script>
</body>
</html>