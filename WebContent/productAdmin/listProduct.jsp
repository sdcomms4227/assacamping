<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="productList" value="${productListMap.productList}" />
<c:set var="totalCount" value="${productListMap.totalCount}" />
<c:set var="beginNo" value="${(pageNo-1) - (pageNo-1)%10 + 1}" />
<c:set var="endNo" value="${beginNo + 9}" />
<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css" />
<div class="row mb-2">
	<div class="col-3">
		<h2>상품 관리</h2>
	</div>
	<div class="col-6">
		<form action="${contextPath}/proadm/listProduct.do" class="form-inline justify-content-center justify-content-lg-start">
			<div class="input-group mb-2 mb-sm-0 mr-sm-2">
				<select class="form-control" name="searchCategoryNo" onchange="this.form.submit()">
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
				<input type="search" name="searchKeyword" value="${searchKeyword}" size="24" maxlength="24" class="form-control">
				<div class="input-group-append">
					<button type="submit" class="btn btn-secondary">검색</button>
				</div>
			</div>
		</form>
	</div>
	<div class="col-3 text-right">
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${contextPath}/proadm/writeProduct.do'">상품등록</button>
		<a href="${contextPath}/proCategory/listProductCategory.do" class="btn btn-secondary btn-sm">카테고리 관리</a>
	</div>
</div>

<!-- Product -->
<div class="row">
	<div class="col-12">
		<article class="mt-3">
			<table class="table table-hover text-center">
				<colgroup>
					<col style="width:80px"/>
					<col style="width:160px"/>
					<col />
					<col style="width:100px"/>
					<col style="width:100px"/>
					<col style="width:100px"/>
				</colgroup>
				<thead class="thead-light">
					<tr>
						<th>번호</th>
						<th>카테고리</th>
						<th>이름</th>
						<th>가격</th>
						<th>수량</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					
			<c:choose>
				<c:when test="${totalCount==0}">			
						<tr>
							<td colspan="6">등록된 상품이 없습니다.</td>
						</tr>
				</c:when>	
				<c:otherwise>
					<c:forEach var="productMap" items="${productList}">
						<c:set var="productVO" value="${productMap.productVO}" />
						<c:set var="productCategoryName" value="${productMap.productCategoryName}" />
						<tr onclick="readProduct(${productVO.productNo})" style="cursor:pointer">
							<td class="align-middle">${productVO.productNo}</td>
							<td class="align-middle wbka">${productCategoryName}</td>
							<td class="text-left">
								<img src="${contextPath}/files/product/${productVO.productNo}/${productVO.productImageName}" alt="${productVO.productName}" style="height:40px" />
								${productVO.productName}
							</td>
							<td class="align-middle"><fmt:formatNumber value="${productVO.productPrice}" pattern="#,###"/></td>
							<td class="align-middle">${productVO.productQuantity}</td>
							<td class="align-middle"><fmt:formatDate value="${productVO.productDate}" pattern="yy-MM-dd"/></td>
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
								<button type="button" class="page-link" onclick="listProduct(${beginNo+10})">이전</button>
							</li>
						</c:if>
						</ul>
					</div>
				</div>
			</c:if>
		</article>
	</div>
</div>
	
<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
	<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo}" />
</form>

<script>
function listProduct(pageNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/proadm/listProduct.do";	
	form.pageNo.value = pageNo;
	form.submit();
}

function readProduct(productNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/proadm/readProduct.do?productNo=" + productNo;
	form.submit();
}
</script>

<%@ include file="../inc/adminBottom.jsp" %>