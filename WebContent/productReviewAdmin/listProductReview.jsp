<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<c:set var="productReviewList" value="${productReviewListMap.productReviewList}" />
<c:set var="totalCount" value="${productReviewListMap.totalCount}" />
<c:set var="beginNo" value="${(pageNo-1) - (pageNo-1)%10 + 1}" />
<c:set var="endNo" value="${beginNo + 9}" />

<form action="${contextPath}/proReviewAdm/listProductReview.do" class="form-block">
	<div class="row mb-3 align-items-center">
		<div class="col-12 col-lg-3 mb-2 mb-lg-0">
			<h2 class="mb-0">상품 후기</h2>		
		</div>
		<div class="col-12 col-lg-9 mb-2 mb-lg-0 text-center">
			<div class="d-inline-block">
				<div class="input-group">
					<input type="search" name="searchKeyword" value="${searchKeyword}" size="24" maxlength="24" class="form-control form-control-sm">
					<div class="input-group-append">
						<button type="submit" class="btn btn-secondary btn-sm">검색</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

<article class="productReview">
	<table class="table table-hover text-center">
		<colgroup class="d-none d-lg-table-column-group">
			<col style="width: 80px" />
			<col style="width: 80px" />
			<col style="width: 100px" />
			<col style="width: 100px" />
			<col />
			<col style="width: 100px" />
			<col style="width: 100px" />
			<col style="width: 100px" />
			<col style="width: 140px" />
		</colgroup>
		<thead class="thead-light d-none d-lg-table-header-group">
			<tr>
				<th>후기번호</th>
				<th>상품번호</th>
				<th>이미지</th>
				<th>상품명</th>
				<th>후기내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>별점</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>			
			<c:choose>
				<c:when test="${totalCount==0}">			
					<tr>
						<td colspan="9">등록된 후기가 없습니다.</td>
					</tr>
				</c:when>	
				<c:otherwise>
					<c:forEach var="productReviewMap" items="${productReviewList}">
						<c:set var="productReviewVO" value="${productReviewMap.productReviewVO}" />
						<c:set var="productVO" value="${productReviewMap.productVO}" />
						<fmt:formatDate var="reviewFmtDate" value="${productReviewVO.reviewDate}" pattern="yyyy-MM-dd HH:mm"/>
						<tr onclick="readProductReview(${productReviewVO.reviewNo})" style="cursor:pointer">
							<td class="align-middle">${productReviewVO.reviewNo}</td>
							<td class="align-middle">${productReviewVO.productNo}</td>
							<td class="align-middle"><img src="${contextPath}/files/product/${productReviewVO.productNo}/${productVO.productImageName1}" alt="${productVO.productName}" style="height: 40px" /></td>
							<td class="align-middle">${productVO.productName}</td>
							<td class="align-middle text-left">${productReviewVO.reviewContent}</td>
							<td class="align-middle">${productReviewVO.userId}</td>
							<td class="align-middle">${reviewFmtDate}</td>
							<td class="align-middle">${productReviewVO.starRating}</td>
							<td class="align-middle">
								<button type="button" class="btn btn-danger btn-sm" onclick="deleteProductReview(${productReviewVO.reviewNo}, event)">삭제</button>
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
						<button type="button" class="page-link" onclick="listProductReview(${beginNo-10})">이전</button>
					</li>
				</c:if>
				<c:forEach var="page" begin="${beginNo}" end="${endNo}" step="1">
					<c:if test="${page <= Math.ceil(totalCount/10)}">
						<c:choose>	
							<c:when test="${page==pageNo}">
								<li class="page-item active">
									<button type="button" class="page-link" onclick="listProductReview(${page})">${page}</button>						
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<button type="button" class="page-link" onclick="listProductReview(${page})">${page}</button>							
								</li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>								
				<c:if test="${totalCount > endNo*10}">						
				   	<li class="page-item">
						<button type="button" class="page-link" onclick="listProductReview(${beginNo+10})">다음</button>
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
</form>

<script>
function listProductReview(pageNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/proReviewAdm/listProductReview.do";	
	form.pageNo.value = pageNo;
	form.submit();
}
function readProductReview(reviewNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/proReviewAdm/readProductReview.do?reviewNo=" + reviewNo;
	form.submit();
}
function deleteProductReview(reviewNo, event){
	event.stopPropagation();
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/proReviewAdm/deleteProductReview.do?reviewNo=" + reviewNo;
		form.submit();
	}
}
</script>

<%@ include file="../inc/adminBottom.jsp"%>