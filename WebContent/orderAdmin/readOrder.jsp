<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">주문 관리</h2>
	</div>
</div>

<article class="order">
	<div class="row">
	
		<div class="col-12 col-lg-6">		
			<c:forEach var="orderVO" items="${orderList}" begin="0" end="0">
				<c:set var="userZipcode" value="${orderVO.userZipcode}" />
				<c:set var="userAddress1" value="${orderVO.userAddress1}" />
				<c:set var="userAddress2" value="${orderVO.userAddress2}" />
				<c:set var="userId" value="${orderVO.userId}" />
				<c:set var="productCategory" value="${orderVO.productCategory}" />
				<c:set var="userName" value="${orderVO.userName}" />
				<c:set var="userPhone" value="${orderVO.userPhone}" />
				<c:set var="userComment" value="${orderVO.userComment}" />
				<c:set var="userEmail" value="${orderVO.userEmail}" />
				<c:set var="orderDate" value="${orderVO.orderDate}" />
				<c:set var="orderState" value="${orderVO.orderState}" />
				<c:set var="orderNo" value="${orderVO.orderNo}" />
				<fmt:formatDate var="orderFormattedDate" value="${orderDate}" pattern="yyyy-MM-dd HH:mm" />	
				<table class="table read-table table-layout-fixed mb-5">
					<colgroup>
						<col style="width:120px" />
						<col />
					</colgroup>
					<thead>
						<tr>
							<th class="bg-light" colspan="2">주문 정보</th>
						</tr>
					</thead>
					<tbody>				
						<tr>
							<th>주문 번호</th>
							<td class="text-danger">${orderNo}</td>
						</tr>
						<tr>
							<th>주문일</th>
							<td>${orderFormattedDate}</td>
						</tr>
						<tr>
							<th>주문상태</th>
							<td ${orderState eq '결제취소' ? 'class="text-danger"' : ''}">${orderState}</td>
						</tr>
					</tbody>
				</table>
				<table class="table read-table table-layout-fixed mb-5">
					<colgroup>
						<col style="width:120px" />
						<col />
					</colgroup>
					<thead>
						<tr>
							<th class="bg-light" colspan="2">주문자 정보</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>이름</th>
							<td>${userName}</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${userPhone}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${userEmail}</td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td>${userZipcode}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${userAddress1}</td>
						</tr>
						<tr>
							<th>상세주소</th>
							<td>${userAddress2}</td>
						</tr>
						<tr>
							<th>남김말</th>
							<td>${userComment}</td>
						</tr>
					</tbody>
				</table>
			</c:forEach>
		</div>
				
		<div class="col-12 col-lg-6">
			<table class="table table-layout-fixed text-center mb-5">
				<colgroup>
					<col style="width:80px" />
					<col />
					<col style="width:120px" />
					<col style="width:80px" />
					<col style="width:120px" />
				</colgroup>
				<thead>
					<tr>
						<th class="bg-light">상품 번호</th>
						<th class="bg-light">상품명</th>
						<th class="bg-light">가격</th>
						<th class="bg-light">수량</th>
						<th class="bg-light">합계</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="orderVO" items="${orderList}">
						<c:set var="productNo" value="${orderVO.productNo}" />
						<c:set var="productName" value="${orderVO.productName}" />
						<c:set var="productPrice" value="${orderVO.productPrice}" />
						<c:set var="cartQuantity" value="${orderVO.cartQuantity}" />
						<fmt:formatNumber var="productFormattedPrice" value="${productPrice}" pattern="#,###"/>
						<fmt:formatNumber var="productFormattedSum" value="${productPrice * cartQuantity}" pattern="#,###"/>
						<tr>
							<td>${productNo}</td>
							<td class="text-left">${productName}</td>
							<td>${productFormattedPrice}</td>
							<td>${cartQuantity}</td>
							<td>${productFormattedSum}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<c:forEach var="orderVO" items="${orderList}" begin="0" end="0">
						<c:set var="productDelivery" value="${orderVO.productDelivery}" />
						<c:set var="productPayment" value="${orderVO.productPayment}" />
						<fmt:formatNumber var="productFormattedPayment" value="${productPayment}" pattern="#,###"/>
						<tr>
							<td class="align-middle text-left" colspan="2">
								배송비 : ${productDelivery}
							</td>
							<td class="align-middle text-right" colspan="3">
								<span class="mr-2">총 결제 금액 : </span>
								<h3 class="d-inline">${productFormattedPayment}</h3>
							</td>
						</tr>
					</c:forEach>
				</tfoot>
			</table>	
			
		</div>		
		
	</div>
	
	<div class="text-center my-5">
		<button type="button" class="btn btn-secondary" onclick="listProduct()">목록</button>
	</div>	
</article>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
</form>

<script>
function listProduct(){
	var form = document.pagingForm;
	form.action = "${contextPath}/orderAdminServlet/listOrder.do";	
	form.submit();
}
function changeOrderState(){
	alert("준비중입니다.");
}
</script>

<%@ include file="../inc/adminBottom.jsp" %>