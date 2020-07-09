<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="productList" value="${productListMap.productList}"/>
<%
	request.setCharacterEncoding("UTF-8");
%>

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
<link rel="stylesheet" href="${contextPath}/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" href="${contextPath}/css/common.css">
<link rel="stylesheet" href="${contextPath}/css/common_responsive.css">
<link rel="stylesheet" href="${contextPath}/css/categories.css">
<link rel="stylesheet" href="${contextPath}/css/categories_responsive.css">
</head>
<body>

<div class="super_container">
	
	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

	<!-- Menu -->
	<jsp:include page="../inc/menu.jsp" />

	<!-- Home -->

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="${contextPath}/images/categories.jpg" data-speed="0.8"></div>
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
									<li>Accessories</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Products -->

	<div class="products">
		<div class="container">
			<div class="row">
				<div class="col-12">
					
					<!-- Sidebar Left -->

					<div class="sidebar_left clearfix">

						<!-- Categories -->
						<div class="sidebar_section">
							<div class="sidebar_title">Categories</div>
							<div class="sidebar_section_content">
								<ul>
									<li><a href="#">Wedding Dresses (23)</a></li>
									<li><a href="#">Swimsuits (11)</a></li>
									<li><a href="#">Jeans (61)</a></li>
									<li><a href="#">Tops (34)</a></li>
								</ul>
							</div>
						</div>
						
						<!-- Color -->
						<div class="sidebar_section">
							<div class="sidebar_title">Color</div>
							<div class="sidebar_section_content sidebar_color_content mCustomScrollbar" data-mcs-theme="minimal-dark">
								<ul>
									<li><a href="#"><span style="background:#a3ccff"></span>Blue (23)</a></li>
									<li><a href="#"><span style="background:#937c6f"></span>Brown (11)</a></li>
									<li><a href="#"><span style="background:#000000"></span>Black (61)</a></li>
									<li><a href="#"><span style="background:#ff5c00"></span>Orange (34)</a></li>
									<li><a href="#"><span style="background:#a3ffb2"></span>Green (17)</a></li>
									<li><a href="#"><span style="background:#f52832"></span>Red (22)</a></li>
									<li><a href="#"><span style="background:#fdabf4"></span>Pink (7)</a></li>
									<li><a href="#"><span style="background:#ecf863"></span>Yellow (13)</a></li>
								</ul>
							</div>
						</div>

						<!-- Size -->
						<div class="sidebar_section">
							<div class="sidebar_title">Size</div>
							<div class="sidebar_section_content">
								<ul>
									<li><a href="#">Small S (23)</a></li>
									<li><a href="#">Medium M (11)</a></li>
									<li><a href="#">Large L (61)</a></li>
									<li><a href="#">Extra Large XL (34)</a></li>
								</ul>
							</div>
						</div>

						<!-- Price -->
						<div class="sidebar_section">
							<div class="sidebar_title">Price</div>
							<div class="sidebar_section_content">
								<div class="filter_price">
									<div id="slider-range" class="slider_range"></div>
									<p><input type="text" id="amount" class="amount" readonly style="border:0; font-weight:bold;"></p>
									<div class="clear_price_btn">Clear Price</div>
								</div>
							</div>
						</div>

						<!-- Best Sellers -->

						<div class="sidebar_section">
							<div class="sidebar_title">Best Sellers</div>
							<div class="sidebar_section_content bestsellers_content">
								<ul>
									<!-- Best Seller Item -->
									<li class="clearfix">
										<div class="best_image"><img src="${contextPath}/images/best_1.jpg" alt=""></div>
										<div class="best_content">
											<div class="best_title"><a href="product.html">Blue dress with dots</a></div>
											<div class="best_price">$45</div>
										</div>
										<div class="best_buy">+</div>
									</li>

									<!-- Best Seller Item -->
									<li class="clearfix">
										<div class="best_image"><img src="${contextPath}/images/best_2.jpg" alt=""></div>
										<div class="best_content">
											<div class="best_title"><a href="product.html">White t-shirt</a></div>
											<div class="best_price">$45</div>
										</div>
										<div class="best_buy">+</div>
									</li>

									<!-- Best Seller Item -->
									<li class="clearfix">
										<div class="best_image"><img src="${contextPath}/images/best_3.jpg" alt=""></div>
										<div class="best_content">
											<div class="best_title"><a href="product.html">Blue dress with dots</a></div>
											<div class="best_price">$45</div>
										</div>
										<div class="best_buy">+</div>
									</li>

									<!-- Best Seller Item -->
									<li class="clearfix">
										<div class="best_image"><img src="${contextPath}/images/best_4.jpg" alt=""></div>
										<div class="best_content">
											<div class="best_title"><a href="product.html">White t-shirt</a></div>
											<div class="best_price">$45</div>
										</div>
										<div class="best_buy">+</div>
									</li>

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
										<div class="option_title">30 Days Returns</div>
										<div class="option_subtitle">No questions asked</div>
									</div>
								</div>

								<!-- Option Item -->
								<div class="sidebar_option d-flex flex-row align-items-center justify-content-start">
									<div class="option_image"><img src="${contextPath}/images/option_2.png" alt=""></div>
									<div class="option_content">
										<div class="option_title">Free Delivery</div>
										<div class="option_subtitle">On all orders</div>
									</div>
								</div>

								<!-- Option Item -->
								<div class="sidebar_option d-flex flex-row align-items-center justify-content-start">
									<div class="option_image"><img src="${contextPath}/images/option_3.png" alt=""></div>
									<div class="option_content">
										<div class="option_title">Secure Payments</div>
										<div class="option_subtitle">No need to worry</div>
									</div>
								</div>

								<!-- Option Item -->
								<div class="sidebar_option d-flex flex-row align-items-center justify-content-start">
									<div class="option_image"><img src="${contextPath}/images/option_4.png" alt=""></div>
									<div class="option_content">
										<div class="option_title">24/7 Support</div>
										<div class="option_subtitle">Just call us</div>
									</div>
								</div>

							</div>
						</div>

					</div>

					<div class="current_page">Woman's Fashion</div>
				</div>
				<div class="col-12">
					<div class="product_sorting clearfix">
						<div class="view">
							<div class="view_box box_view"><i class="fa fa-th-large" aria-hidden="true"></i></div>
							<div class="view_box detail_view"><i class="fa fa-bars" aria-hidden="true"></i></div>
						</div>
						<div class="sorting">
							<ul class="item_sorting">
								<li>
								<!-- *** ajax로 구현하면 좋을 듯 한데.. 도와주세요!!  -->
									<span class="sorting_text">전체상품</span>
									<i class="fa fa-caret-down" aria-hidden="true"></i>
									<ul>
										<li class="product_sorting_btn" data-isotope-option='{ "sortBy": "original-order" }'><span>전체상품</span></li>
										<li class="product_sorting_btn" data-isotope-option='{ "sortBy": "price" }'><span>가격순</span></li>
										<li class="product_sorting_btn" data-isotope-option='{ "sortBy": "stars" }'><span>신상품순</span></li>
									</ul>
								</li>
								<li>
									<span class="sorting_text">Show</span>
									<span class="num_sorting_text">12</span>
									<i class="fa fa-caret-down" aria-hidden="true"></i>
									<ul>
										<li class="num_sorting_btn"><span>3</span></li>
										<li class="num_sorting_btn"><span>6</span></li>
										<li class="num_sorting_btn"><span>12</span></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		<form action="${contextPath}/pro/*">
			<%-- <input type="hidden" name="productCategory" value="${productMap.productCategoryName}">	 --%>
			<table width="1000" border="0" height="470" align="center">
				
				<c:choose>
					<c:when test="${productListMap.totalCount == null}">
						<div align="center">목록이 없습니다.</div>
					</c:when>
					
					<c:when test="${productListMap.totalCount != null}">
				
				<c:forEach var="productMap" items="${productList}">
				<c:set var="productCategoryName" value="${productMap.productCategoryName}"/>
				<c:set var="proVO" value="${productMap.proVO}"/>	
				<tr align="center">
				
				
				
								<td>
									<a href="${contextPath}/pro/getOnePro.do?productNo=${proVO.productNo}&productCategory=${productCategoryName}">
										
									<img src="${contextPath}/files/product/${proVO.productNo}/${proVO.productImageName1}" alt="${productAdminVO.productName}" style="height:40px" />
									</a>
									${proVO.productName}<br/>
									금액: ${proVO.productPrice}
								</td>
				</tr>
				</c:forEach>
				</c:when>
				</c:choose>
			</table>
			</form>

			<div class="row page_num_container">
				<div class="col text-right">
					<ul class="page_nums">
						<li><a href="#">01</a></li>
						<li class="active"><a href="#">02</a></li>
						<li><a href="#">03</a></li>
						<li><a href="#">04</a></li>
						<li><a href="#">05</a></li>
					</ul>
				</div>
			</div>

		</div>
		
		<!-- Sidebar Right -->

		<div class="sidebar_right clearfix">

			<!-- Promo 1 -->
			<div class="sidebar_promo_1 sidebar_promo d-flex flex-column align-items-center justify-content-center">
				<div class="sidebar_promo_image" style="background-image: url(${contextPath}/images/sidebar_promo_1.jpg)"></div>
				<div class="sidebar_promo_content text-center">
					<div class="sidebar_promo_title">30%<span>off</span></div>
					<div class="sidebar_promo_subtitle">On all shoes</div>
					<div class="sidebar_promo_button"><a href="checkout.html">check out</a></div>
				</div>
			</div>

			<!-- Promo 2 -->
			<div class="sidebar_promo_2 sidebar_promo">
				<div class="sidebar_promo_image" style="background-image: url(${contextPath}/images/sidebar_promo_2.jpg)"></div>
				<div class="sidebar_promo_content text-center">
					<div class="sidebar_promo_title">30%<span>off</span></div>
					<div class="sidebar_promo_subtitle">On all shoes</div>
					<div class="sidebar_promo_button"><a href="checkout.html">check out</a></div>
				</div>
			</div>
		</div>

	</div>

	<!-- Extra -->

	

	<!-- Newsletter -->

	<div class="newsletter">
		<div class="newsletter_content">
			<div class="newsletter_image" style="background-image:url(${contextPath}/images/newsletter.jpg)"></div>
			<div class="container">
				<div class="row">
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
<script src="${contextPath}/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="${contextPath}/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.js"></script>
<script src="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="${contextPath}/js/custom.js"></script>
<script src="${contextPath}/js/categories_custom.js"></script>
</body>
</html>