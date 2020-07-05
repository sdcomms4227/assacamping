<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<header class="header">
	<div class="header_inner d-flex flex-row align-items-center justify-content-start">
		<div class="logo"><a href="${contextPath}">ASSA</a></div>
		<nav class="main_nav">
			<ul>
				<li><a href="${contextPath}/pro/listProduct.do">캠핑상품</a></li>
				<li><a href="${contextPath}/camp/listCamping.do">캠핑정보</a></li>
				<li><a href="${contextPath}/center/contact.jsp">고객센터</a></li>
				<li><a href="#">추가메뉴</a></li>
			</ul>
		</nav>
		<div class="header_content ml-auto">
			<div class="search header_search">
				<form name="productSearch" action="${contextPath}/pro/listProduct.do" method="post">
					<div class="search_input">
						<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo}" />
						<input type="hidden" name="sortType" value="${sortType}" />
						<input type="search" name="searchKeyword" value="${searchKeyword}">
						<button type="submit" id="search_button" class="search_button"><img src="${contextPath}/images/magnifying-glass.svg" alt=""></button>
					</div>
				</form>
			</div>
			<div class="shopping">
				<!-- Cart -->
				<a class="shopping_a" href="${contextPath}/cart/cart.do">
					<div class="cart">
						<img src="${contextPath}/images/shopping-bag.svg" alt="">
						<div class="cart_num_container">
							<div class="cart_num_inner">
								<div class="cart_num">1</div>
							</div>
						</div>
					</div>
				</a>
				<!-- Star -->
				<a class="shopping_a" href="javascript:alert('준비중입니다')">
					<div class="star">
						<img src="${contextPath}/images/star.svg" alt="">
						<div class="star_num_container">
							<div class="star_num_inner">
								<div class="star_num">0</div>
							</div>
						</div>
					</div>
				</a>
				<c:choose>
					<c:when test="${userId!=null}">					
						<div class="d-inline-block position-relative">
							<a class="shopping_a" id="loggedDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<div class="avatar">
									<img src="${contextPath}/images/avatar.svg" alt="">
									<div class="avatar_name_container">
										<div class="avatar_name_inner">
											<div class="avatar_name">${userId}</div>
										</div>
									</div>
								</div>
							</a>
							<div class="dropdown-menu dropdown-menu-lg-right" aria-labelledby="loggedDropdown">								
								<a class="dropdown-item" href="${contextPath}/cartorder/orderList.do">나의 주문 내역</a>
								<hr />
								<a class="dropdown-item" href="${contextPath}/userCon/modUserForm.do?userId=${userId}">회원정보수정</a>
								<a class="dropdown-item" href="javascript:alert('준비중입니다.')">비밀번호변경</a>
								<a class="dropdown-item" href="javascript:alert('준비중입니다.')">회원탈퇴</a>
								<a class="dropdown-item" href="${contextPath}/userCon/logout.do">로그아웃</a>
								<c:if test='${userId=="admin"}'>
									<hr />
									<a class="dropdown-item" href="${contextPath}/adm/admin.do">관리자모드</a>
								</c:if>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<a class="shopping_a" href="${contextPath}/userCon/login.do">
							<div class="avatar">
								<img src="${contextPath}/images/avatar.svg" alt="">
							</div>
						</a>
					</c:otherwise>
				</c:choose>
				<c:if test="${userId!=null}">
				</c:if>
			</div>
		</div>

		<div class="burger_container d-flex flex-column align-items-center justify-content-around menu_mm"><div></div><div></div><div></div></div>
	</div>
</header>