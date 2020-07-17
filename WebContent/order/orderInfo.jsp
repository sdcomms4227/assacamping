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
							<div class="home_title">주문완료</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- order -->
	<article class="order container">
		<div class="row my-5 p-5 bg-light">
			<div class="col-12">
				<h2 class="h2 text-center">주문해주셔서 감사합니다.</h2>
			</div>
		</div>
		<table class="table text-center">
			<colgroup>
				<col />
				<col />
			</colgroup>
			<thead class="thead-light">
				<tr>
					<th>상품명</th>
					<th>개수</th>
				</tr>
			</thead>
			<tbody>
		
				<c:choose>
					<c:when test="${orderlist != null }">
						<c:forEach var="order" items="${orderlist}">
							<tr align="center">
								<td><a href="${contextPath}/productServlet/readProduct.do?productNo=${order.productNo}">${order.productName}</a></td>
								<td>${order.cartQuantity}</td>
							</tr>
						</c:forEach>					
					</c:when>
				</c:choose>				
			</tbody>
			<tfoot>
				<c:choose>
					<c:when test="${orderlist != null }">
						<c:forEach items="${orderlist}" var="order" begin="0" end="0">
							<td colspan="2" class="text-right">총가격 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${order.productPayment}" /></td>
						</c:forEach>
					</c:when>
				</c:choose>					
			</tfoot>
		</table>
	</article>
	
	<div class="row my-5">
		<div class="col-12 text-center">
			<a class="btn btn-secondary" href="${contextPath}">홈</a>
			<a class="btn btn-secondary" href="${contextPath}/orderServlet/myOrderList.do">나의 주문 내역</a>
		</div>
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
<script src="${contextPath}/js/order_custom.js"></script>
</body>
</html>