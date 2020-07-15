<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<c:set var="reviewList" value="${reviewListMap.reviewList}" />
<c:set var="totalCount" value="${reviewListMap.totalCount}" />
<c:set var="beginNo" value="${(pageNo-1) - (pageNo-1)%10 + 1}" />
<c:set var="endNo" value="${beginNo + 9}" />

<form action="${contextPath}/reviewAdminServlet/listReview.do" class="form-block">
	<div class="row mb-3 align-items-center">
		<div class="col-12 col-lg-3 mb-2 mb-lg-0">
			<h2 class="mb-0">상품 후기</h2>		
		</div>
		<div class="col-12 col-lg-6 mb-2 mb-lg-0 text-center">
			<div class="d-inline-block">
				<div class="input-group">
					<input type="search" name="searchKeyword" value="${searchKeyword}" size="24" maxlength="24" class="form-control form-control-sm" placeholder="후기 내용">
					<div class="input-group-append">
						<button type="submit" class="btn btn-secondary btn-sm">검색</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

<article class="reviewAdmin">
	<table class="table table-hover text-center">
		<colgroup class="d-none d-lg-table-column-group">
			<col style="width: 120px" />
			<col style="width: 120px" />
			<col style="width: 120px" />
			<col style="width: 200px" />
			<col />
			<col style="width: 120px" />
			<col style="width: 120px" />
			<col style="width: 120px" />
			<col style="width: 160px" />
		</colgroup>
		<thead class="thead-light d-none d-lg-table-header-group">
			<tr>
				<th>번호</th>
				<th>상품 번호</th>
				<th>이미지</th>
				<th>상품명</th>
				<th>후기 내용</th>
				<th>별점</th>
				<th>작성자</th>
				<th>작성일</th>
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
					<c:forEach var="reviewMap" items="${reviewList}">
						<c:set var="reviewVO" value="${reviewMap.reviewVO}" />
						<c:set var="productVO" value="${reviewMap.productVO}" />
						<fmt:formatDate var="reviewFormattedDate" value="${reviewVO.reviewDate}" pattern="yyyy-MM-dd HH:mm"/>
						<tr onclick="readReview(${reviewVO.reviewNo})" class="cursor-pointer">
							<td class="align-middle">${reviewVO.reviewNo}</td>
							<td class="align-middle">${reviewVO.productNo}</td>
							<td class="align-middle"><img src="${contextPath}/files/product/${reviewVO.productNo}/${productVO.productImageName1}" alt="${productVO.productName}" style="height: 40px" /></td>
							<td class="align-middle wbka">${productVO.productName}</td>
							<td class="align-middle text-left">${reviewVO.reviewContent}</td>
							<td class="align-middle">
								<div class="rating rating_${reviewVO.starRating}" data-rating="${reviewVO.starRating}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</td>
							<td class="align-middle">${reviewVO.userName}</td>
							<td class="align-middle">${reviewFormattedDate}</td>
							<td class="align-middle">
								<button type="button" class="btn btn-danger btn-sm" onclick="deleteReview(${reviewVO.reviewNo}, ${reviewVO.productNo}, event)">삭제</button>
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
						<button type="button" class="page-link" onclick="listReview(${beginNo-10})">이전</button>
					</li>
				</c:if>
				<c:forEach var="page" begin="${beginNo}" end="${endNo}" step="1">
					<c:if test="${page <= Math.ceil(totalCount/10)}">
						<c:choose>	
							<c:when test="${page==pageNo}">
								<li class="page-item active">
									<button type="button" class="page-link" onclick="listReview(${page})">${page}</button>						
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<button type="button" class="page-link" onclick="listReview(${page})">${page}</button>							
								</li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>								
				<c:if test="${totalCount > endNo*10}">						
				   	<li class="page-item">
						<button type="button" class="page-link" onclick="listReview(${beginNo+10})">다음</button>
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
function listReview(pageNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/reviewAdminServlet/listReview.do";	
	form.pageNo.value = pageNo;
	form.submit();
}
function readReview(reviewNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/reviewAdminServlet/readReview.do?reviewNo=" + reviewNo;
	form.submit();
}
function deleteReview(reviewNo, productNo, event){
	event.stopPropagation();
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/reviewAdminServlet/deleteReview.do?reviewNo=" + reviewNo + "&productNo=" + productNo;
		form.submit();
	}
}
</script>

<%@ include file="../inc/adminBottom.jsp"%>