<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<c:set var="map" value="${map}"/>
<c:set var="totalDelivery" value="${map.totalDelivery}"/>
<c:set var="userId" value="${sessionScope.userId}"/>
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
<link rel="stylesheet" href="${contextPath}/css/common.css">
<link rel="stylesheet" href="${contextPath}/css/common_responsive.css">
<link rel="stylesheet" href="${contextPath}/css/cart.css">
<link rel="stylesheet" href="${contextPath}/css/cart_responsive.css">

</head>
<body>

<div class="super_container">
	
	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

	<!-- Menu -->
	<jsp:include page="../inc/menu.jsp" />

	<!-- Home -->	
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="${contextPath}/images/cart.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_container">
						<div class="home_content">
							<div class="home_title">장바구니</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Cart -->

	<div class="cart container">			
		<div class="row">
			<div class="col">
				<div class="cart_bar d-flex flex-row align-items-center justify-content-start">
					<div class="cart_bar_title_name">상품</div>
					<div class="cart_bar_title_content ml-auto">
						<div class="cart_bar_title_content_inner d-flex flex-row align-items-center justify-content-end">
							<div class="cart_bar_title_price">가격</div>
							<div class="cart_bar_title_quantity">개수</div>
							<div class="cart_bar_title_total">합계</div>
							<div class="cart_bar_title_button"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="cart_products">
					<c:choose>
						<c:when test="${ list == null ||map == null}">
							<div class="p-5 text-center bg-light">등록된 상품이 없습니다.</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="cartList" items="${list}" varStatus="status">
								<fmt:formatNumber var="cartFormattedProductPrice" value="${cartList.productPrice}" pattern="#,###" />
								<fmt:formatNumber var="cartFormattedProductTotalPrice" value="${cartList.productTotalPrice}" pattern="#,###" />
								<ul>
									<li class=" cart_product d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-start">
									
										<!-- Product Image -->
										<div class="cart_product_image">
											<img src="${contextPath}/files/product/${cartList.productNo}/${cartList.productImage}" width="50px" name="productImage">
										</div>
										
										<!-- Product Name -->
										<div class="cart_product_name">
											<a href="${contextPath}/productServlet/readProduct.do?productNo=${cartList.productNo}">${cartList.productName}</a>
										</div>
										<div class="cart_product_info ml-auto">
											<div class="cart_product_info_inner d-flex flex-row align-items-center justify-content-md-end justify-content-start">

												<!-- Product Price -->
												<div class="cart_product_price" name="productPrice">${cartFormattedProductPrice}</div>

												<!-- Product Quantity -->
												<div class="product_quantity_container">
													<form action="${contextPath}/cartServlet/update.do" name="update${status.index}" method="post">
														<div class="product_quantity clearfix">
															<input type="hidden" name="userId" value="${cartList.userId}">
															<input type="hidden" name="productName" value="${cartList.productName}">
															<input type="hidden" name="productPrice" value="${cartList.productPrice}">
															<input type="text" name="cartQuantity" value="${cartList.cartQuantity}" class="quantity_input">
															&nbsp;&nbsp;&nbsp;

															<div class="quantity_buttons">
																<div id="quantity_inc_button" class="quantity_inc quantity_control">
																	<i class="fa fa-caret-up" aria-hidden="true"></i>
																</div>
																<div id="quantity_dec_button" class="quantity_dec quantity_control">
																	<i class="fa fa-caret-down" aria-hidden="true"></i>
																</div>
															</div>
														</div>
														<button type="submit" class="btn btn-secondary">변경</button>
													</form>
												</div>

												<!-- Products Total Price -->
												<div class="cart_product_total">${cartFormattedProductTotalPrice}</div>

												<!-- Product Cart Trash Button -->
												<div class="cart_product_button">
													<div class="cart_prod uct_remove" onclick="location.href='${contextPath}/cartServlet/deleteCart.do?userId=${cartList.userId}&productNo=${cartList.productNo}'">
														<img src="${contextPath}/images/trash.png">
													</div>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col">
				<div class="cart_control_bar d-flex flex-md-row flex-column align-items-start justify-content-start">
					<c:if test="${list != null}">	
						<form action="${contextPath}/cartServlet/allDelete.do" method="post" name="delete">
							<button type="submit" class="button_clear cart_button">장바구니 비우기</button>
						</form>
					</c:if>
					<button class="button_update cart_button_2 ml-md-auto" onclick="location.href='${contextPath}/productServlet/listProduct.do'">쇼핑 계속하기</button>
				</div>
			</div>
		</div>
		
		<c:if test="${list != null}">			
			<div class="row cart_extra">
				<!-- Cart Coupon -->
				<div class="col-lg-6">
					<div class="cart_coupon">
						<div class="cart_title">쿠폰</div>
						<form action="#" class="cart_coupon_form d-flex flex-row align-items-start justify-content-start" id="cart_coupon_form">
							<input type="text" class="cart_coupon_input" placeholder="쿠폰 번호" required="required">
							<button class="button_clear cart_button_2">사용하기</button>
						</form>
					</div>
				</div>
				<!-- Cart Total -->
				
				<div class="col-lg-5 offset-lg-1">
				<form action="${contextPath}/orderServlet/order.do" method="post">
					<div class="cart_total">
						<div class="cart_title">장바구니 합계</div>
						<ul>
							<li class="d-flex flex-row align-items-center justify-content-start">
								<div class="cart_total_title">가격</div>
								<div class="cart_total_price ml-auto"><fmt:formatNumber type="number" maxFractionDigits="3" value="${map.totalPrice}" /></div>
							</li>
							<li class="d-flex flex-row align-items-center justify-content-start">
								<div class="cart_total_title">배송비</div>
								<div class="cart_total_price ml-auto"><fmt:formatNumber type="number" maxFractionDigits="3"  value="${totalDelivery}" /></div>
							</li>
							<li class="d-flex flex-row align-items-center justify-content-start">
								<div class="cart_total_title">합계</div>
								<div class="cart_total_price ml-auto"><fmt:formatNumber type="number" maxFractionDigits="3" value="${map.totalPrice+totalDelivery}" /></div>
							</li>
						</ul>
						<input type="submit" class="cart_total_button" value="주문하기">
					</div>
				</form>
				</div>
			</div>
		</c:if>
	</div>
	
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
<script src="${contextPath}/js/cart_custom.js"></script>

</body>
</html>