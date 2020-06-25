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
	<c:when test="${campingCategoryList == null}">
			<tr>
				<td class="empty" colspan="3">등록된 게시판 카테고리가 없습니다.</td>
			</tr>
	</c:when>
	<c:when test="${campingCategoryList != null}">
		<c:forEach var="category" items="${campingCategoryList}">
			<tr>
				<td class="align-middle">${category.campingCategoryNo}</td>
				<td class="align-middle">${category.campingCategoryName}</td>
				<th>
					<button type="button" class="btn btn-warning btn-sm" onclick="updateCategory(${category.campingCategoryNo}, '${category.campingCategoryName}')">수정</button>
					<button type="button" class="btn btn-danger btn-sm" onclick="deleteCategory(${category.campingCategoryNo})">삭제</button>
				</th>
			</tr>
		</c:forEach>
	</c:when>
</c:choose>				
		</tbody>
	</table>

	<form action="${contextPath}/campCategory/insertCampingCategory.do" method="post" name="formCampingCategory">
		<input type="hidden" name="campingCategoryNo" />
		<div class="input-group">
			<div class="input-group-prepend">
				<label for="campingCategoryName" class="input-group-text">카테고리 이름</label>
			</div>
			<input type="text" class="form-control" name="campingCategoryName" id="campingCategoryName" maxlength="50" required>
			<div class="input-group-append">
				<button type="submit" class="btn btn-primary" name="buttonCampingCategory">등록하기</button>
			</div>
		</div>
	</form>
</article>
<script>
	function deleteCategory(campingCategoryNo){
		if(confirm("정말로 삭제하시겠습니까?")){			
			location.href="${contextPath}/campCategory/deleteCampingCategory.do?campingCategoryNo=" + campingCategoryNo;
		}
	}
	function updateCategory(campingCategoryNo, campingCategoryName){
		form = document.formCampingCategory;
		form.action = "${contextPath}/campCategory/updateCampingCategory.do";
		form.buttonCampingCategory.innerText = "수정하기";
		form.buttonCampingCategory.classList.remove("btn-primary");
		form.buttonCampingCategory.classList.add("btn-warning");
		form.campingCategoryNo.value = campingCategoryNo;
		form.campingCategoryName.value = campingCategoryName;
		form.campingCategoryName.focus();
	}
</script>

<%@ include file="../inc/adminBottom.jsp" %>