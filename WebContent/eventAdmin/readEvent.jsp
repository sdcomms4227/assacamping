<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="eventNo" value="${eventMap.eventVO.eventNo}" />
<c:set var="eventTitle" value="${eventMap.eventVO.eventTitle}" />
<c:set var="eventContent" value="${eventMap.eventVO.eventContent}" />
<c:set var="eventImageFileName" value="${eventMap.eventVO.eventImageFileName}" />
<c:set var="eventWriteDate" value="${eventMap.eventVO.eventWriteDate}" />
<c:set var="eventReadCount" value="${eventMap.eventVO.eventReadCount}" />
<c:set var="eventFileType" value="${eventMap.eventFileType}" />
<fmt:formatNumber var="eventFormattedReadCount" value="${eventReadCount}" pattern="#,###"/>
<fmt:formatDate var="eventFormattedWriteDate" value="${eventWriteDate}" pattern="yyyy-MM-dd HH:mm" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">이벤트</h2>
	</div>
</div>

<article class="event">
	<div class="row">
		<div class="col-12 col-lg-4 col-xl-3">
			<table class="table table-layout-fixed text-center">
				<thead>
					<tr>
						<th class="bg-light text-center">이미지</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="p-3">
							<c:if test="${eventImageFileName != null}">
								<img src="${contextPath}/files/event/${eventNo}/${eventImageFileName}" alt="${eventTitle}"/>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-12 col-lg-8 col-xl-9">
			<table class="table read-table table-layout-fixed">
				<colgroup>
					<col style="width:120px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th class="bg-light text-center" colspan="2">이벤트 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>번호</th>
						<td class="text-danger">${eventNo}</td>
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
						<th>조회수</th>
						<td>${eventFormattedReadCount}</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${eventFormattedWriteDate}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>	
	<div class="text-center my-5">
		<button type="button" class="btn btn-secondary" onclick="listEvent()">목록</button>				
		<button type="button" class="btn btn-warning" onclick="modifyEvent(${eventNo})">수정</button>
		<button type="button" class="btn btn-danger" onclick="deleteEvent(${eventNo})">삭제</button>
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
function downloadEvent(eventNo, eventImageFileName){
	var form = document.pagingForm;
	form.action = "${contextPath}/eventAdminServlet/download.do?eventNo=" + eventNo + "&fileName=" + eventImageFileName;
	form.submit();
}
</script>

<%@ include file="../inc/adminBottom.jsp" %>