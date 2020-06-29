<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<footer class="footer">
	<div class="container">
		<div class="row">
			<div class="col text-center">
				<div class="footer_logo"><a href="${contextPath}">ASSA</a></div>
				<nav class="footer_nav">
					<ul>
						<li><a href="${contextPath}/product/productList.jsp">상품 목록</a></li>
						<li><a href="${contextPath}/product/productInfo.jsp">상품 상세보기</a></li>
						<li><a href="${contextPath}/order/productCart.jsp">장바구니</a></li>
						<li><a href="${contextPath}/order/checkout.jsp">주문하기</a></li>
						<li><a href="${contextPath}/center/contact.jsp">contact</a></li>
					</ul>
				</nav>
				<div class="footer_social">
					<ul>
						<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-reddit-alien" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
					</ul>
				</div>
				<div class="copyright">
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</div>
			</div>
		</div>
	</div>
</footer>