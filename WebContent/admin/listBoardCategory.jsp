<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>

<link rel="stylesheet" href="${contextPath}/css/board.css" />
<div class="row mb-2">
	<div class="col-6">
		<h2>캠핑정보 카테고리</h2>
	</div>
	<div class="col-6 text-right">
		<a href="${contextPath}/admin/adminCampingList.jsp" class="btn btn-secondary btn-sm">캠핑정보</a>
	</div>
</div>

<article class="mt-3">
	<table class="table table-hover text-center">
		<thead class="thead-light d-none d-lg-table-header-group">
			<tr>
				<th>카테고리 번호</th>
				<th>카테고리 이름</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>				
<c:choose>
<c:when test="${boardCategoryList == null}">
			<tr>
				<td class="empty" colspan="2">등록된 게시판 카테고리가 없습니다.</td>
			</tr>
</c:when>
<c:when test="${boardCategoryList != null}">
<c:forEach var="category" items="${boardCategoryList}">
			<tr>
				<td class="align-middle">${category.boardCategoryNo}</td>
				<td class="align-middle">${category.boardCategoryName}</td>
				<th>
					<button type="button" class="btn btn-warning btn-sm" onclick="updateCategory(${category.boardCategoryNo}, '${category.boardCategoryName}')">수정</button>
					<button type="button" class="btn btn-danger btn-sm" onclick="deleteCategory(${category.boardCategoryNo})">삭제</button>
				</th>
			</tr>
</c:forEach>
</c:when>
</c:choose>				
		</tbody>
	</table>

	<form action="${contextPath}/brdCategory/addBoardCategory.do" method="post" name="formBoardCategory">
		<input type="hidden" name="boardCategoryNo" />
		<div class="input-group">
			<div class="input-group-prepend">
				<label for="boardCategoryName" class="input-group-text">카테고리 이름</label>
			</div>
			<input type="text" class="form-control" name="boardCategoryName" id="boardCategoryName" maxlength="50" required>
			<div class="input-group-append">
				<button type="submit" class="btn btn-primary" name="buttonBoardCategory">등록하기</button>
			</div>
		</div>
	</form>
</article>
<script>
	function deleteCategory(boardCategoryNo){
		if(confirm("정말로 삭제하시겠습니까?")){			
			location.href="${contextPath}/brdCategory/deleteBoardCategory.do?boardCategoryNo=" + boardCategoryNo;
		}
	}
	function updateCategory(boardCategoryNo, boardCategoryName){
		form = document.formBoardCategory;
		form.action = "${contextPath}/brdCategory/updateBoardCategory.do";
		form.buttonBoardCategory.innerText = "수정하기";
		form.buttonBoardCategory.classList.remove("btn-primary");
		form.buttonBoardCategory.classList.add("btn-warning");
		form.boardCategoryNo.value = boardCategoryNo;
		form.boardCategoryName.value = boardCategoryName;
		form.boardCategoryName.focus();
	}
</script>

<%@ include file="../inc/adminBottom.jsp" %>