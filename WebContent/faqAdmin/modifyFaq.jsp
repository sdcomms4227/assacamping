<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="faqNo" value="${faqVO.faqNo}" />
<c:set var="faqTitle" value="${faqVO.faqTitle}" />
<c:set var="faqContent" value="${faqVO.faqContent}" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">자주 하는 질문 수정</h2>
	</div>
</div>

<article class="faq">
	<form action="${contextPath}/faqAdminServlet/updateFaq.do" method="post">
		<input type="hidden" name="pageNo" value="${pageNo}" />
		<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
		<input type="hidden" name="faqNo" value="${faqNo}" />
		<table class="table">
			<colgroup>
				<col style="width:120px" />
				<col />
			</colgroup>
			<tr>
				<th class="align-middle">
					<label for="faqTitle" class="m-0">제목</label>
				</th>
				<td>
					<input class="form-control" type="text" name="faqTitle" id="faqTitle" value="${faqTitle}" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="faqContent" class="m-0">내용</label>
				</th>
				<td>			
					<textarea class="form-control" name="faqContent" id="faqContent" cols="40" rows="13" required>${faqContent}</textarea>
				</td>
			</tr>
		</table>
		<div class="text-center my-5">
			<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
			<button type="submit" class="btn btn-warning">수정하기</button>
		</div>
	</form>
</article>

<script src="${contextPath}/js/bs-custom-file-input.js"></script>
<script src="${contextPath}/js/lmw-custom-preview.js"></script>

<script>	
	$(document).ready(function() {
		bsCustomFileInput.init()
	});
</script>

<%@ include file="../inc/adminBottom.jsp" %>