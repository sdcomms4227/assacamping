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
		<table class="table read-table">
			<colgroup>
				<col style="width:150px" />
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th>주문번호</th>
					<td class="text-danger">${orderInfo[0].orderNo}</td>
				</tr>
				<tr>
					<th class="align-middle">상품명</th>
					<td>
						<c:forEach items="${orderInfo}" var="order">
							<div class="my-1">
				                ${order.productName}
				                <a class="btn btn-sm btn-secondary ml-2" href="${contextPath}/productServlet/readProduct.do?productNo=${order.productNo}">재구매</a>
			                </div>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th class="align-middle">배송지</th>
					<td colspan="2">
						(${orderInfo[0].userZipcode}) <br />
						${orderInfo[0].userAddress1}${orderInfo[0].userAddress2}
					</td>
				</tr>
				<tr>
					<th class="align-middle">배송메시지</th>
					<td colspan="2">${orderInfo[0].userComment}</td>
				</tr>
				<tr>
					<th class="align-middle">상태</th>
					<td>${orderInfo[0].orderState}</td>
				</tr>
			</tbody>
		</table>
		<div class="text-center my-5">
			<a class="btn btn-secondary" href="${contextPath}/orderServlet/myOrderList.do">목록</a>
			<a class="btn btn-danger" href="${contextPath}/orderServlet/orderDelete.do?orderNo=${orderInfo[0].orderNo}">주문취소</a>
		</div>
	</article>

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