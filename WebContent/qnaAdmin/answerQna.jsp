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
		<h2 class="mb-0">상품 문의 답변하기</h2>
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
			<form action="${contextPath}/qnaAdminServlet/updateQna.do" method="post">
				<input type="hidden" name="pageNo" value="${pageNo}" />
				<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
				<input type="hidden" name="answerCheck" value="${answerCheck}" />
				<input type="hidden" name="qnaNo" value="${qnaNo}" />
				<table class="table table-layout-fixed">
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
								<textarea class="form-control" name="qnaAnswer" id="qnaAnswer" cols="40" rows="13" required autofocus>${qnaAnswer}</textarea>
							</td>
						</tr>
						<c:if test="${qnaAnswerDate != null}">
							<tr>
								<th class="align-middle">답변일</th>
								<td>${qnaFormattedAnswerDate}</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<div class="text-center my-5">
					<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
					<button type="submit" class="btn btn-warning">답변하기</button>
				</div>
			</form>
		</div>
	</div>
</article>

<script src="${contextPath}/js/bs-custom-file-input.js"></script>

<script>	
	$(document).ready(function() {
		bsCustomFileInput.init()
	});
</script>

<%@ include file="../inc/adminBottom.jsp" %>