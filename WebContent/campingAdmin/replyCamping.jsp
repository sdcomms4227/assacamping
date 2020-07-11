<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="campingNo" value="${campingMap.campingVO.campingNo}" />
<c:set var="campingTitle" value="${campingMap.campingVO.campingTitle}" />
<c:set var="campingRe_ref" value="${campingMap.campingVO.campingRe_ref}" />
<c:set var="campingRe_lev" value="${campingMap.campingVO.campingRe_lev}" />
<c:set var="campingRe_seq" value="${campingMap.campingVO.campingRe_seq}" />
<c:set var="campingCategoryNo" value="${campingMap.campingVO.campingCategoryNo}" />
<c:set var="campingCategoryName" value="${campingMap.campingCategoryName}" />
<c:set var="userId" value="${sessionScope.userId}" />
<c:set var="userName" value="${sessionScope.userName}" />

<!-- top -->
<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">캠핑정보 답글등록</h2>
	</div>
</div>

<!-- Camping -->
<article class="camping">
	<form action="${contextPath}/campingServlet/insertReplyCamping.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNo" value="${pageNo}" />
		<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
		<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo}" />
		<input type="hidden" name="campingNo" value="${campingNo}" />
		<input type="hidden" name="userId" value="${userId}" />
		<input type="hidden" name="campingRe_ref" value="${campingRe_ref}" />
		<input type="hidden" name="campingRe_lev" value="${campingRe_lev}" />
		<input type="hidden" name="campingRe_seq" value="${campingRe_seq}" />
		<table class="table">
			<colgroup>
				<col style="max-width: 120px" />
				<col />
			</colgroup>
			<tr>
				<th class="align-middle">
					<label for="userName" class="m-0">이름</label>
				</th>
				<td>
					<input class="form-control" type="text" name="userName" id="userName" value="${userName}" readonly />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="campingCategoryNo" class="m-0">카테고리</label>
				</th>
				<td>
					<input type="hidden" name="campingCategoryNo" id="campingCategoryNo" value="${campingCategoryNo}" required />
					<input class="form-control" type="text" value="${campingCategoryName}" readonly />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="campingTitle" class="m-0">제목</label>
				</th>
				<td>
					<input class="form-control" type="text" name="campingTitle" id="campingTitle" value="[답글] ${campingTitle}" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="campingContent" class="m-0">내용</label>
				</th>
				<td>			
					<textarea class="form-control" name="campingContent" id="campingContent" cols="40" rows="13" required></textarea>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label class="m-0">첨부파일</label>
				</th>
				<td>
					<div class="custom-file">
						<input class="custom-file-input" type="file" name="campingFileName" id="campingFileName" onchange="showPreview(this)" />
						<label class="custom-file-label" for="campingFileName">선택된 파일 없음</label>
					</div>
				</td>
			</tr>
		</table>
		<div class="text-center my-5">
			<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
			<button type="submit" class="btn btn-primary">글쓰기</button>
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