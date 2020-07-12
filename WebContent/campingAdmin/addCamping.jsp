<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="userId" value="${userId}" />
<c:set var="userName" value="${userName}" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">캠핑정보 등록</h2>
	</div>
</div>

<article class="camping">
	<form action="${contextPath}/campingServlet/insertCamping.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="userId" value="${userId}" />
		<table class="table">
			<colgroup>
				<col style="width: 120px" />
				<col />
			</colgroup>
			<tr>
				<th class="align-middle">
					<label for="userName" class="m-0">이름</label>
				</th>
				<td>
					<input class="form-control" type="text" name="userName" id="userName" value="${userId}" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="campingCategoryNo" class="m-0">카테고리</label>
				</th>
				<td>
					<select class="form-control" name="campingCategoryNo" id="campingCategoryNo" required>
						<option value="">선택하세요</option>
						<c:forEach var="category" items="${campingCategoryList}">
							<option value="${category.campingCategoryNo}">${category.campingCategoryName}</option>									
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="campingTitle" class="m-0">제목</label>
				</th>
				<td>
					<input class="form-control" type="text" name="campingTitle" id="campingTitle" required />
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
			<button type="submit" class="btn btn-primary">등록하기</button>
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