<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="campingNo" value="${campingMap.campingVO.campingNo}" />
<c:set var="campingTitle" value="${campingMap.campingVO.campingTitle}" />
<c:set var="campingContent" value="${campingMap.campingVO.campingContent}" />
<c:set var="campingFileName" value="${campingMap.campingVO.campingFileName}" />
<c:set var="userId" value="${campingMap.campingVO.userId}" />
<c:set var="campingDate" value="${campingMap.campingVO.campingDate}" />
<c:set var="campingCount" value="${campingMap.campingVO.campingCount}" />
<c:set var="campingCategoryNo" value="${campingMap.campingVO.campingCategoryNo}" />
<c:set var="campingCategoryName" value="${campingMap.campingCategoryName}" />
<c:set var="campingFileType" value="${campingMap.campingFileType}" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">캠핑정보 수정</h2>
	</div>
</div>

<article class="camping">
	<form action="${contextPath}/campingServlet/updateCamping.do" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="pageNo" value="${pageNo}" />
		<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
		<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo}" />
		<input type="hidden" name="campingNo" value="${campingNo}" />	
		<input type="hidden" name="userId" value="${userId}" />
		<input type="hidden" name="oldFileName" value="${campingFileName}" />
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
					<label for="campingCategoryNo" class="m-0">카테고리</label>
				</th>
				<td>
					<select class="form-control" name="campingCategoryNo" id="campingCategoryNo" required>
						<option value="">선택하세요</option>
						<c:forEach var="category" items="${campingCategoryList}">											
							<c:choose>
								<c:when test="${category.campingCategoryNo == campingCategoryNo}">
									<option value="${category.campingCategoryNo}" selected>${category.campingCategoryName}</option>	
								</c:when>
								<c:otherwise>
									<option value="${category.campingCategoryNo}">${category.campingCategoryName}</option>	
								</c:otherwise>
							</c:choose>																				
						</c:forEach>								
					</select>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="campingTitle" class="m-0">제목</label>
				</th>
				<td>
					<input class="form-control" type="text" name="campingTitle" id="campingTitle" value="${campingTitle}" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="campingContent" class="m-0">내용</label>
				</th>
				<td>			
					<textarea class="form-control" name="campingContent" id="campingContent" cols="40" rows="13" required>${campingContent}</textarea>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label class="m-0">첨부파일</label>
				</th>
				<td>
					<c:if test="${not empty campingFileName}">
						<div class="d-flex align-items-center mb-2">
							<c:if test="${campingFileType.equals('image')}">
								<div class="preview" style="background-image:url(${contextPath}/files/camping/${campingNo}/${campingFileName})"></div>
							</c:if>
							<p class="ml-2 mb-0">${campingFileName}</p>
							<div class="custom-control custom-checkbox ml-2">
								<input type="checkbox" class="custom-control-input" name="deleteFile" id="deleteFile">
								<label class="custom-control-label text-danger" for="deleteFile">첨부된 파일 삭제하기</label>
							</div>
						</div>
						<p class="alert alert-danger" style="display:none">파일첨부 시 기존 첨부파일 정보가 삭제됩니다.</p>
					</c:if>
					<div class="custom-file">
						<input class="custom-file-input" type="file" name="campingFileName" id="campingFileName" onchange="checkFile(this);showPreview(this)" />
						<label class="custom-file-label" for="campingFileName">선택된 파일 없음</label>
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