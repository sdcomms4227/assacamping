<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="faqNo" value="${faqVO.faqNo}" />
<c:set var="faqTitle" value="${faqVO.faqTitle}" />
<c:set var="faqContent" value="${faqVO.faqContent}" />
<c:set var="faqWriteDate" value="${faqVO.faqWriteDate}" />
<fmt:formatDate var="faqFormattedWriteDate" value="${faqWriteDate}" pattern="yyyy-MM-dd HH:mm" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">자주 하는 질문</h2>
	</div>
</div>

<article class="faq">
	<div class="row">
		<div class="col-12">
			<table class="table read-table table-layout-fixed">
				<colgroup>
					<col style="width:120px" />
					<col />
				</colgroup>
				<tbody>
					<tr>
						<th>번호</th>
						<td class="text-danger">${faqNo}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${faqTitle}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${fn:replace(faqContent,LF,BR)}</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${faqFormattedWriteDate}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="text-center my-5">
		<button type="button" class="btn btn-secondary" onclick="listFaq()">목록</button>				
		<button type="button" class="btn btn-warning" onclick="modifyFaq(${faqNo})">수정</button>
		<button type="button" class="btn btn-danger" onclick="deleteFaq(${faqNo})">삭제</button>
	</div>			
</article>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
</form>

<script>
function listFaq(){
	var form = document.pagingForm;
	form.action = "${contextPath}/faqAdminServlet/listFaq.do";	
	form.submit();
}
function modifyFaq(faqNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/faqAdminServlet/modifyFaq.do?faqNo=" + faqNo;
	form.submit();
}
function deleteFaq(faqNo){
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/faqAdminServlet/deleteFaq.do?faqNo=" + faqNo;
		form.submit();
	}
}
</script>

<%@ include file="../inc/adminBottom.jsp" %>