<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<c:set var="wList" value="${wListMap.wList}" />
<c:set var="totalCount" value="${wListMap.totalCount}" />
<c:set var="userId" value="${sessionScope.userId}" />
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
<link rel="stylesheet" href="${contextPath}/css/wishList.css">
<link rel="stylesheet" href="${contextPath}/css/wishList_responsive.css">

</head>
<body>

<div class="super_container">

	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

	<!-- Menu -->
	<jsp:include page="../inc/menu.jsp" />

	<!-- Home -->
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="${contextPath}/images/wishlist.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_container">
						<div class="home_content">
							<div class="home_title">위시리스트</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="wishList container">			
		<div class="row">
			<div class="col">
				<div class="wishList_bar d-flex flex-row align-items-center justify-content-start">
					<div class="wishList_bar_title_name">상품</div>
					<div class="wishList_bar_title_content ml-auto">
						<div class="wishList_bar_title_content_inner d-flex flex-row align-items-center justify-content-end">
							<div class="wishList_bar_title_price">가격</div>
							<div class="wishList_bar_title_cart">장바구니 담기</div>
							<div class="wishList_bar_title_button"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="wishList_products">
					<c:choose>
						<c:when test="${totalCount == 0}">
							<div class="p-5 text-center bg-light">등록된 상품이 없습니다.</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="wMap" items="${wList}">
								<c:set var="wishListVO" value="${wMap.wishListVO}" />
								<c:set var="productVO" value="${wMap.productVO}" />
								<fmt:formatNumber var="wishFormattedProductPrice" value="${productVO.productPrice}" pattern="#,###" />
								<ul>
									<li class="wishList_product d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-start">
									
										<!-- Product Image -->
										<div class="wishList_product_image">
											<img src="${contextPath}/files/product/${wishListVO.productNo}/${productVO.productImageName1}" alt="${productVO.productName}" width="50px" name="productImage">
										</div>
										
										<!-- Product Name -->
										<div class="wishList_product_name">
											<a href="${contextPath}/productServlet/readProduct.do?productNo=${wishListVO.productNo}">${productVO.productName}</a>
										</div>
										<div class="wishList_product_info ml-auto">
											<div class="wishList_product_info_inner d-flex flex-row align-items-center justify-content-md-end justify-content-start">

												<!-- Product Price -->
												<div class="wishList_product_price" name="productPrice">${wishFormattedProductPrice}</div>
												
												<!-- Products Add Cart Button -->
												<c:choose>
													<c:when test="${productVO.productQuantity > 0}">
														<div class="wishList_product_cart">
															<button type="button" class="btn btn-secondary" onclick="addCart(${wishListVO.productNo}, '${productVO.productName}', ${productVO.productPrice}, '${productVO.productImageName1}', ${productVO.productCategoryNo})">장바구니 담기</button>
														</div>
													</c:when>
													<c:otherwise>
														<div class="wishList_product_cart text-danger">
															품절
														</div>
													</c:otherwise>
												</c:choose>
												
												<!-- Product WishList Trash Button -->
												<div class="wishList_product_button">
													<div class="wishList_prod uct_remove" onclick="deleteWish(${wishListVO.wishNo})"><img src="${contextPath}/images/trash.png"></div>
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
				<div class="wishList_control_bar d-flex flex-md-row flex-column align-items-start justify-content-start">
					<button class="button_clear wishList_button" type="button" onclick="deleteAllWish()">위시리스트 비우기</button>
					<button class="button_update wishList_button_2 ml-md-auto" onclick="location.href='${contextPath}/productServlet/listProduct.do'">쇼핑 계속하기</button>
				</div>
			</div>
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
<script src="${contextPath}/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="${contextPath}/plugins/easing/easing.js"></script>
<script src="${contextPath}/plugins/parallax-js-master/parallax.min.js"></script>
<script src="${contextPath}/plugins/colorbox/jquery.colorbox-min.js"></script>
<script src="${contextPath}/js/custom.js"></script>
<script src="${contextPath}/js/order_custom.js"></script>

<script>

function addCart(productNo, productName, productPrice, productImageName1, productCategoryNo) {
	var result = confirm("장바구니에 담으시겠습니까?");
	
	if(result){
		
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", "${contextPath}/cartServlet/addCart.do");
		form.setAttribute("enctype", "multipart/form-data");
		
		var input1 = document.createElement("input");
		input1.setAttribute("type","hidden");
		input1.setAttribute("name","userId");
		input1.setAttribute("value", "${userId}");		

		var input2 = document.createElement("input");
		input2.setAttribute("type","hidden");
		input2.setAttribute("name","productNo");
		input2.setAttribute("value", productNo);		

		var input3 = document.createElement("input");
		input3.setAttribute("type","hidden");
		input3.setAttribute("name","productName");
		input3.setAttribute("value", productName);		

		var input4 = document.createElement("input");
		input4.setAttribute("type","hidden");
		input4.setAttribute("name","productPrice");
		input4.setAttribute("value", productPrice);		

		var input5 = document.createElement("input");
		input5.setAttribute("type","hidden");
		input5.setAttribute("name","productImage");
		input5.setAttribute("value", productImageName1);

		var input6 = document.createElement("input");
		input6.setAttribute("type","hidden");
		input6.setAttribute("name","productCategoryNo");
		input6.setAttribute("value", productCategoryNo);

		var input7 = document.createElement("input");
		input7.setAttribute("type","hidden");
		input7.setAttribute("name","cartQuantity");
		input7.setAttribute("value", 1);

		var input8 = document.createElement("input");
		input8.setAttribute("type","hidden");
		input8.setAttribute("name","productDelivery");
		input8.setAttribute("value", 1);
		
		form.appendChild(input1);
		form.appendChild(input2);
		form.appendChild(input3);
		form.appendChild(input4);
		form.appendChild(input5);
		form.appendChild(input6);
		form.appendChild(input7);
		form.appendChild(input8);
		document.body.appendChild(form);
		form.submit();
	}
}

function deleteWish(wishNo){
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		window.location.href = "${contextPath}/wishListServlet/deleteWish.do?wishNo=" + wishNo;
	}
}

function deleteAllWish() {
	if(${totalCount} == 0) {
		window.alert("위시리스트가 비어있습니다.");
		return;
	}
	var result = confirm("위시리스트를 전부 삭제하시겠습니까?");	
	if(result){
		window.location.href = "${contextPath}/wishListServlet/deleteAllWish.do";
	}
}
</script>
</body>
</html>