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
<link rel="stylesheet" href="${contextPath}/css/bootstrap_custom.css">
<link rel="stylesheet" href="${contextPath}/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" href="${contextPath}/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" href="${contextPath}/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" href="${contextPath}/plugins/colorbox/colorbox.css">
<link rel="stylesheet" href="${contextPath}/css/common.css">
<link rel="stylesheet" href="${contextPath}/css/common_responsive.css">
<link rel="stylesheet" href="${contextPath}/css/index.css">
<link rel="stylesheet" href="${contextPath}/css/index_responsive.css">

</head>
<body>

<div class="super_container">

	<!-- Header -->
	<jsp:include page="./inc/header.jsp" />

	<!-- Menu -->
	<jsp:include page="./inc/menu.jsp" />

	<!-- Home -->
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="${contextPath}/images/product.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_container">
						<div class="home_content">
							<div class="home_title">Woman</div>
							<div class="breadcrumbs">
								<ul>
									<li><a href="index.html">Home</a></li>
									<li>Woman</li>
									<li>Swimsuits</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- wish list -->
	<h3 class="mb-3">위시리스트</h3>
	<div class="table-responsive">
		<table class="table table-striped table-sm">
			<thead>
				<tr>
					<th>상품 이미지</th>
					<th>상품 이름</th>
					<th>상품 가격</th>
					<th>장바구니 담기</th>
					<th>삭제하기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1,001</td>
					<td>Lorem</td>
					<td>ipsum</td>
					<td>dolor</td>
					<td>sit</td>
				</tr>
				
			</tbody>
		</table>
	</div>

	

	


	<!-- Footer -->
	<jsp:include page="./inc/footer.jsp" />
	
</div>

<script src="${contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${contextPath}/js/popper.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="${contextPath}/plugins/easing/easing.js"></script>
<script src="${contextPath}/plugins/parallax-js-master/parallax.min.js"></script>
<script src="${contextPath}/plugins/colorbox/jquery.colorbox-min.js"></script>
<script src="${contextPath}/js/custom.js"></script>
<script src="${contextPath}/js/index_custom.js"></script>
</body>
</html>