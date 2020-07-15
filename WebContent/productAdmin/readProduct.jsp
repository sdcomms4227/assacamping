<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="productNo" value="${productMap.productVO.productNo}" />
<c:set var="productName" value="${productMap.productVO.productName}" />
<c:set var="productContent" value="${productMap.productVO.productContent}" />
<c:set var="productImageName1" value="${productMap.productVO.productImageName1}" />
<c:set var="productImageName2" value="${productMap.productVO.productImageName2}" />
<c:set var="productImageName3" value="${productMap.productVO.productImageName3}" />
<c:set var="productPrice" value="${productMap.productVO.productPrice}" />
<c:set var="productQuantity" value="${productMap.productVO.productQuantity}" />
<c:set var="productDate" value="${productMap.productVO.productDate}" />
<c:set var="productCategoryNo" value="${productMap.productVO.productCategoryNo}" />
<c:set var="productCategoryName" value="${productMap.productCategoryName}" />
<c:set var="productRating" value="${productMap.productVO.productRating}" />
<fmt:formatNumber var="productFormattedPrice" value="${productPrice}" pattern="#,###"/>
<fmt:formatDate var="productFormattedDate" value="${productDate}" pattern="yyyy-MM-dd HH:mm" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">상품 관리</h2>
	</div>
</div>

<article class="product">
	<div class="row">
		<div class="col-12 col-lg-4">
			<table class="table table-layout-fixed text-center">
				<thead>
					<tr class="bg-light">
						<th>이미지1</th>
						<th>이미지2</th>
						<th>이미지3</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<c:if test="${productImageName1!=null}">
								<div class="border">
									<img src="${contextPath}/files/product/${productNo}/${productImageName1}" alt="${productName}"/>
								</div>
							</c:if>
						</td>
						<td>
							<c:if test="${productImageName2!=null}">
								<div class="border">
									<img src="${contextPath}/files/product/${productNo}/${productImageName2}" alt="${productName}"/>
								</div>
							</c:if>
						</td>
						<td>
							<c:if test="${productImageName3!=null}">
								<div class="border">
									<img src="${contextPath}/files/product/${productNo}/${productImageName3}" alt="${productName}"/>
								</div>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-12 col-lg-8">
			<table class="table read-table table-layout-fixed">
				<colgroup>
					<col style="width:120px" />
					<col />
				</colgroup>
				<thead>
					<tr class="bg-light text-center">
						<th colspan="2">상품 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>번호</th>
						<td class="text-danger">${productNo}</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>${productCategoryName}</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>${productName}</td>
					</tr>
					<tr>
						<th>가격</th>
						<td>${productFormattedPrice}</td>
					</tr>
					<tr>
						<th>수량</th>
						<td>${productQuantity}</td>
					</tr>
					<tr>
						<th>별점</th>
						<td>
							<div class="rating rating_${productRating}" data-rating="${productRating}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
						</td>
					</tr>
					<tr>
						<th>상세정보</th>
						<td>${fn:replace(productContent,LF,BR)}</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td>${productFormattedDate}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>	
	<div class="text-center my-5">
		<button type="button" class="btn btn-secondary" onclick="listProduct()">목록</button>							
		<button type="button" class="btn btn-warning" onclick="modifyProduct(${productNo})">수정</button>
		<button type="button" class="btn btn-danger" onclick="deleteProduct(${productNo})">삭제</button>
	</div>	
</article>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
	<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo}" />
</form>

<script>
function listProduct(){
	var form = document.pagingForm;
	form.action = "${contextPath}/productAdminServlet/listProduct.do";	
	form.submit();
}
function modifyProduct(productNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/productAdminServlet/modifyProduct.do?productNo=" + productNo;
	form.submit();
}
function deleteProduct(productNo){
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/productAdminServlet/deleteProduct.do?productNo=" + productNo;
		form.submit();
	}
}
function downloadProduct(productNo, productImageName){
	var form = document.pagingForm;
	form.action = "${contextPath}/productAdminServlet/download.do?productNo=" + productNo + "&fileName=" + productImageName;
	form.submit();
}
</script>

<%@ include file="../inc/adminBottom.jsp" %>