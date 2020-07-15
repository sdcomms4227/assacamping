<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>

<div class="row mb-3 align-items-center">
	<div class="col-12 col-lg-3 mb-2 mb-lg-0">
		<h2 class="mb-0">대시보드</h2>
	</div>
</div>

<section class="dashBoard pt-5">
	<div class="row">
		<div class="col-6">
			<article class="order">
				<div class="row pb-2">
					<div class="col-6">
						<h5>최근 등록된 주문</h5>
					</div>
					<div class="col-6 text-right">
						<a class="btn btn-sm btn-secondary" href="${contextPath}/orderAdminServlet/listOrder.do">주문 관리 바로가기</a>
					</div>
				</div>
				<table class="table table-hover text-center">
					<colgroup>
						<col style="width: 120px" />
						<col />
						<col style="width: 120px" />
						<col style="width: 120px" />
						<col style="width: 120px" />
						<col style="width: 160px" />
					</colgroup>
					<thead class="thead-light">
						<tr>
							<th>번호</th>
							<th>상품명</th>
							<th>가격</th>
							<th>주문자 이름</th>
							<th>주문일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${totalCount==0}">
								<tr>
									<td colspan="5">등록된 주문이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="orderMap" items="${orderList}" end="10">
									<c:set var="orderVO" value="${orderMap.orderVO}" />
									<c:set var="cnt" value="${orderMap.cnt - 1}" />
									<fmt:formatNumber var="productFmtPayment" value="${orderVO.productPayment}" pattern="#,###" />
									<fmt:formatDate var="productFormattedDate" value="${orderVO.orderDate}" pattern="yyyy-MM-dd HH:mm"/>
									<tr onclick="readOrder(${orderVO.orderNo})" style="cursor: pointer">
										<td class="align-middle">${orderVO.orderNo}</td>
										<td class="align-middle text-left">
											${orderVO.productName}
											<c:if test="${cnt > 0}">
												<span class="text-danger">외 ${cnt}개</span>
											</c:if>
										</td>
										<td class="align-middle">${productFmtPayment}</td>
										<td class="align-middle">${orderVO.userName}</td>
										<td class="align-middle">${productFormattedDate}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</article>
		</div>
		<div class="col-6">
			<article class="product">
				<div class="row pb-2">
					<div class="col-6">
						<h5>최근 등록된 상품</h5>
					</div>
					<div class="col-6 text-right">
						<a class="btn btn-sm btn-secondary" href="${contextPath}/productAdminServlet/listProduct.do">상품 관리 바로가기</a>
					</div>
				</div>
				<table class="table table-hover text-center">
					<colgroup>
						<col style="width: 120px" />
						<col style="width: 160px" />
						<col style="width: 120px" />
						<col />
						<col style="width: 120px" />
						<col style="width: 120px" />
						<col style="width: 120px" />
					</colgroup>
					<thead class="thead-light">
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>이미지</th>
							<th>상품명</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${totalCount==0}">
								<tr>
									<td colspan="5">등록된 상품이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="productMap" items="${productList}" end="4">
									<c:set var="productVO" value="${productMap.productVO}" />
									<c:set var="productCategoryName" value="${productMap.productCategoryName}" />
									<fmt:formatDate var="productFormattedDate" value="${productVO.productDate}" pattern="yyyy-MM-dd HH:mm"/>
									<tr onclick="readProduct(${productVO.productNo})" style="cursor: pointer">
										<td class="align-middle">${productVO.productNo}</td>
										<td class="align-middle wbka">${productCategoryName}</td>
										<td class="align-middle"><img src="${contextPath}/files/product/${productVO.productNo}/${productVO.productImageName1}" alt="${productVO.productName}" style="height: 40px" /></td>
										<td class="align-middle text-left">${productVO.productName}</td>
										<td class="align-middle">${productFormattedDate}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</article>
		
			<article class="user mt-5">
				<div class="row pb-2">
					<div class="col-6">
						<h5>최근 가입한 회원</h5>
					</div>
					<div class="col-6 text-right">
						<a class="btn btn-sm btn-secondary" href="${contextPath}/userAdminServlet/listUser.do">회원 관리 바로가기</a>
					</div>
				</div>
				<table class="table table-hover text-center">
					<colgroup class="d-none d-lg-table-column-group">
						<col style="width: 120px" />
						<col style="width: 120px" />
						<col style="width: 120px" />
						<col />
						<col style="width: 120px" />
						<col style="width: 120px" />
					</colgroup>
					<thead class="thead-light d-none d-lg-table-header-group">
						<tr>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>회원상태</th>
							<th>가입일</th>
						</tr>
					</thead>
					<tbody>			
						<c:choose>
							<c:when test="${totalCount==0}">			
								<tr>
									<td colspan="7">등록된 회원이 없습니다.</td>
								</tr>
							</c:when>	
							<c:otherwise>
								<c:forEach var="userVO" items="${userList}" end="2">
									<fmt:formatDate var="userFormattedDate" value="${userVO.userDate}" pattern="yyyy-MM-dd HH:mm"/>
									<tr onclick="readUser('${userVO.userId}')" class="cursor-pointer">
										<td class="align-middle">${userVO.userId}</td>
										<td class="align-middle">${userVO.userPw}</td>
										<td class="align-middle">${userVO.userName}</td>
										<td class="align-middle">${userVO.userPhone}</td>
										<td class="align-middle">							
											<c:choose>
												<c:when test="${userVO.userUse==1}">
													<span>일반회원</span>
												</c:when>
												<c:otherwise>
													<span class="text-danger">탈퇴회원</span>
												</c:otherwise>
											</c:choose>
										</td>
										<td class="align-middle">${userFormattedDate}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</article>
		</div>
	</div>
</section>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="1" />
	<input type="hidden" name="searchKeyword" value="" />
	<input type="hidden" name="searchCategoryNo" value="0" />
</form>

<script>
function readOrder(orderNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/orderAdminServlet/readOrder.do?orderNo=" + orderNo;
	form.submit();
}
function readProduct(productNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/productAdminServlet/readProduct.do?productNo=" + productNo;
	form.submit();
}
function readUser(userId){
	var form = document.pagingForm;
	form.action = "${contextPath}/userAdminServlet/readUser.do?userId=" + userId;
	form.submit();
}
</script>
<%@ include file="../inc/adminBottom.jsp" %>