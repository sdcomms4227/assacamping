<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<c:set var="newArrivalsList" value="${newArrivalsListMap.productList}" />
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
<c:choose>
	<c:when test='${msg=="complete"}'>
		<script>
			window.onload = function(){
				window.alert("그동안 ASSACAMPING을 이용해 주셔서 감사합니다.");	}
		</script>
	</c:when>
	<c:when test='${requestScope.msg == "modified" }'>
		<script>
				window.onload = function(){
				window.alert("수정완료 되었습니다.");}		
		</script>
	</c:when>	
</c:choose>
</head>
<body>

<div class="super_container">

	<!-- Header -->
	<jsp:include page="./inc/header.jsp" />

	<!-- Menu -->
	<jsp:include page="./inc/menu.jsp" />

	<!-- Home -->

	<div class="home home_index">

	
		<!-- Home Slider -->

		<div class="home_slider_container">
			<div class="owl-carousel owl-theme home_slider">
				
				<!-- Home Slider Item -->
				<div class="owl-item">
					<div class="home_slider_background" style="background-image:url(${contextPath}/images/home_slider_1.jpg)"></div>
					<div class="home_slider_content">
						<div class="home_slider_content_inner">
							<div class="home_slider_title">ASSA Camping</div>
						</div>	
					</div>
				</div>

				<!-- Home Slider Item -->
				<div class="owl-item">
					<div class="home_slider_background" style="background-image:url(${contextPath}/images/home_slider_2.jpg)"></div>
					<div class="home_slider_content">
						<div class="home_slider_content_inner">
							<div class="home_slider_title">ASSA Camping</div>
						</div>	
					</div>
				</div>

				<!-- Home Slider Item -->
				<div class="owl-item">
					<div class="home_slider_background" style="background-image:url(${contextPath}/images/home_slider_3.jpg)"></div>
					<div class="home_slider_content">
						<div class="home_slider_content_inner">
							<div class="home_slider_title">ASSA Camping</div>
						</div>	
					</div>
				</div>

			</div>
			
			<!-- Home Slider Nav -->

			<div class="home_slider_next d-flex flex-column align-items-center justify-content-center"><img src="${contextPath}/images/arrow_r.png" alt=""></div>

			<!-- Home Slider Dots -->

			<div class="home_slider_dots_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="home_slider_dots">
								<ul id="home_slider_custom_dots" class="home_slider_custom_dots">
									<li class="home_slider_custom_dot active">01.<div></div></li>
									<li class="home_slider_custom_dot">02.<div></div></li>
									<li class="home_slider_custom_dot">03.<div></div></li>
								</ul>
							</div>
						</div>
					</div>
				</div>		
			</div>
		</div>
	</div>

	<!-- Promo -->

	<div class="promo">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title_container text-center">
						<div class="section_subtitle">only the best</div>
						<div class="section_title">promo prices</div>
					</div>
				</div>
			</div>
			<div class="row promo_container">

				<!-- Promo Item -->
				<div  class="col-lg-4 promo_col">
					<div class="promo_item">
						<div class="promo_image">
							<img class="img1" src="${contextPath}/images/promo_1.jpg" alt="텐트 할인">
							<div class="promo_content promo_content_1">
								<div class="promo_title">-30% off</div>
								<div class="promo_subtitle">텐트 할인</div>
							</div>
						</div>
						<div class="promo_link"><a href="${contextPath}/files/product/listProduct.do?searchCategoryNo=1">Shop Now</a></div>
					</div>
				</div>

				<!-- Promo Item -->
				<div class="col-lg-4 promo_col">
					<div class="promo_item">
						<div class="promo_image">
							<img src="${contextPath}/images/promo_2.jpg" alt="침낭 / 매트 할인">
							<div class="promo_content promo_content_2">
								<div class="promo_title">-30% off</div>
								<div class="promo_subtitle">침낭 / 매트 할인</div>
							</div>
						</div>
						<div class="promo_link"><a href="${contextPath}/productServlet/listProduct.do?searchCategoryNo=3">Shop Now</a></div>
					</div>
				</div>

				<!-- Promo Item -->
				<div class="col-lg-4 promo_col">
					<div class="promo_item">
						<div class="promo_image">
							<img src="${contextPath}/images/promo_3.jpg"  alt="캠핑소품 할인">
							<div class="promo_content promo_content_3">
								<div class="promo_title">-25% off</div>
								<div class="promo_subtitle">캠핑소품 할인</div>
							</div>
						</div>
						<div class="promo_link"><a href="${contextPath}/productServlet/listProduct.do?searchCategoryNo=8">Shop Now</a></div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- New Arrivals -->

	<div class="arrivals">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title_container text-center">
						<div class="section_subtitle">only the best</div>
						<div class="section_title">new arrivals</div>
					</div>
				</div>
			</div>
			<div class="row products_container">
				<c:choose>
					<c:when test="${totalCount==0}">
						<div class="col-12">
							<div class="static-empty p-5 border text-center">
								<p class="p-5 text-danger">등록된 상품이 없습니다.</p>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="productMap" items="${newArrivalsList}" begin="0" end="2" varStatus="status">
							<c:set var="productVO" value="${productMap.productVO}" />
							<c:set var="productCategoryName" value="${productMap.productCategoryName}" />
							<fmt:formatNumber var="productFormattedPrice" value="${productVO.productPrice}" pattern="#,###" />
							<div class="col-lg-4 product_col">
								<!-- Product -->
								<div class="product">
									<div class="product_image"><a href="${contextPath}/productServlet/readProduct.do?productNo=${productVO.productNo}"><img src="${contextPath}/files/product/${productVO.productNo}/${productVO.productImageName1}" alt="${productVO.productName}"></a></div>
									<div class="rating rating_${productVO.productRating}" data-rating="${productVO.productRating}">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
									</div>
									<div class="product_content clearfix">
										<div class="product_info">
											<div class="product_name"><a href="${contextPath}/productServlet/readProduct.do?productNo=${productNo}">${productVO.productName}</a></div>
											<c:choose>
												<c:when test="${productVO.productQuantity > 0}">
													<div class="product_price">${productFormattedPrice}</div>
												</c:when>
												<c:otherwise>
													<div class="product_empty">
														<div class="text-danger">품절</div>
													</div>
												</c:otherwise>												
											</c:choose>
										</div>
										<div class="product_options">
											<c:if test="${productVO.productQuantity > 0}">										
												<c:choose>
													<c:when test="${userId != null}">
														<form name="productCartForm${status.index}" class="d-inline-block" action="${contextPath}/cartServlet/addCart.do?userId=${userId}" method="post" enctype="multipart/form-data">
															<input type="hidden" name="productNo" value="${productVO.productNo}">
															<input type="hidden" name="productName" value="${productVO.productName}">
															<input type="hidden" name="productPrice" value="${productVO.productPrice}">
															<input type="hidden" name="productImage" value="${productVO.productImageName1}">
															<input type="hidden" name="productCategory" value="${productVO.productCategoryNo}">
															<input type="hidden" name="cartQuantity" value="1">
															<input type="hidden" name="productDelivery" value="1">
															<div class="product_buy product_option" onclick="document.productCartForm${status.index}.submit()"><img src="${contextPath}/images/shopping-bag-white.svg" alt=""></div>
														</form>
													</c:when>
													<c:otherwise>
														<div class="product_buy product_option" onclick="alert('로그인 후  장바구니 담기가 가능합니다.');location.href='${contextPath}/userServlet/login.do'"><img src="${contextPath}/images/shopping-bag-white.svg" alt=""></div>
													</c:otherwise>
												</c:choose>
											</c:if>
											<c:choose>
												<c:when test="${userId != null}">
													<div class="product_fav product_option" onclick="addWish(${productVO.productNo})">+</div>
												</c:when>
												<c:otherwise>
													<div class="product_fav product_option" onclick="alert('로그인 후  위시리스트 추가 가능합니다.');location.href='${contextPath}/userServlet/login.do'">+</div>
												</c:otherwise>
											</c:choose>												
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<!-- Gallery -->

	<div class="gallery">
		<div class="gallery_image" style="background-image:url(${contextPath}/images/gallery.jpg)"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="gallery_title text-center">
						<ul>
							<li><a href="#">#캠핑</a></li>
							<li><a href="#">#나혼자캠핑</a></li>
							<li><a href="#">#감성캠핑</a></li>
						</ul>
					</div>
					<div class="gallery_text text-center">*Integer ut imperdiet erat. Quisque ultricies lectus tellus, eu tristique magna pharetra.</div>
					<div class="button gallery_button"><a href="${contextPath}/campingServlet/listCamping.do">캠핑정보</a></div>
				</div>
			</div>
		</div>	
		<div class="gallery_slider_container">
			
			<!-- Gallery Slider -->
			<div class="owl-carousel owl-theme gallery_slider">
				
				<!-- Gallery Item -->
				<div class="owl-item gallery_item">
					<a class="colorbox" href="${contextPath}/images/gallery_1.jpg">
						<img src="${contextPath}/images/gallery_1.jpg" alt="">
					</a>
				</div>

				<!-- Gallery Item -->
				<div class="owl-item gallery_item">
					<a class="colorbox" href="${contextPath}/images/gallery_2.jpg">
						<img src="${contextPath}/images/gallery_2.jpg" alt="">
					</a>
				</div>

				<!-- Gallery Item -->
				<div class="owl-item gallery_item">
					<a class="colorbox" href="${contextPath}/images/gallery_3.jpg">
						<img src="${contextPath}/images/gallery_3.jpg" alt="">
					</a>
				</div>

				<!-- Gallery Item -->
				<div class="owl-item gallery_item">
					<a class="colorbox" href="${contextPath}/images/gallery_4.jpg">
						<img src="${contextPath}/images/gallery_4.jpg" alt="">
					</a>
				</div>

				<!-- Gallery Item -->
				<div class="owl-item gallery_item">
					<a class="colorbox" href="${contextPath}/images/gallery_5.jpg">
						<img src="${contextPath}/images/gallery_5.jpg" alt="">
					</a>
				</div>

				<!-- Gallery Item -->
				<div class="owl-item gallery_item">
					<a class="colorbox" href="${contextPath}/images/gallery_6.jpg">
						<img src="${contextPath}/images/gallery_6.jpg" alt="">
					</a>
				</div>

			</div>
		</div>	
	</div>

	<!-- Newsletter -->
	<jsp:include page="./inc/newsletter.jsp" />

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
<script>
//위시리스트 ------------------------------------------------------------
function addWish(productNo) {
	var form = document.createElement("form");
	form.setAttribute("method", "post");
	form.setAttribute("action", "${contextPath}/wishListServlet/addWish.do");
	
	var input1 = document.createElement("input");	
	input1.setAttribute("type","hidden");
	input1.setAttribute("name","productNo");
	input1.setAttribute("value", productNo);
	
	form.appendChild(input1);
	document.body.appendChild(form);
	form.submit();
}
</script>
</body>
</html>