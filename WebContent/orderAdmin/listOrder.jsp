<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<c:set var="orderList" value="${orderListMap.orderList}" />
<c:set var="totalCount" value="${orderListMap.totalCount}" />
<c:set var="beginNo" value="${(pageNo-1) - (pageNo-1)%10 + 1}" />
<c:set var="endNo" value="${beginNo + 9}" />

<div class="row mb-3 align-items-center">
	<div class="col-12 col-lg-3 mb-2 mb-lg-0">
		<h2 class="mb-0">주문 관리</h2>
	</div>
	<div class="col-12 col-lg-6 mb-2 mb-lg-0 text-center">
		<form action="${contextPath}/orderAdminServlet/listOrder.do" class="form-inline justify-content-center">
			<div class="input-group">
				<input type="search" name="searchKeyword" value="${searchKeyword}" size="24" maxlength="24" class="form-control form-control-sm" placeholder="주문자 이름">
				<div class="input-group-append">
					<button type="submit" class="btn btn-secondary btn-sm">검색</button>
				</div>
			</div>
		</form>
	</div>
</div>

<article class="order">
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
				<th>주문상태</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${totalCount==0}">
					<tr>
						<td colspan="6">등록된 주문이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="orderMap" items="${orderList}">
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
							<td class="align-middle ${orderVO.orderState eq '결제취소' ? 'text-danger' : ''}">${orderVO.orderState}</td>
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
</form>

<script>
function listProduct(pageNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/orderAdminServlet/listOrder.do";	
	form.pageNo.value = pageNo;
	form.submit();
}
function readOrder(orderNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/orderAdminServlet/readOrder.do?orderNo=" + orderNo;
	form.submit();
}
function changeOrderState(event){
	event.stopPropagation();
	alert("준비중입니다.");
}
</script>

<%@ include file="../inc/adminBottom.jsp"%>