<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<link rel="stylesheet" href="${contextPath}/css/board.css" />

<div class="row mb-2 align-items-center">
	<div class="col-12 col-lg-9">
		<h2>상품 카테고리</h2>
	</div>
	<div class="col-12 col-lg-3 text-right">
		<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${contextPath}/proadm/listProduct.do'">상품 관리</button>
	</div>
</div>

<article>
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
				<c:when test="${productCategoryList == null}">
					<tr>
						<td class="empty" colspan="3">등록된 상품 카테고리가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="category" items="${productCategoryList}">
						<tr>
							<td class="align-middle">${category.productCategoryNo}</td>
							<td class="align-middle">${category.productCategoryName}</td>
							<td>
								<button type="button" class="btn btn-warning btn-sm" onclick="updateCategory(${category.productCategoryNo}, '${category.productCategoryName}')">수정</button>
								<button type="button" class="btn btn-danger btn-sm" onclick="deleteCategory(${category.productCategoryNo})">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>				
		</tbody>
	</table>

	<form action="${contextPath}/proCategory/addProductCategory.do" method="post" name="formProductCategory">
		<input type="hidden" name="productCategoryNo" />
		<div class="input-group">
			<div class="input-group-prepend">
				<label for="productCategoryName" class="input-group-text">카테고리 이름</label>
			</div>
			<input type="text" class="form-control" name="productCategoryName" id="productCategoryName" maxlength="50" required>
			<div class="input-group-append">
				<button type="submit" class="btn btn-primary" name="buttonProductCategory">등록하기</button>
			</div>
		</div>
	</form>
</article>

<script>
	function deleteCategory(productCategoryNo){
		if(confirm("정말로 삭제하시겠습니까?")){			
			location.href="${contextPath}/proCategory/deleteProductCategory.do?productCategoryNo=" + productCategoryNo;
		}
	}
	function updateCategory(productCategoryNo, productCategoryName){
		form = document.formProductCategory;
		form.action = "${contextPath}/proCategory/updateProductCategory.do";
		form.buttonProductCategory.innerText = "수정하기";
		form.buttonProductCategory.classList.remove("btn-primary");
		form.buttonProductCategory.classList.add("btn-warning");
		form.productCategoryNo.value = productCategoryNo;
		form.productCategoryName.value = productCategoryName;
		form.productCategoryName.focus();
	}
</script>

<%@ include file="../inc/adminBottom.jsp" %>