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
		<h2 class="mb-0">캠핑정보</h2>
	</div>
</div>

<article class="event">
	<div class="row">
		<div class="col-12 col-lg-6">
			<table class="table read-table table-layout-fixed">
				<colgroup>
					<col style="width:120px" />
					<col />
				</colgroup>
				<tbody>
					<tr>
						<th>번호</th>
						<td class="text-danger">${eventNo}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${userId}</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><fmt:formatNumber value="${eventCount}" pattern="#,###"/></td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${eventTitle}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${fn:replace(eventContent,LF,BR)}</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td><fmt:formatDate value="${eventDate}" pattern="yyyy-MM-dd HH:mm" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-12 col-lg-6">
			<table class="table table-layout-fixed text-center">
				<thead>
					<tr>
						<th>첨부파일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="p-3">
							<c:choose>
								<c:when test="${eventFileName == null}">
									<div>등록된 첨부파일이 없습니다.</div>
								</c:when> 
								<c:otherwise>
									<div class="d-flex align-items-center">
										<c:if test="${eventFileType.equals('image')}">
											<div class="preview" style="background-image:url(${contextPath}/files/event/${eventNo}/${eventFileName})"></div>
										</c:if>
										<p class="ml-2 mb-0">${eventFileName}</p>
										<button type="button" class="btn btn-sm btn-info ml-2" onclick="downloadEvent(${eventNo}, '${eventFileName}')">다운로드</button>
									</div>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="text-center my-5">
		<button type="button" class="btn btn-secondary" onclick="listEvent()">목록</button>							
		<button type="button" class="btn btn-warning" onclick="modifyEvent(${eventNo})">수정</button>
		<button type="button" class="btn btn-danger" onclick="deleteEvent(${eventNo})">삭제</button>
		<button type="button" class="btn btn-primary" onclick="replyEvent(${eventNo})">답글쓰기</button>
	</div>			
</article>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
</form>

<script>
function listEvent(){
	var form = document.pagingForm;
	form.action = "${contextPath}/eventAdminServlet/listEvent.do";	
	form.submit();
}
function modifyEvent(eventNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/eventAdminServlet/modifyEvent.do?eventNo=" + eventNo;
	form.submit();
}
function deleteEvent(eventNo){
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/eventAdminServlet/deleteEvent.do?eventNo=" + eventNo;
		form.submit();
	}
}
function replyEvent(eventNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/eventAdminServlet/replyEvent.do?eventNo=" + eventNo;
	form.submit();
}
function downloadEvent(eventNo, eventFileName){
	var form = document.pagingForm;
	form.action = "${contextPath}/eventAdminServlet/download.do?eventNo=" + eventNo + "&fileName=" + eventFileName;
	form.submit();
}
</script>

<%@ include file="../inc/adminBottom.jsp" %>