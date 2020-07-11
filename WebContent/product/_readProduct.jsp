<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%-- <c:set var="userId" value="${sessionScope.userId}"/> --%>
<c:set var="productCategory" value="${productCategory}"/>

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
<link rel="stylesheet" href="${contextPath}/css/product.css">
<link rel="stylesheet" href="${contextPath}/css/product_responsive.css">
	   
	<script type="text/javascript">
   		/* function fn_order_pro(obj, userId){
   			var form = document.createElement("form");
   			
   		 	form.setAttribute("method", "post");
   		 	
   			form.setAttribute("action", url);
   			
	   	     var IdInput = document.createElement("input");
	   	     
	   	     parentNOInput.setAttribute("type","hidden");
	   	     parentNOInput.setAttribute("name","userId");
	   	     parentNOInput.setAttribute("value", userId);
   		 
   	     form.appendChild(parentNOInput);
   	     document.body.appendChild(form);
   		 form.submit();
   		} */
   		
   		function backToList(obj){
   			obj.action="${contextPath}/pro/proList.do";
   			obj.submit();
   		}
   </script>

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
							<div class="home_title">Woman</div>
							<div class="breadcrumbs">
								<ul>
									<li><a href="${contextPath}/index.jsp">Home</a></li>
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

	<!-- Product -->

	<div class="product">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="current_page">
						<ul>
							<li><a href="${contextPath}/pro/proList.do"><!-- Woman's Fashion -->상품목록</a></li>
							<li><a href="categories.html">[${productvo.productCategoryName}]</a></li>
							<li>${onePro.productName}</li>
						</ul>
					</div>
				</div>
			</div>
			<form name="frmPro" method="post" action="${contextPath}/cart/addCart.do?userId=${userId}" enctype="multipart/form-data">
			
			
			<div class="row product_row">

				<!-- Product Image -->
				
				<c:set var="onePro" value="${onePro}"/>
				<input type="hidden" name="productNo" value="${onePro.productNo}">
				<input type="hidden" name="productName" value="${onePro.productName}">
				<input type="hidden" name="productPrice" value="${onePro.productPrice}">
				<input type="hidden" name="productImage" value="${onePro.productImageName1}">
				<input type="hidden" name="productCategory" value="${onePro.productCategoryNo }">
 				<div class="col-lg-7">
					<div class="product_image">
						<div class="product_image_large">
						
						
 						<%-- <img name="productImage"  src="${contextPath}/files/product/${onePro.productNo}/${onePro.productImageName1}" style="height:40px" /> --%>
						</div>
						<div class="product_image_thumbnails d-flex flex-row align-items-start justify-content-start">
							<div class="product_image_thumbnail" style="background-image:url(${contextPath}/files/product/${onePro.productNo}/${onePro.productImageName1}" data-image="${contextPath}/images/product_image_1.jpg"></div>
							<div class="product_image_thumbnail" style="background-image:url(${contextPath}/files/product/${onePro.productNo}/${onePro.productImageName2}" data-image="${contextPath}/images/product_image_2.jpg"></div>
							<div class="product_image_thumbnail" style="background-image:url(${contextPath}/files/product/${onePro.productNo}/${onePro.productImageName3}" data-image="${contextPath}/images/product_image_4.jpg"></div>
						</div>
					</div>
				</div>

				<!-- Product Content -->
				<div class="col-lg-5">
					<div class="product_content">
						<div class="product_name">${onePro.productName}</div>
						<div class="product_price">${onePro.productPrice}</div>
						<div class="rating rating_4" data-rating="4">
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
						</div>
						<!-- In Stock -->
						<div class="in_stock_container">
							<div class="in_stock in_stock_true"></div>
							<span>in stock</span>
						</div>
						<div class="product_text">
							<p>${onePro.productInformation}</p>
						</div>
						<!-- Product Quantity -->
						<div class="product_quantity_container">
							<span>Quantity</span>
							<div class="product_quantity clearfix">
								<input name="cartQuantity" id="quantity_input" type="text" pattern="[0-9]*" value="1">
								<div class="quantity_buttons">
									<div id="quantity_inc_button" class="quantity_inc quantity_control"><i class="fa fa-caret-up" aria-hidden="true"></i></div>
									<div id="quantity_dec_button" class="quantity_dec quantity_control"><i class="fa fa-caret-down" aria-hidden="true"></i></div>
								</div>
							</div>				
						</div>
						<span>배송비</span>
							<div>
								<select name="productDelivery">
									<option value="1">주문시 결제(선결제)</option>
									<option value="2">수령시 결제(착불)</option>
								</select>
							</div>
						<!-- Product Size -->
						<div class="product_size_container">
							
							
						</div>
						<input type="submit" value="장바구니" >

							<input type=button value="목록보기"  
							onClick="backToList(this.form)">
					</div>
				</div>
			</div>
			</form>
			<!-- Reviews -->

			<div class="row">
				<div class="col">
					<div class="reviews">
						<div class="reviews_title">reviews</div>
						<div class="reviews_container">
							<ul>
								<!-- Review -->
								<li class=" review clearfix">
									<div class="review_image"><img src="${contextPath}/images/review_1.jpg" alt=""></div>
									<div class="review_content">
										<div class="review_name"><a href="#">Maria Smith</a></div>
										<div class="review_date">Nov 29, 2017</div>
										<div class="rating rating_4 review_rating" data-rating="4">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="review_text">
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis quam ipsum. Pellentesque consequat tellus non tortor tempus, id egestas elit iaculis. Proin eu dui porta, pretium metus vitae, pharetra odio. Sed ac mi commodo, pellentesque erat eget, accumsan justo. Etiam sed placerat felis. Proin non rutrum ligula. </p>
										</div>
									</div>
								</li>
								<!-- Review -->
								<li class=" review clearfix">
									<div class="review_image"><img src="${contextPath}/images/review_2.jpg" alt=""></div>
									<div class="review_content">
										<div class="review_name"><a href="#">Maria Smith</a></div>
										<div class="review_date">Nov 29, 2017</div>
										<div class="rating rating_4 review_rating" data-rating="4">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="review_text">
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis quam ipsum. Pellentesque consequat tellus non tortor tempus, id egestas elit iaculis. Proin eu dui porta, pretium metus vitae, pharetra odio. Sed ac mi commodo, pellentesque erat eget, accumsan justo. Etiam sed placerat felis. Proin non rutrum ligula. </p>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<!-- Leave a Review -->

			<div class="row">
				<div class="col">
					<div class="review_form_container">
						<div class="review_form_title">leave a review</div>
						<div class="review_form_content">
							<form action="#" id="review_form" class="review_form">
								<div class="d-flex flex-md-row flex-column align-items-start justify-content-between">
									<input type="text" class="review_form_input" placeholder="Name" required="required">
									<input type="email" class="review_form_input" placeholder="E-mail" required="required">
									<input type="text" class="review_form_input" placeholder="Subject">
								</div>
								<textarea class="review_form_text" name="review_form_text" placeholder="Message"></textarea>
								<button type="submit" class="review_form_button">leave a review</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</div>

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
<script src="${contextPath}/js/custom.js"></script>
<script src="${contextPath}/js/product_custom.js"></script>
</body>
</html>