<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="productNo" value="${reviewVO.productNo}" />
<c:set var="reviewNo" value="${reviewVO.reviewNo}" />
<c:set var="reviewContent" value="${reviewVO.reviewContent}" />
<c:set var="userId" value="${reviewVO.userId}" />
<c:set var="userName" value="${reviewVO.userName}" />
<c:set var="reviewDate" value="${reviewVO.reviewDate}" />
<c:set var="starRating" value="${reviewVO.starRating}" />
<c:set var="productImageName1" value="${productVO.productImageName1}" />
<c:set var="productName" value="${productVO.productName}" />
<fmt:formatDate var="reviewFormattedDate" value="${reviewDate}" pattern="yyyy-MM-dd HH:mm" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">상품 후기</h2>
	</div>
</div>

<article class="reviewAdmin">
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
					<tr>
						<td class="text-center" colspan="2">
							<a class="btn btn-sm btn-info" href="${contextPath}/productAdminServlet/readProduct.do?productNo=${productNo}">상품정보 바로가기</a>
						</td>
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
						<td>${reviewFormattedDate}</td>
					</tr>
					<tr>
						<th class="align-middle">별점</th>
						<td>
							<div class="rating rating_${starRating}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="text-center my-5">
		<button type="button" class="btn btn-secondary" onclick="listReview()">목록</button>
		<button type="button" class="btn btn-danger" onclick="deleteReview(${reviewNo}, ${productNo})">삭제</button>
	</div>
</article>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
</form>

<script>
function listReview(){
	var form = document.pagingForm;
	form.action = "${contextPath}/reviewAdminServlet/listReview.do";	
	form.submit();
}
function deleteReview(reviewNo, productNo){
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/reviewAdminServlet/deleteReview.do?reviewNo=" + reviewNo + "&productNo=" + productNo;
		form.submit();
	}
}
</script>

<%@ include file="../inc/adminBottom.jsp" %>