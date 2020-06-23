<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 카테고리 목록</title>
<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${contextPath}/css/board.css" />
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
</head>
<body>
	<section class="container body-container py-5">
		<div class="row">
			<div class="col-12">
				<h2>상품 카테고리</h2>
			</div>
		</div>
		<!-- 게시판 -->
		<article class="mt-3">
			<table class="table table-hover text-center">
				<thead class="thead-light d-none d-lg-table-header-group">
					<tr>
						<th>카테고리 번호</th>
						<th>카테고리 이름</th>
						<th>설정</th>
					</tr>
				</thead>
				<tbody>				
<c:choose>
	<c:when test="${productCategoryList == null}">
					<tr>
						<td class="empty" colspan="2">등록된 상품 카테고리가 없습니다.</td>
					</tr>
	</c:when>
	<c:when test="${productCategoryList != null}">
		<c:forEach var="category" items="${productCategoryList}">
					<tr>
						<td class="align-middle">${category.productCategoryNo}</td>
						<td class="align-middle">${category.productCategoryName}</td>
						<th>
							<button type="button" class="btn btn-warning" onclick="updateCategory(${category.productCategoryNo}, '${category.productCategoryName}')">수정</button>
							<button type="button" class="btn btn-danger" onclick="deleteCategory(${category.productCategoryNo})">삭제</button>
						</th>
					</tr>
		</c:forEach>
	</c:when>
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
	</section>
</body>
</html>