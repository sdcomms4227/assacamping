<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 카테고리 목록</title>
<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${contextPath}/css/board.css" />
<script>
	function deleteCategory(boardCategoryNo){
		if(confirm("정말로 삭제하시겠습니까?")){			
			location.href="${contextPath}/brdCate/deleteBoardCategory.do?boardCategoryNo=" + boardCategoryNo;
		}
	}
	function updateCategory(boardCategoryNo, boardCategoryName){
		form = document.formBoardCategory;
		form.action = "${contextPath}/brdCate/updateBoardCategory.do";
		form.buttonBoardCategory.innerText = "수정하기";
		form.buttonBoardCategory.classList.remove("btn-primary");
		form.buttonBoardCategory.classList.add("btn-warning");
		form.boardCategoryNo.value = boardCategoryNo;
		form.boardCategoryName.value = boardCategoryName;
		form.boardCategoryName.focus();
	}
</script>
</head>
<body>
	<section class="container body-container py-5">
		<div class="row">
			<div class="col-12">
				<h2>게시판 카테고리</h2>
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
							<button type="button" class="btn btn-warning" onclick="updateCategory(${category.boardCategoryNo}, '${category.boardCategoryName}')">수정</button>
							<button type="button" class="btn btn-danger" onclick="deleteCategory(${category.boardCategoryNo})">삭제</button>
						</th>
					</tr>
		</c:forEach>
	</c:when>
</c:choose>				
				</tbody>
			</table>
		
			<form action="${contextPath}/brdCate/addBoardCategory.do" method="post" name="formBoardCategory">
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
	</section>
</body>
</html>