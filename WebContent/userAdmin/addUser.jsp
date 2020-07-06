<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="userId" value="${userId}" />
<c:set var="userName" value="${userName}" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">회원 등록</h2>
	</div>
</div>

<article class="user">
	<form action="${contextPath}/camp/insertUser.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="userId" value="${userId}" />
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
					<input class="form-control" type="text" name="userName" id="userName" value="${userId}" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userCategoryNo" class="m-0">카테고리</label>
				</th>
				<td>
					<select class="form-control" name="userCategoryNo" id="userCategoryNo" required>
						<option value="">선택하세요</option>
						<c:forEach var="category" items="${userCategoryList}">
							<option value="${category.userCategoryNo}">${category.userCategoryName}</option>									
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userTitle" class="m-0">제목</label>
				</th>
				<td>
					<input class="form-control" type="text" name="userTitle" id="userTitle" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userContent" class="m-0">내용</label>
				</th>
				<td>			
					<textarea class="form-control" name="userContent" id="userContent" cols="40" rows="13" required></textarea>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label class="m-0">첨부파일</label>
				</th>
				<td>
					<div class="custom-file">
						<input class="custom-file-input" type="file" name="userFileName" id="userFileName" onchange="showPreview(this)" />
						<label class="custom-file-label" for="userFileName">선택된 파일 없음</label>
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