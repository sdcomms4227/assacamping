<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<c:set var="productList" value="${productListMap.productList}" />
<c:set var="totalCount" value="${productListMap.totalCount}" />
<c:set var="beginNo" value="${(pageNo-1) - (pageNo-1)%10 + 1}" />
<c:set var="endNo" value="${beginNo + 9}" />
<c:set var="numberPerPage" value="12" />
<c:set var="sortType" value="${sortType!=null?sortType:'new'}" />
<c:set var="bestSellersList" value="${bestSellersListMap.productList}" />
<!DOCTYPE html>
<html lang="kr">
<head>
<title>ASSA Product - 나혼자간다</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="ASSA Product - 나혼자간다">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/css/bootstrap_custom.css">
<link rel="stylesheet" href="${contextPath}/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" href="${contextPath}/css/common.css">
<link rel="stylesheet" href="${contextPath}/css/common_responsive.css">
<link rel="stylesheet" href="${contextPath}/css/listProduct.css">
<link rel="stylesheet" href="${contextPath}/css/listProduct_responsive.css">
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
							<div class="home_title">캠핑상품</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Products -->
	<div class="products">
		<div class="container">
		
			<!-- Sidebar Left -->
			<div class="sidebar_left clearfix">

				<!-- Categories -->
				<div class="sidebar_section">
					<div class="sidebar_title">Categories</div>
					<div class="sidebar_section_content sidebar_category_content">
						<ul>	
							<c:choose>
								<c:when test="${searchCategoryNo==0 or searchCategoryNo==null}">
									<li class="active"><a href="javascript:changeCategory(0)">전체보기</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="javascript:changeCategory(0)">전체보기</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="category" items="${productCategoryList}">		
								<c:choose>
									<c:when test="${category.productCategoryNo==searchCategoryNo}">
										<li class="active"><a href="javascript:changeCategory(${category.productCategoryNo})">${category.productCategoryName}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="javascript:changeCategory(${category.productCategoryNo})">${category.productCategoryName}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
				</div>

				<!-- Best Sellers -->
				<div class="sidebar_section">
					<div class="sidebar_title">Best Sellers</div>
					<div class="sidebar_section_content bestsellers_content">
						<ul>					
						
							<!-- Best Seller Item -->
							<c:forEach var="productMap" items="${bestSellersList}" begin="0" end="2" varStatus="status">
								<c:set var="productVO" value="${productMap.productVO}" />
								<fmt:formatNumber var="productFormattedPrice" value="${productVO.productPrice}" pattern="#,###" />
								<li class="clearfix">
									<div class="best_image"><a href="${contextPath}/productServlet/readProduct.do?productNo=${productVO.productNo}"><img src="${contextPath}/files/product/${productVO.productNo}/${productVO.productImageName1}" alt="${productVO.productName}"></a></div>
									<div class="best_content">
										<div class="best_title"><a href="${contextPath}/productServlet/readProduct.do?productNo=${productVO.productNo}">${productVO.productName}</a></div>
										<div class="best_price">${productFormattedPrice}</div>
									</div>
									<c:choose>
										<c:when test="${userId != null}">
											<div class="best_buy" onclick="addWish(${productVO.productNo})">+</div>
										</c:when>
										<c:otherwise>
											<div class="best_buy" onclick="alert('로그인 후  위시리스트 추가 가능합니다.');location.href='${contextPath}/userServlet/login.do'">+</div>
										</c:otherwise>
									</c:choose>	
								</li>							
							</c:forEach>
						</ul>
					</div>
				</div>

				<!-- Size -->
				<div class="sidebar_section sidebar_options">
					<div class="sidebar_section_content">

						<!-- Option Item -->
						<div class="sidebar_option d-flex flex-row align-items-center justify-content-start">
							<div class="option_image"><img src="${contextPath}/images/option_1.png" alt=""></div>
							<div class="option_content">
								<div class="option_title">30일 이내 환불</div>
								<div class="option_subtitle">이유를 묻지 않습니다</div>
							</div>
						</div>

						<!-- Option Item -->
						<div class="sidebar_option d-flex flex-row align-items-center justify-content-start">
							<div class="option_image"><img src="${contextPath}/images/option_2.png" alt=""></div>
							<div class="option_content">
								<div class="option_title">무료 배송</div>
								<div class="option_subtitle">5만원 이상 구매시</div>
							</div>
						</div>

						<!-- Option Item -->
						<div class="sidebar_option d-flex flex-row align-items-center justify-content-start">
							<div class="option_image"><img src="${contextPath}/images/option_3.png" alt=""></div>
							<div class="option_content">
								<div class="option_title">안전한 결제</div>
								<div class="option_subtitle">걱정하지 마세요</div>
							</div>
						</div>

						<!-- Option Item -->
						<div class="sidebar_option d-flex flex-row align-items-center justify-content-start">
							<div class="option_image"><img src="${contextPath}/images/option_4.png" alt=""></div>
							<div class="option_content">
								<div class="option_title">24시간 고객센터</div>
								<div class="option_subtitle">언제든지 전화주세요</div>
							</div>
						</div>

					</div>
				</div>
			</div>

			<!-- Sort -->
			<div class="row products_sort">								
				<div class="col text-right">
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<label class='btn ${sortType=="new" or sortType==""?"btn-primary":"btn-light"}'>
							<input type="radio" name="sort" onclick="listProduct(1,'new')" ${sortType=="new" or sortType==""?"checked":""} /> 신상품순
						</label>
						<label class='btn ${sortType=="best"?"btn-primary":"btn-light"}'>
							<input type="radio" name="sort" onclick="listProduct(1,'best')" ${sortType=="best"?"checked":""} /> 인기상품순
						</label>
						<label class='btn ${sortType=="minprice"?"btn-primary":"btn-light"}'>
							<input type="radio" name="sort" onclick="listProduct(1,'minprice')" ${sortType=="minprice"?"checked":""} /> 낮은가격순
						</label>
						<label class='btn ${sortType=="maxprice"?"btn-primary":"btn-light"}'>
							<input type="radio" name="sort" onclick="listProduct(1,'maxprice')" ${sortType=="maxprice"?"checked":""} /> 높은가격순
						</label>
					</div>
				</div>
			</div>

			<!-- Products -->
			<div class="row products_container">
				<div class="col">					
					<div class="product_grid">
						<c:choose>
							<c:when test="${totalCount==0}">
								<div class="static-empty p-5 border text-center">
									<p class="p-5 text-danger">등록된 상품이 없습니다.</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="productMap" items="${productList}" varStatus="status">
									<c:set var="productVO" value="${productMap.productVO}" />
									<c:set var="productCategoryName" value="${productMap.productCategoryName}" />
									<!-- Product -->
									<div class="product">
										<div class="product_image"><a href="javascript:readProduct(${productVO.productNo})"><img src="${contextPath}/files/product/${productVO.productNo}/${productVO.productImageName1}" alt="${productVO.productName}"></a></div>
										<div class="rating rating_${productVO.productRating}" data-rating="${productVO.productRating}">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="product_content clearfix">
											<div class="product_info">
												<div class="product_name"><a href="javascript:readProduct(${productVO.productNo})">${productVO.productName}</a></div>
												<c:choose>
													<c:when test="${productVO.productQuantity > 0}">
														<div class="product_price"><fmt:formatNumber value="${productVO.productPrice}" pattern="#,###" /></div>
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
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>					
			</div>

			<!-- pagination -->
			<c:if test="${totalCount != null}">
				<div class="row page_num_container">
					<div class="col text-right">
						<ul class="page_nums">
							<c:if test="${pageNo > numberPerPage}">	
							   	<li>
									<a href="javascript:listProduct(${beginNo-numberPerPage})">이전</a>
								</li>
							</c:if>
							<c:forEach var="page" begin="${beginNo}" end="${endNo}" step="1">
								<c:if test="${page <= Math.ceil(totalCount/numberPerPage)}">
									<c:choose>	
										<c:when test="${page==pageNo}">
											<li class="active">
												<a href="javascript:listProduct(${page})">${page}</a>						
											</li>
										</c:when>
										<c:otherwise>
											<li>
												<a href="javascript:listProduct(${page})">${page}</a>							
											</li>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>								
							<c:if test="${totalCount > endNo*numberPerPage}">						
							   	<li>
									<a href="javascript:listProduct(${beginNo+numberPerPage})">다음</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</c:if>

		</div>
		
		<!-- Sidebar Right -->
		<div class="sidebar_right clearfix">

			<!-- Promo 1 -->
			<div class="sidebar_promo_1 sidebar_promo d-flex flex-column align-items-center justify-content-center">
				<div class="sidebar_promo_image" style="background-image: url(${contextPath}/images/sidebar_promo_1.jpg)"></div>
				<div class="sidebar_promo_content text-center">
					<div class="sidebar_promo_title">30%<span>off</span></div>
					<div class="sidebar_promo_subtitle">텐트 할인</div>
					<div class="sidebar_promo_button"><a href="${contextPath}/productServlet/listProduct.do?searchCategoryNo=1">바로가기</a></div>
				</div>
			</div>

			<!-- Promo 2 -->
			<div class="sidebar_promo_2 sidebar_promo">
				<div class="sidebar_promo_image" style="background-image: url(${contextPath}/images/sidebar_promo_2.jpg)"></div>
				<div class="sidebar_promo_content text-center">
					<div class="sidebar_promo_title">25%<span>off</span></div>
					<div class="sidebar_promo_subtitle">캠핑소품 할인</div>
					<div class="sidebar_promo_button"><a href="${contextPath}/productServlet/listProduct.do?searchCategoryNo=8">바로가기</a></div>
				</div>
			</div>
		</div>

	</div>

	<!-- Newsletter -->
	<jsp:include page="../inc/newsletter.jsp" />

	<!-- Footer -->
	<jsp:include page="../inc/footer.jsp" />
	
</div>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
	<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo}" />
	<input type="hidden" name="sortType" value="${sortType}" />
</form>

<script src="${contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${contextPath}/js/popper.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/plugins/easing/easing.js"></script>
<script src="${contextPath}/plugins/parallax-js-master/parallax.min.js"></script>
<script src="${contextPath}/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="${contextPath}/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.js"></script>
<script src="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="${contextPath}/js/custom.js"></script>
<script src="${contextPath}/js/categories_custom.js"></script>

<script>
function listProduct(pageNo,sortType){
	var form = document.pagingForm;
	form.action = "${contextPath}/productServlet/listProduct.do";
	form.pageNo.value = pageNo;
	if(sortType){
		form.sortType.value = sortType;		
	}
	form.submit();
}

function readProduct(productNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/productServlet/readProduct.do?productNo=" + productNo;
	form.submit();
}

function changeCategory(categoryNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/productServlet/listProduct.do";	
	form.searchCategoryNo.value = categoryNo;
	form.submit();
}

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