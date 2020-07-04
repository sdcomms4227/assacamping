<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
 <c:set var="map" value="${map}"/>
<c:set var="totalDelivery" value="${map.totalDelivery}"/>
 <c:set var="userId" value="${sessionScope.userId}"/>
<% request.setCharacterEncoding("UTF-8");%>
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
<link rel="stylesheet" type="text/css" href="${contextPath}/css/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/cart.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/cart_responsive.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

function fn_update(){
	
	var cartQuantity = $("#quantity_input").val();
	var productName = $("#productName").val();
	var userId = $("#userId").val();
	var productPrice= $("#productPrice").val();
	
	document.update.action="${contextPath}/cart/update.do?userId="+userId+"&cartQuantity="+cartQuantity+"&productName="+productName+"&productPrice="+productPrice ;
    
	document.update.submit();
    
    }


function fn_delete() {
	var userId=$("#userId").val();
	location.href="${contextPath}/cart/allDelte.do?userId="+userId;
}
</script>
</head>
<body>

<div class="super_container">
	
	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

	<!-- Menu -->
	<jsp:include page="../inc/menu.jsp" />

	<!-- Home -->
<c:set var="userId" value="${sessionScope.userId }"/>
	<%
  // String userId=(String)session.getAttribute("userId");  
  //  String userId=request.getParameter("userId"); 
 
  //  System.out.print(userId+"cart"); 
     %>
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="${contextPath}/images/cart.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_container">
						<div class="home_content">
							<div class="home_title">Shopping Cart</div>
							<div class="breadcrumbs">
								<ul>
									<li><a href="index.html">Home</a></li>
									<li>Shopping Cart</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Cart -->

	<div class="cart_container">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="cart_title">your shopping cart</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="cart_bar d-flex flex-row align-items-center justify-content-start">
						<div class="cart_bar_title_name">Product</div>
						<div class="cart_bar_title_content ml-auto">
							<div class="cart_bar_title_content_inner d-flex flex-row align-items-center justify-content-end">
								<div class="cart_bar_title_price">Price</div>
								<div class="cart_bar_title_quantity">Quantity</div>
								<div class="cart_bar_title_total">Total</div>
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
					 <c:when test="${list == null }">
                          <br> <div align="center">장바구니가 비어있습니다</div>
                          <button class="button_update cart_button_2 ml-md-auto" onclick="location.href='${contextPath}/index.jsp'">continue shopping</button>					 
					 </c:when>
					  <c:when test="${list != null }">
					    <c:forEach var="cartList" items="${list}">
						<ul>
							<li class=" cart_product d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-start">
								<!-- Product Image -->

								
								<div class="cart_product_image">
								<img src="${contextPath}/images/cart_product_1.jpg"  name="productImage"></div>

								<!-- Product Name -->
								<div class="cart_product_name" name="productName"><a href="${contextPath}/pro/getOnePro.do?productNo=${cartList.productNo}">${cartList.productName}</a></div>
								<div class="cart_product_info ml-auto">
									<div class="cart_product_info_inner d-flex flex-row align-items-center justify-content-md-end justify-content-start">
										<!-- Product Price -->
										<div class="cart_product_price" name="productPrice">${cartList.productPrice}</div>
										<!-- Product Quantity -->
									<form  action="${contextPath}" name="update" id="update" method="post">
										<div class="product_quantity_container">
											<div class="product_quantity clearfix">
						                           <input type="hidden"  id="userId" value="${cartList.userId}">
						                           <input type="hidden" id="productName" value="${cartList.productName}">
						                           <input type="hidden" id="productPrice" value="${cartList.productPrice}">
												   <input id="quantity_input" type="text" name="cartQuantity" value="${cartList.cartQuantity}" >&nbsp;&nbsp;&nbsp;
												  
												<div class="quantity_buttons">
													<div id="quantity_inc_button" class="quantity_inc quantity_control"><i class="fa fa-caret-up" aria-hidden="true"></i></div>
													<div id="quantity_dec_button" class="quantity_dec quantity_control"><i class="fa fa-caret-down" aria-hidden="true"></i></div>
												</div>
												 
											</div>
											
										</div>
										<input type="button" value="변경" onclick="fn_update();">
										</form>
										<!-- Products Total Price -->
										
										<div class="cart_product_total">${cartList.productTotalPrice}</div> <!-- 상품한개의 가격*상품수량  -->
										
										<!-- Product Cart Trash Button -->
										<div class="cart_product_button">

											<button class="cart_prod uct_remove" onclick="location.href='${contextPath}/cart/deleteCart.do?userId=${cartList.userId}&productNo=${cartList.productNo}'"><img src="${contextPath}/images/trash.png" ></button>

										</div>
									</div>
								</div>
							</li>
						</ul>
						</c:forEach>
						
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="cart_control_bar d-flex flex-md-row flex-column align-items-start justify-content-start">
					  <form method="post" name="delete">
					    <input type="hidden" id="userId" value="${userId}">
						<button class="button_clear cart_button" onclick="fn_delete();">clear cart</button>
						</form>
						<button class="button_update cart_button_2 ml-md-auto" onclick="location.href='${contextPath}/index.jsp'">continue shopping</button>
					
					</div>
				</div>
			</div>
			<div class="row cart_extra">
				<!-- Cart Coupon -->
				<div class="col-lg-6">
					<div class="cart_coupon">
						<div class="cart_title">coupon code</div>
						<form action="#" class="cart_coupon_form d-flex flex-row align-items-start justify-content-start" id="cart_coupon_form">
							<input type="text" class="cart_coupon_input" placeholder="Coupon code" required="required">
							<button class="button_clear cart_button_2">apply coupon</button>
						</form>
					</div>
				</div>
				<!-- Cart Total -->
				<form action="${contextPath}/cartorder/order.do" method="post">
				
				<div class="col-lg-5 offset-lg-1">
					<div class="cart_total">
						<div class="cart_title">cart total</div>
						<ul>
							<li class="d-flex flex-row align-items-center justify-content-start">
								<div class="cart_total_title">Subtotal-</div>&nbsp;&nbsp;
								<div class="cart_total_price ml-auto"><fmt:formatNumber type="number" maxFractionDigits="3" value="${map.totalPrice}" /></div>
							</li>
							<li class="d-flex flex-row align-items-center justify-content-start">
								<div class="cart_total_title">Shipping-</div>&nbsp;&nbsp;
								<div class="cart_total_price ml-auto">
 								<fmt:formatNumber type="number" maxFractionDigits="3"  value="${totalDelivery}" />
							    
								</div>
							</li>
							<li class="d-flex flex-row align-items-center justify-content-start">
								<div class="cart_total_title">Total-</div>&nbsp;&nbsp;
								<div class="cart_total_price ml-auto">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${map.totalPrice+totalDelivery}" />
								
								</div>
							</li>
						</ul>
						<input type="submit" class="cart_total_button" value="주문하기">
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
       </c:when>
	</c:choose>
	
	<!-- Newsletter -->

	<div class="newsletter">
		<div class="newsletter_content">
			<div class="newsletter_image parallax-window" data-parallax="scroll" data-image-src="${contextPath}/images/cart_nl.jpg" data-speed="0.8"></div>
			<div class="container">
				<div class="row options">

					<!-- Options Item -->
					<div class="col-lg-3">
						<div class="options_item d-flex flex-row align-items-center justify-content-start">
							<div class="option_image"><img src="${contextPath}/images/option_1.png" alt=""></div>
							<div class="option_content">
								<div class="option_title">30 Days Returns</div>
								<div class="option_subtitle">No questions asked</div>
							</div>
						</div>
					</div>

					<!-- Options Item -->
					<div class="col-lg-3">
						<div class="options_item d-flex flex-row align-items-center justify-content-start">
							<div class="option_image"><img src="${contextPath}/images/option_2.png" alt=""></div>
							<div class="option_content">
								<div class="option_title">Free Delivery</div>
								<div class="option_subtitle">On all orders</div>
							</div>
						</div>
					</div>

					<!-- Options Item -->
					<div class="col-lg-3">
						<div class="options_item d-flex flex-row align-items-center justify-content-start">
							<div class="option_image"><img src="${contextPath}/images/option_3.png" alt=""></div>
							<div class="option_content">
								<div class="option_title">Secure Payments</div>
								<div class="option_subtitle">No need to worry</div>
							</div>
						</div>
					</div>

					<!-- Options Item -->
					<div class="col-lg-3">
						<div class="options_item d-flex flex-row align-items-center justify-content-start">
							<div class="option_image"><img src="${contextPath}/images/option_4.png" alt=""></div>
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
<script src="${contextPath}/js/cart_custom.js"></script>
</body>
</html>