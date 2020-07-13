<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="productNo" value="${qnaVO.productNo}" />
<c:set var="qnaNo" value="${qnaVO.qnaNo}" />
<c:set var="qnaContent" value="${qnaVO.qnaContent}" />
<c:set var="userId" value="${qnaVO.userId}" />
<c:set var="userName" value="${qnaVO.userName}" />
<c:set var="qnaDate" value="${qnaVO.qnaDate}" />
<c:set var="qnaAnswer" value="${qnaVO.qnaAnswer}" />
<c:set var="qnaAnswerDate" value="${qnaVO.qnaAnswerDate}" />
<c:set var="productImageName1" value="${productVO.productImageName1}" />
<c:set var="productName" value="${productVO.productName}" />
<fmt:formatDate var="qnaFormattedDate" value="${qnaDate}" pattern="yyyy-MM-dd HH:mm" />
<fmt:formatDate var="qnaFormattedAnswerDate" value="${qnaAnswerDate}" pattern="yyyy-MM-dd HH:mm" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">상품 문의</h2>
	</div>
</div>

<article class="qnaAdmin">
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
						<th class="bg-light text-center" colspan="2">문의 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="align-middle">문의 번호</th>
						<td class="text-danger">${qnaNo}</td>
					</tr>
					<tr>
						<th class="align-middle">작성자</th>
						<td>${userName}</td>
					</tr>
					<tr>
						<th class="align-middle">문의 내용</th>
						<td>${fn:replace(qnaContent,LF,BR)}</td>
					</tr>
					<tr>
						<th class="align-middle">작성일</th>
						<td>${qnaFormattedDate}</td>
					</tr>
					<tr>
						<th class="align-middle">답변 내용</th>
						<td>
							<c:choose>
								<c:when test="${qnaAnswer != null}">
									${fn:replace(qnaAnswer,LF,BR)}				
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-warning btn-sm" onclick="answerQna(${qnaNo})">답변하기</button>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<c:if test="${qnaAnswer != null}">
						<tr>
							<th class="align-middle">답변일</th>
							<td>${qnaFormattedAnswerDate}</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
	<div class="text-center my-5">
		<button type="button" class="btn btn-secondary" onclick="listQna()">목록</button>							
		<button type="button" class="btn btn-warning" onclick="answerQna(${qnaNo})">답변하기</button>
		<button type="button" class="btn btn-danger" onclick="deleteQna(${qnaNo})">삭제</button>
	</div>
</article>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
	<input type="hidden" name="answerCheck" value="${answerCheck}" />
</form>

<script>
function listQna(){
	var form = document.pagingForm;
	form.action = "${contextPath}/qnaAdminServlet/listQna.do";	
	form.submit();
}
function answerQna(qnaNo){
	event.stopPropagation();
	var form = document.pagingForm;
	form.action = "${contextPath}/qnaAdminServlet/answerQna.do?qnaNo=" + qnaNo;
	form.submit();
}
function deleteQna(qnaNo){
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/qnaAdminServlet/deleteQna.do?qnaNo=" + qnaNo;
		form.submit();
	}
}
</script>

<%@ include file="../inc/adminBottom.jsp" %>