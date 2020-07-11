<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<c:set var="eventList" value="${eventListMap.eventList}" />
<c:set var="totalCount" value="${eventListMap.totalCount}" />
<c:set var="beginNo" value="${(pageNo-1) - (pageNo-1)%10 + 1}" />
<c:set var="endNo" value="${beginNo + 9}" />

<div class="row mb-3 align-items-center">
	<div class="col-12 col-lg-3 mb-2 mb-lg-0">
		<h2 class="mb-0">캠핑정보</h2>
	</div>
	<div class="col-12 col-lg-6 mb-2 mb-lg-0 text-center">
		<form action="${contextPath}/eventAdminServlet/listEvent.do" class="form-inline justify-content-center">
			<div class="input-group">
				<input type="search" name="searchKeyword" value="${searchKeyword}" size="24" maxlength="24" class="form-control form-control-sm">
				<div class="input-group-append">
					<button type="submit" class="btn btn-secondary btn-sm">검색</button>
				</div>
			</div>
		</form>
	</div>
	<div class="col-12 col-lg-3 text-right">
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${contextPath}/eventAdminServlet/addEvent.do'">게시글 등록</button>
	</div>
</div>
	
<article class="event">
	<table class="table table-hover text-center">
		<colgroup class="d-none d-lg-table-column-group">
			<col style="width: 80px" />
			<col style="width: 100px" />
			<col />
			<col style="width: 100px" />
			<col style="width: 100px" />
			<col style="width: 100px" />
			<col style="width: 140px" />
		</colgroup>
		<thead class="thead-light d-none d-lg-table-header-group">
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>			
			<c:choose>
				<c:when test="${totalCount==0}">			
					<tr>
						<td colspan="7">등록된 게시글이 없습니다.</td>
					</tr>
				</c:when>	
				<c:otherwise>
					<c:forEach var="eventMap" items="${eventList}">
						<c:set var="eventVO" value="${eventMap.eventVO}" />
						<fmt:formatDate var="eventFmtDate" value="${eventVO.eventDate}" pattern="yyyy-MM-dd HH:mm"/>
						<tr onclick="readEvent(${eventVO.eventNo})" style="cursor:pointer">
							<td class="align-middle">${eventVO.eventNo}</td>
							<td class="align-middle text-left">
								<c:if test="${eventVO.eventRe_lev > 0}">
									<img src="${contextPath}/images/re.gif" style="margin-left:${eventVO.eventRe_lev*16}px" class="mr-2" />
								</c:if>
								${eventVO.eventTitle}
								<c:if test="${eventVO.eventFileName!=null}">
									<img class="ml-2" style="width:16px;height:16px" src="${contextPath}/images/download.svg" />
								</c:if>
							</td>
							<td class="align-middle">${eventVO.userId}</td>
							<td class="align-middle">${eventVO.eventCount}</td>
							<td class="align-middle">${eventFmtDate}</td>
							<td class="align-middle">
								<button type="button" class="btn btn-warning btn-sm" onclick="modifyEvent(${eventVO.eventNo}, event)">수정</button>
								<button type="button" class="btn btn-danger btn-sm" onclick="deleteEvent(${eventVO.eventNo}, event)">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<c:if test="${totalCount != null}">
		<div class="row">
			<div class="col-12">
				<ul class="pagination justify-content-center">
				<c:if test="${pageNo > 10}">	
				   	<li class="page-item">
						<button type="button" class="page-link" onclick="listEvent(${beginNo-10})">이전</button>
					</li>
				</c:if>
				<c:forEach var="page" begin="${beginNo}" end="${endNo}" step="1">
					<c:if test="${page <= Math.ceil(totalCount/10)}">
						<c:choose>	
							<c:when test="${page==pageNo}">
								<li class="page-item active">
									<button type="button" class="page-link" onclick="listEvent(${page})">${page}</button>						
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<button type="button" class="page-link" onclick="listEvent(${page})">${page}</button>							
								</li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>								
				<c:if test="${totalCount > endNo*10}">						
				   	<li class="page-item">
						<button type="button" class="page-link" onclick="listEvent(${beginNo+10})">다음</button>
					</li>
				</c:if>
				</ul>
			</div>
		</div>
	</c:if>
</article>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
</form>

<script>
function listEvent(pageNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/eventAdminServlet/listEvent.do";	
	form.pageNo.value = pageNo;
	form.submit();
}
function readEvent(eventNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/eventAdminServlet/readEvent.do?eventNo=" + eventNo;
	form.submit();
}
function modifyEvent(eventNo, event){
	event.stopPropagation();
	var form = document.pagingForm;
	form.action = "${contextPath}/eventAdminServlet/modifyEvent.do?eventNo=" + eventNo;
	form.submit();
}
function deleteEvent(eventNo, event){
	event.stopPropagation();
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/eventAdminServlet/deleteEvent.do?eventNo=" + eventNo;
		form.submit();
	}
}
</script>

<%@ include file="../inc/adminBottom.jsp"%>