<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="eventNo" value="${eventMap.eventVO.eventNo}" />
<c:set var="eventTitle" value="${eventMap.eventVO.eventTitle}" />
<c:set var="eventContent" value="${eventMap.eventVO.eventContent}" />
<c:set var="eventFileName" value="${eventMap.eventVO.eventFileName}" />
<c:set var="userId" value="${eventMap.eventVO.userId}" />
<c:set var="eventDate" value="${eventMap.eventVO.eventDate}" />
<c:set var="eventCount" value="${eventMap.eventVO.eventCount}" />
<c:set var="eventFileType" value="${eventMap.eventFileType}" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">캠핑정보 수정</h2>
	</div>
</div>

<article class="event">
	<form action="${contextPath}/campingServlet/updateEvent.do" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="pageNo" value="${pageNo}" />
		<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
		<input type="hidden" name="eventNo" value="${eventNo}" />	
		<input type="hidden" name="userId" value="${userId}" />
		<input type="hidden" name="oldFileName" value="${eventFileName}" />
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
					<label for="eventTitle" class="m-0">제목</label>
				</th>
				<td>
					<input class="form-control" type="text" name="eventTitle" id="eventTitle" value="${eventTitle}" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="eventContent" class="m-0">내용</label>
				</th>
				<td>			
					<textarea class="form-control" name="eventContent" id="eventContent" cols="40" rows="13" required>${eventContent}</textarea>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label class="m-0">첨부파일</label>
				</th>
				<td>
					<c:if test="${not empty eventFileName}">
						<div class="d-flex align-items-center mb-2">
							<c:if test="${eventFileType.equals('image')}">
								<div class="preview" style="background-image:url(${contextPath}/files/event/${eventNo}/${eventFileName})"></div>
							</c:if>
							<p class="ml-2 mb-0">${eventFileName}</p>
							<div class="custom-control custom-checkbox ml-2">
								<input type="checkbox" class="custom-control-input" name="deleteFile" id="deleteFile">
								<label class="custom-control-label text-danger" for="deleteFile">첨부된 파일 삭제하기</label>
							</div>
						</div>
						<p class="alert alert-danger" style="display:none">파일첨부 시 기존 첨부파일 정보가 삭제됩니다.</p>
					</c:if>
					<div class="custom-file">
						<input class="custom-file-input" type="file" name="eventFileName" id="eventFileName" onchange="checkFile(this);showPreview(this)" />
						<label class="custom-file-label" for="eventFileName">선택된 파일 없음</label>
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