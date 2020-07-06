<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="userNo" value="${userMap.userVO.userNo}" />
<c:set var="userTitle" value="${userMap.userVO.userTitle}" />
<c:set var="userContent" value="${userMap.userVO.userContent}" />
<c:set var="userFileName" value="${userMap.userVO.userFileName}" />
<c:set var="userId" value="${userMap.userVO.userId}" />
<c:set var="userDate" value="${userMap.userVO.userDate}" />
<c:set var="userCount" value="${userMap.userVO.userCount}" />
<c:set var="userCategoryNo" value="${userMap.userVO.userCategoryNo}" />
<c:set var="userCategoryName" value="${userMap.userCategoryName}" />
<c:set var="userFileType" value="${userMap.userFileType}" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">회원 수정</h2>
	</div>
</div>

<article class="user">
	<form action="${contextPath}/camp/updateUser.do" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="pageNo" value="${pageNo}" />
		<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
		<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo}" />
		<input type="hidden" name="userNo" value="${userNo}" />	
		<input type="hidden" name="userId" value="${userId}" />
		<input type="hidden" name="oldFileName" value="${userFileName}" />
		<table class="table">
			<colgroup>
				<col style="width:120px" />
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
							<c:choose>
								<c:when test="${category.userCategoryNo == userCategoryNo}">
									<option value="${category.userCategoryNo}" selected>${category.userCategoryName}</option>	
								</c:when>
								<c:otherwise>
									<option value="${category.userCategoryNo}">${category.userCategoryName}</option>	
								</c:otherwise>
							</c:choose>																				
						</c:forEach>								
					</select>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userTitle" class="m-0">제목</label>
				</th>
				<td>
					<input class="form-control" type="text" name="userTitle" id="userTitle" value="${userTitle}" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userContent" class="m-0">내용</label>
				</th>
				<td>			
					<textarea class="form-control" name="userContent" id="userContent" cols="40" rows="13" required>${userContent}</textarea>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label class="m-0">첨부파일</label>
				</th>
				<td>
					<c:if test="${not empty userFileName}">
						<div class="d-flex align-items-center mb-2">
							<c:if test="${userFileType.equals('image')}">
								<div class="preview" style="background-image:url(${contextPath}/files/user/${userNo}/${userFileName})"></div>
							</c:if>
							<p class="ml-2 mb-0">${userFileName}</p>
							<div class="custom-control custom-checkbox ml-2">
								<input type="checkbox" class="custom-control-input" name="deleteFile" id="deleteFile">
								<label class="custom-control-label text-danger" for="deleteFile">첨부된 파일 삭제하기</label>
							</div>
						</div>
						<p class="alert alert-danger" style="display:none">파일첨부 시 기존 첨부파일 정보가 삭제됩니다.</p>
					</c:if>
					<div class="custom-file">
						<input class="custom-file-input" type="file" name="userFileName" id="userFileName" onchange="checkFile(this);showPreview(this)" />
						<label class="custom-file-label" for="userFileName">선택된 파일 없음</label>
					</div>
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