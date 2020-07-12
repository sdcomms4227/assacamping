<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="eventNo" value="${eventMap.eventVO.eventNo}" />
<c:set var="eventTitle" value="${eventMap.eventVO.eventTitle}" />
<c:set var="eventContent" value="${eventMap.eventVO.eventContent}" />
<c:set var="eventImageFileName" value="${eventMap.eventVO.eventImageFileName}" />
<c:set var="eventWriteDate" value="${eventMap.eventVO.eventWriteDate}" />
<c:set var="eventReadCount" value="${eventMap.eventVO.eventReadCount}" />
<c:set var="eventFileType" value="${eventMap.eventFileType}" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">이벤트 수정</h2>
	</div>
</div>

<article class="event">
	<form action="${contextPath}/eventAdminServlet/updateEvent.do" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="pageNo" value="${pageNo}" />
		<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
		<input type="hidden" name="eventNo" value="${eventNo}" />
		<input type="hidden" name="oldFileName" value="${eventImageFileName}" />
		<table class="table">
			<colgroup>
				<col style="width:120px" />
				<col />
			</colgroup>
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
					<label class="m-0">이미지</label>
				</th>
				<td>
					<c:if test="${not empty eventImageFileName}">
						<div class="d-flex align-items-center mb-2">
							<c:if test="${eventFileType.equals('image')}">
								<div class="preview" style="background-image:url(${contextPath}/files/event/${eventNo}/${eventImageFileName})"></div>
							</c:if>
							<p class="ml-2 mb-0">${eventImageFileName}</p>
						</div>
						<p class="alert alert-danger" style="display:none">이미지 첨부 시 기존 이미지 정보가 삭제됩니다.</p>
					</c:if>
					<div class="custom-file">
						<input class="custom-file-input" type="file" name="eventImageFileName" id="eventImageFileName" onchange="checkFile(this);showPreview(this)" />
						<label class="custom-file-label" for="eventImageFileName">선택된 파일 없음</label>
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