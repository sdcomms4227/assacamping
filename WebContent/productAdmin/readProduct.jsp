<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="productNo" value="${productItemMap.productAdminVO.productNo}" />
<c:set var="productName" value="${productItemMap.productAdminVO.productName}" />
<c:set var="productInformation" value="${productItemMap.productAdminVO.productInformation}" />
<c:set var="productPrice" value="${productItemMap.productAdminVO.productPrice}" />
<c:set var="productImageName" value="${productItemMap.productAdminVO.productImageName}" />
<c:set var="productDate" value="${productItemMap.productAdminVO.productDate}" />
<c:set var="productCategoryName" value="${productItemMap.productCategoryName}" />
<c:set var="productQuantity" value="${productItemMap.productAdminVO.productQuantity}" />
<c:set var="productFileType" value="${productItemMap.productFileType}" />
<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css" />

<div class="row mb-2 align-items-center">
	<div class="col-12">
		<h2>상품 정보</h2>
	</div>
</div>

<div class="row">
	<div class="col-12">
	
		<!-- 게시판 -->
		<article>
			<div class="row">
				<div class="col-8">
					<table class="table read-table table-layout-fixed">
						<colgroup>
							<col style="width:120px" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>상품 번호</th>
								<td class="text-danger">${productNo}</td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td>${productCategoryName}</td>
							</tr>
							<tr>
								<th>상품 이름</th>
								<td>${productName}</td>
							</tr>
							<tr>
								<th>상품 가격</th>
								<td><fmt:formatNumber value="${productPrice}" pattern="#,###"/></td>
							</tr>
							<tr>
								<th>상품 수량</th>
								<td><fmt:formatNumber value="${productQuantity}" pattern="#,###"/></td>
							</tr>
							<tr>
								<th>상품 상세정보</th>
								<td>${productInformation}</td>
							</tr>
							<tr>
								<th>상품 등록일</th>
								<td><fmt:formatDate value="${productDate}" pattern="yy-MM-dd HH:mm" /></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-4">
					<div class="border">
						<img src="${contextPath}/files/product/${productNo}/${productImageName}" alt="${productName}"/>
					</div>
				</div>
			</div>
			
			<hr />
			
			<div class="text-center my-5">
				<button type="button" class="btn btn-secondary" onclick="listProduct()">목록</button>							
				<button type="button" class="btn btn-warning" onclick="modifyProduct(${productNo})">수정</button>
				<button type="button" class="btn btn-danger" onclick="deleteProduct(${productNo})">삭제</button>
			</div>			
		</article>
		<!-- // 게시판 -->
	
	</div>
</div>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
	<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo}" />
</form>

<script>
function listProduct(){
	var form = document.pagingForm;
	form.action = "${contextPath}/proadm/listProduct.do";	
	form.submit();
}
function modifyProduct(productNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/proadm/modifyProduct.do?productNo=" + productNo;
	form.submit();
}
function deleteProduct(productNo){
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/proadm/deleteProduct.do?productNo=" + productNo;
		form.submit();
	}
}
function downloadProduct(productNo, productImageName){
	var form = document.pagingForm;
	form.action = "${contextPath}/proadm/download.do?productNo=" + productNo + "&fileName=" + productImageName;
	form.submit();
}
</script>

<%@ include file="../inc/adminBottom.jsp" %>