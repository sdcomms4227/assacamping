<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
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
<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/css/bootstrap_custom.css">
<link rel="stylesheet" href="${contextPath}/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" href="${contextPath}/css/common.css">
<link rel="stylesheet" href="${contextPath}/css/common_responsive.css">
<link rel="stylesheet" href="${contextPath}/css/order.css">
<link rel="stylesheet" href="${contextPath}/css/order_responsive.css">
</head>
<body>

<div class="super_container">
	
	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

	<!-- Menu -->
	<jsp:include page="../inc/menu.jsp" />

	<!-- Home -->
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="${contextPath}/images/product.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_container">
						<div class="home_content">
							<div class="home_title">주문하기</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- order -->
	<form action="${contextPath}/orderServlet/pay.do" method="post" id="checkout_form">
		<div class="checkout">
			<div class="container">
				<div class="row">
	
					<!-- Billing Details -->
					<div class="col-lg-6">
						<div class="billing">
							<div class="checkout_title">billing details</div>
							<div class="checkout_form_container">
								<input type="text" class="checkout_input" name="userName"value="${uservo.userName}"placeholder="이름" required="required">
								<input type="text" class="checkout_input" name="userEmail" value="${uservo.userEmail}" placeholder="이메일" required="required">
								<input type="text" class="checkout_input" name="userPhone" value="${uservo.userPhone}" placeholder="전화번호" required="required">
								<input type="text" class="checkout_input" name="userZipcode" value="${uservo.userZipcode}"  placeholder="우편번호" required="required">
								<input type="text" class="checkout_input" name="userAddress1"value="${uservo.userAddress1}" placeholder="주소" required="required">
								<input type="text" class="checkout_input" name="userAddress2" value="${uservo.userAddress2}" placeholder="상세주소" required="required">
							</div>		
							<div>					
								<p>요청사항</p>
								<select name="userComment"  id="userComment" class="form-control">
									<option>배송전 연락 바랍니다</option>
									<option>부재시 경비실에 맡겨주세요</option>
									<option>부재시 연락 바랍니다</option>
								</select>
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
										<div class="cart_total_title">상품</div>
										<div class="cart_total_price ml-auto">금액</div>
									</li>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<c:choose>
											<c:when test="${orderList != null}">
												<c:set value="${orderList}" scope="session" var="orderList" />
												<c:forEach begin="0" end="0" items="${orderList}" var="order">
													<div class="cart_total_title">${order.productName} 외 ${ordercount}개</div>
													<div class="cart_total_price ml-auto">${productTotalPrice}</div>
												</c:forEach>
											</c:when>
										</c:choose>
									</li>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<div class="cart_total_title">가격</div>
										<div class="cart_total_price ml-auto" ><fmt:formatNumber  type="number" maxFractionDigits="3" value="${map.totalPrice}" /></div>
									</li>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<div class="cart_total_title">배송비</div>
										<div class="cart_total_price ml-auto" ><fmt:formatNumber  type="number" maxFractionDigits="3" value="${totalDelivery}" /></div>
										<input type="hidden" name="productDelivery" value="${totalDelivery}">
									</li>
									<li class="d-flex flex-row align-items-start justify-content-start total_row">
										<div class="cart_total_title">합계</div>
										<div class="cart_total_price ml-auto"><fmt:formatNumber type="number" maxFractionDigits="3" value="${map.totalPrice+totalDelivery}" /></div>
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
									<div class="visa payment_option"><a href="#"><img src="${contextPath}/images/visa.jpg" alt=""></a></div>
									<div class="master payment_option"><a href="#"><img src="${contextPath}/images/master.jpg" alt=""></a></div>
								</div>
								<button type="submit" class="cart_total_button">결제하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- Newsletter -->
	<jsp:include page="../inc/newsletter.jsp" />
	
	<!-- Footer -->
	<jsp:include page="../inc/footer.jsp" />
	
</div>

<script src="${contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${contextPath}/js/popper.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/plugins/easing/easing.js"></script>
<script src="${contextPath}/plugins/parallax-js-master/parallax.min.js"></script>
<script src="${contextPath}/js/custom.js"></script>
<script src="${contextPath}/js/order_custom.js"></script>
</body>
</html>