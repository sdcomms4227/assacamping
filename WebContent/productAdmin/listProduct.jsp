<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<c:set var="productList" value="${productListMap.productList}" />
<c:set var="totalCount" value="${productListMap.totalCount}" />
<c:set var="beginNo" value="${(pageNo-1) - (pageNo-1)%10 + 1}" />
<c:set var="endNo" value="${beginNo + 9}" />

<div class="row mb-3 align-items-center">
	<div class="col-12 col-lg-3 mb-2 mb-lg-0">
		<h2 class="mb-0">상품 관리</h2>
	</div>
	<div class="col-12 col-lg-6 mb-2 mb-lg-0 text-center">
		<form action="${contextPath}/productAdminServlet/listProduct.do" class="form-inline justify-content-center">
			<div class="input-group mb-2 mb-sm-0 mr-sm-2">
				<select class="form-control form-control-sm categorySelect" name="searchCategoryNo" onchange="this.form.submit()">
					<option value="0">전체보기</option>
					<c:forEach var="category" items="${productCategoryList}">
						<c:choose>
							<c:when test="${category.productCategoryNo==searchCategoryNo}">
								<option value="${category.productCategoryNo}" selected>${category.productCategoryName}</option>
							</c:when>
							<c:otherwise>
								<option value="${category.productCategoryNo}">${category.productCategoryName}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>
			<div class="input-group">
				<input type="search" name="searchKeyword" value="${searchKeyword}" size="24" maxlength="24" class="form-control form-control-sm" placeholder="상품명">
				<div class="input-group-append">
					<button type="submit" class="btn btn-secondary btn-sm">검색</button>
				</div>
			</div>
		</form>
	</div>
	<div class="col-12 col-lg-3 text-right">
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${contextPath}/productAdminServlet/addProduct.do'">상품 등록</button>
		<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${contextPath}/productCategoryServlet/listProductCategory.do'">카테고리 관리</button>
	</div>
</div>

<article class="product">
	<table class="table table-hover text-center">
		<colgroup>
			<col style="width: 120px" />
			<col style="width: 160px" />
			<col style="width: 120px" />
			<col />
			<col style="width: 120px" />
			<col style="width: 120px" />
			<col style="width: 120px" />
			<col style="width: 120px" />
			<col style="width: 160px" />
		</colgroup>
		<thead class="thead-light">
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<th>이미지</th>
				<th>상품명</th>
				<th>가격</th>
				<th>수량</th>
				<th>별점</th>
				<th>등록일</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${totalCount==0}">
					<tr>
						<td colspan="9">등록된 상품이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="productMap" items="${productList}">
						<c:set var="productVO" value="${productMap.productVO}" />
						<c:set var="productCategoryName" value="${productMap.productCategoryName}" />
						<fmt:formatNumber var="productFmtPrice" value="${productVO.productPrice}" pattern="#,###" />
						<fmt:formatDate var="productFormattedDate" value="${productVO.productDate}" pattern="yyyy-MM-dd HH:mm"/>
						<tr onclick="readProduct(${productVO.productNo})" style="cursor: pointer">
							<td class="align-middle">${productVO.productNo}</td>
							<td class="align-middle wbka">${productCategoryName}</td>
							<td class="align-middle"><img src="${contextPath}/files/product/${productVO.productNo}/${productVO.productImageName1}" alt="${productVO.productName}" style="height: 40px" /></td>
							<td class="align-middle text-left">${productVO.productName}</td>
							<td class="align-middle">${productFmtPrice}</td>
							<td class="align-middle">${productVO.productQuantity}</td>
							<td class="align-middle">
								<div class="rating rating_${productVO.productRating}" data-rating="${productVO.productRating}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</td>
							<td class="align-middle">${productFormattedDate}</td>
							<td class="align-middle">
								<button type="button" class="btn btn-warning btn-sm" onclick="modifyProduct(${productVO.productNo}, event)">수정</button>
								<button type="button" class="btn btn-danger btn-sm" onclick="deleteProduct(${productVO.productNo}, event)">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>

	<c:if test="${totalCount != null}">
		<div class="row">
			<div class="col-12">
				<ul class="pagination justify-content-center">
					<c:if test="${pageNo > 10}">
						<li class="page-item">
							<button type="button" class="page-link" onclick="listProduct(${beginNo-10})">이전</button>
						</li>
					</c:if>
					<c:forEach var="page" begin="${beginNo}" end="${endNo}" step="1">
						<c:if test="${page <= Math.ceil(totalCount/10)}">
							<c:choose>
								<c:when test="${page==pageNo}">
									<li class="page-item active">
										<button type="button" class="page-link" onclick="listProduct(${page})">${page}</button>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<button type="button" class="page-link" onclick="listProduct(${page})">${page}</button>
									</li>
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
					<c:if test="${totalCount > endNo*10}">
						<li class="page-item">
							<button type="button" class="page-link" onclick="listProduct(${beginNo+10})">다음</button>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</c:if>
</article>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
	<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo}" />
</form>

<script>
function listProduct(pageNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/productAdminServlet/listProduct.do";	
	form.pageNo.value = pageNo;
	form.submit();
}
function readProduct(productNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/productAdminServlet/readProduct.do?productNo=" + productNo;
	form.submit();
}
function modifyProduct(productNo, event){
	event.stopPropagation();
	var form = document.pagingForm;
	form.action = "${contextPath}/productAdminServlet/modifyProduct.do?productNo=" + productNo;
	form.submit();
}
function deleteProduct(productNo, event){
	event.stopPropagation();
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/productAdminServlet/deleteProduct.do?productNo=" + productNo;
		form.submit();
	}
}
</script>

<%@ include file="../inc/adminBottom.jsp"%>