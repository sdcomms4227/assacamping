<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>

<header class="header">
	<div class="header_inner d-flex flex-row align-items-center justify-content-start">
		<div class="logo"><a href="${contextPath}"><img src="${contextPath}/images/logo.jpg" alt="ASSA Camping" /></a></div>
		<nav class="main_nav">
			<ul>
				<li><a href="${contextPath}/productServlet/listProduct.do">캠핑상품</a></li>
				<li><a href="${contextPath}/campingServlet/listCamping.do">캠핑정보</a></li>
				<li><a href="${contextPath}/eventServlet/listEvent.do"">이벤트</a></li>
				<li><a href="${contextPath}/contactServlet/contact.do">고객센터</a></li>
			</ul>
		</nav>
		<div class="header_content ml-auto">
			<div class="search header_search">
				<form name="headerSearch" action="${contextPath}/productServlet/listProduct.do" method="post">
					<div class="search_input">
						<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo!=null?searchCategoryNo:0}" />
						<input type="hidden" name="sortType" value="${sortType}" />
						<input type="search" name="searchKeyword" value="${searchKeyword}">
						<button type="submit" id="search_button" class="search_button"><img src="${contextPath}/images/magnifying-glass.svg" alt=""></button>
					</div>
				</form>
			</div>
			<div class="shopping">
				<!-- Cart -->				
				<c:choose>
					<c:when test="${sessionScope.userId!=null}">				
						<a class="shopping_a" href="${contextPath}/cartServlet/cart.do">
							<div class="cart">
								<img src="${contextPath}/images/shopping-bag.svg" alt="">
								<c:if test="${sessionScope.cartCount != null}">
									<div class="cart_num_container">
										<div class="cart_num_inner">
											<div class="cart_num">${sessionScope.cartCount}</div>
										</div>
									</div>
								</c:if>
							</div>
						</a>
					</c:when>
					<c:otherwise>				
						<a class="shopping_a" href="javascript:alert('로그인 후  장바구니를 사용할 수 있습니다.');location.href='${contextPath}/userServlet/login.do'">
							<div class="cart">
								<img src="${contextPath}/images/shopping-bag.svg" alt="">
							</div>
						</a>
					</c:otherwise>
				</c:choose>
				
				<!-- Star -->				
				<c:choose>
					<c:when test="${sessionScope.userId!=null}">
						<a class="shopping_a" href="${contextPath}/wishListServlet/wishList.do">
							<div class="star">
								<img src="${contextPath}/images/star.svg" alt="">
 								<c:if test="${sessionScope.wishCount != null}">
									<div class="star_num_container">
										<div class="star_num_inner">
											<div class="star_num">${sessionScope.wishCount}</div>
										</div>
									</div>
								</c:if>
							</div>
						</a>
					</c:when>
					<c:otherwise>
						<a class="shopping_a" href="javascript:alert('로그인 후  위시리스트를 사용할 수 있습니다.');location.href='${contextPath}/userServlet/login.do'">
							<div class="star">
								<img src="${contextPath}/images/star.svg" alt="">
							</div>
						</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${sessionScope.userId!=null}">					
						<div class="d-inline-block position-relative">
							<a class="shopping_a" id="loggedDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<div class="avatar">
									<img src="${contextPath}/images/avatar.svg" alt="">
									<div class="avatar_name_container">
										<div class="avatar_name_inner">
											<div class="avatar_name">${sessionScope.userName}</div>
										</div>
									</div>
								</div>
							</a>
							<div class="dropdown-menu dropdown-menu-lg-right" aria-labelledby="loggedDropdown">
								<a class="dropdown-item" href="${contextPath}/orderServlet/myOrderList.do">나의 주문 내역</a>
								<hr />
								<a class="dropdown-item" href="${contextPath}/userServlet/userPwCheck.do?userId=${userId}">회원정보수정</a>
								<a class="dropdown-item" href="${contextPath}/userServlet/changePw.do?userId=${userId}">비밀번호수정</a>
								<a class="dropdown-item" href="${contextPath}/userServlet/withdrawal.do?userId=${userId}">회원탈퇴</a>
								<hr />
								<a class="dropdown-item" href="${contextPath}/userServlet/logout.do">로그아웃</a>
								<c:if test='${userId=="admin"}'>
									<hr />
									<a class="dropdown-item text-danger" href="${contextPath}/adminServlet/admin.do">관리자모드</a>
								</c:if>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<a class="shopping_a" href="${contextPath}/userServlet/login.do">
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