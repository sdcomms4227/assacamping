<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>

<div class="row mb-3 align-items-center">
	<div class="col-12 col-lg-9">
		<h2 class="mb-0">캠핑정보 카테고리</h2>
	</div>
	<div class="col-12 col-lg-3 text-right">
		<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${contextPath}/campingAdminServlet/listCamping.do'">캠핑정보</button>
	</div>
</div>

<article class="camping">
	<table class="table table-hover text-center">
		<colgroup>
			<col style="width: 80px" />
			<col />
			<col style="width: 140px" />
		</colgroup>
		<thead class="thead-light d-none d-lg-table-header-group">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${campingCategoryList == null}">
					<tr>
						<td class="empty" colspan="3">등록된 캠핑정보 카테고리가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="category" items="${campingCategoryList}">
						<tr>
							<td class="align-middle">${category.campingCategoryNo}</td>
							<td class="align-middle text-left">${category.campingCategoryName}</td>
							<td class="align-middle">
								<button type="button" class="btn btn-warning btn-sm" onclick="updateCategory(${category.campingCategoryNo}, '${category.campingCategoryName}')">수정</button>
								<button type="button" class="btn btn-danger btn-sm" onclick="deleteCategory(${category.campingCategoryNo})">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>

	<form class="categoryForm" action="${contextPath}/campingCategoryServlet/addCampingCategory.do" method="post" name="formCampingCategory">
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
			location.href="${contextPath}/campingCategoryServlet/deleteCampingCategory.do?campingCategoryNo=" + campingCategoryNo;
		}
	}
	function updateCategory(campingCategoryNo, campingCategoryName){
		form = document.formCampingCategory;
		form.action = "${contextPath}/campingCategoryServlet/updateCampingCategory.do";
		form.buttonCampingCategory.innerText = "수정하기";
		form.buttonCampingCategory.classList.remove("btn-primary");
		form.buttonCampingCategory.classList.add("btn-warning");
		form.campingCategoryNo.value = campingCategoryNo;
		form.campingCategoryName.value = campingCategoryName;
		form.campingCategoryName.focus();
	}
</script>

<%@ include file="../inc/adminBottom.jsp"%>