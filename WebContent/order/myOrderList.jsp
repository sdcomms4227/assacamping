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
<link rel="stylesheet" href="${contextPath}/css/board.css" />
</head>
<body>

<div class="super_container">
	
	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

	<!-- Menu -->
	<jsp:include page="../inc/menu.jsp" />

	<!-- Home -->
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="${contextPath}/images/user.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_container">
						<div class="home_content">
							<div class="home_title">나의 주문 내역</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Order -->
	<article class="order container">
		<table class="table table-hover text-center">
			<colgroup>
				<col />
				<col />
				<col />
			</colgroup>
			<thead class="thead-light">
				<tr>
					<th>주문번호</th>
					<th>결제일</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${orderNo !=null}">
						<c:forEach items="${orderNo}" var="order">
							<tr onclick="location.href = '${contextPath}/orderServlet/orderInfo.do?orderNo=${order.orderNo}'" class="cursor-pointer">
								<td>${order.orderNo}</td>
								<td>${order.orderDate}</td>
								<td>${order.orderState}</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
		<div class="text-center my-5">
			<a class="btn btn-secondary" href="${contextPath}">홈</a>
		</div>
	</article>

	<%-- <article class="order container">
		<table class="table table-hover text-center">
			<colgroup>
				<col />
				<col />
				<col />
				<col />
				<col />
			</colgroup>
			<thead class="thead-light">
				<tr>
					<th>상품명</th>
					<th>개수</th>
					<th>주문번호</th>
					<th>결제일</th>
					<th>재구매</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${payList !=null}">
						<c:forEach items="${payList}" var="payList">
							<tr>
								<td>
									<a href="${contextPath}/orderServlet/orderInfo.do?orderNo=${payList.orderNo}"> ${payList.productName}</a>
								</td>
								<td>${payList.cartQuantity}</td>
								<td>${payList.orderNo}</td>
								<td>${payList.orderDate}</td>
								<td>
									<a href="${contextPath}/productServlet/readProduct.do?productNo=${payList.productNo}">재구매</a>
								</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
		<div class="text-center my-5">
			<a class="btn btn-secondary" href="${contextPath}">홈</a>
		</div>
	</article> --%>
	
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