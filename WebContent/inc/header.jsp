<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<header class="header">
	<div class="header_inner d-flex flex-row align-items-center justify-content-start">
		<div class="logo"><a href="${contextPath}">ASSA</a></div>
		<nav class="main_nav">
			<ul>
				<li><a href="${contextPath}/product/productList.jsp">상품 목록</a></li>
				<li><a href="${contextPath}/product/productInfo.jsp">상품 상세보기</a></li>

				<li><a href="${contextPath}/cart/cart.do">장바구니</a></li>
                <li><a href="${contextPath}/cartorder/orderList.do">결제내역</a></li>
				<li><a href="${contextPath}/cartorder/order.do">주문하기</a></li>
				<li><a href="${contextPath}/center/contact.jsp">contact</a></li>
			</ul>
		</nav>
		<div class="header_content ml-auto">
			<div class="search header_search">
				<form action="#">
					<input type="search" class="search_input" required="required">
					<button type="submit" id="search_button" class="search_button"><img src="${contextPath}/images/magnifying-glass.svg" alt=""></button>
				</form>
			</div>
			<div class="shopping">
				<!-- Cart -->
				<a href="${contextPath}/order/productCart.jsp">
					<div class="cart">
						<img src="${contextPath}/images/shopping-bag.svg" alt="">
						<div class="cart_num_container">
							<div class="cart_num_inner">
								<div class="cart_num">1</div>
							</div>
						</div>
					</div>
				</a>
				<!-- Star -->
				<a href="#">
					<div class="star">
						<img src="${contextPath}/images/star.svg" alt="">
						<div class="star_num_container">
							<div class="star_num_inner">
								<div class="star_num">0</div>
							</div>
						</div>
					</div>
				</a>
				<!-- Avatar -->
				<a href="${contextPath}/user/login.jsp">
					<div class="avatar">
						<img src="${contextPath}/images/avatar.svg" alt="">
					</div>
				</a>				
				<c:if test="${userId!=null}">
					<h5 class="d-inline-block">${userId}님 로그인중</h5>
				</c:if>
			</div>
		</div>

		<div class="burger_container d-flex flex-column align-items-center justify-content-around menu_mm"><div></div><div></div><div></div></div>
	</div>
</header>