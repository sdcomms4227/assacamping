<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="productNo" value="${productReviewVO.productNo}" />
<c:set var="reviewNo" value="${productReviewVO.reviewNo}" />
<c:set var="reviewContent" value="${productReviewVO.reviewContent}" />
<c:set var="userId" value="${productReviewVO.userId}" />
<c:set var="userName" value="${productReviewVO.userName}" />
<c:set var="reviewDate" value="${productReviewVO.reviewDate}" />
<c:set var="starRating" value="${productReviewVO.starRating}" />
<c:set var="productImageName1" value="${productVO.productImageName1}" />
<c:set var="productName" value="${productVO.productName}" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">상품 후기</h2>
	</div>
</div>

<article class="productReview">
	<div class="row">
		<div class="col-12 col-lg-4 col-xl-3">
			<table class="table read-table table-layout-fixed">
				<colgroup>
					<col style="width:120px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th class="bg-light text-center" colspan="2">상품 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="text-center" colspan="2"><img src="${contextPath}/files/product/${productNo}/${productImageName1}" alt="${productName}" style="height: 200px" /></td>
					</tr>
					<tr>
						<th class="align-middle">상품 번호</th>
						<td>${productNo}</td>
					</tr>
					<tr>
						<th class="align-middle">상품명</th>
						<td>${productName}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-12 col-lg-8 col-xl-9">
			<table class="table read-table table-layout-fixed">
				<colgroup>
					<col style="width:120px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th class="bg-light text-center" colspan="2">후기 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="align-middle">후기 번호</th>
						<td class="text-danger">${reviewNo}</td>
					</tr>
					<tr>
						<th class="align-middle">작성자</th>
						<td>${userName}</td>
					</tr>
					<tr>
						<th class="align-middle">내용</th>
						<td>${fn:replace(reviewContent,LF,BR)}</td>
					</tr>
					<tr>
						<th class="align-middle">작성일</th>
						<td><fmt:formatDate value="${reviewDate}" pattern="yyyy-MM-dd HH:mm" /></td>
					</tr>
					<tr>
						<th class="align-middle">별점</th>
						<td>${starRating}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="text-center my-5">
		<button type="button" class="btn btn-secondary" onclick="listProductReview()">목록</button>
		<button type="button" class="btn btn-danger" onclick="deleteProductReview(${reviewNo})">삭제</button>
	</div>			
</article>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
</form>

<script>
function listProductReview(){
	var form = document.pagingForm;
	form.action = "${contextPath}/proReviewAdm/listProductReview.do";	
	form.submit();
}
function deleteProductReview(reviewNo){
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/proReviewAdm/deleteProductReview.do?reviewNo=" + reviewNo;
		form.submit();
	}
}
</script>

<%@ include file="../inc/adminBottom.jsp" %>