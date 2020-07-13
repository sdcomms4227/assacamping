<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="campingNo" value="${campingMap.campingVO.campingNo}" />
<c:set var="campingTitle" value="${campingMap.campingVO.campingTitle}" />
<c:set var="campingContent" value="${campingMap.campingVO.campingContent}" />
<c:set var="campingFileName" value="${campingMap.campingVO.campingFileName}" />
<c:set var="userId" value="${campingMap.campingVO.userId}" />
<c:set var="campingDate" value="${campingMap.campingVO.campingDate}" />
<c:set var="campingCount" value="${campingMap.campingVO.campingCount}" />
<c:set var="campingCategoryName" value="${campingMap.campingCategoryName}" />
<c:set var="campingFileType" value="${campingMap.campingFileType}" />
<fmt:formatNumber var="campingFormattedCount" value="${campingCount}" pattern="#,###"/>
<fmt:formatDate var="campingFormattedDate" value="${campingDate}" pattern="yyyy-MM-dd HH:mm" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">캠핑정보</h2>
	</div>
</div>

<article class="camping">
	<div class="row">
		<div class="col-12 col-lg-4 col-xl-3">
			<table class="table table-layout-fixed text-center">
				<thead>
					<tr>
						<th class="bg-light text-center">첨부파일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${campingFileName == null}">
							<tr>
								<td class="p-3">
									<div>등록된 첨부파일이 없습니다.</div>
								</td>
							</tr>
						</c:when> 
						<c:otherwise>
							<tr>
								<td class="p-3">
									<div class="d-flex align-items-center">
										<c:if test="${campingFileType.equals('image')}">
											<div class="preview" style="background-image:url(${contextPath}/files/camping/${campingNo}/${campingFileName})"></div>
										</c:if>
										<p class="ml-2 mb-0">${campingFileName}</p>
									</div>
								</td>
							</tr>
							<tr>
								<td class="p-3">
									<button type="button" class="btn btn-sm btn-info" onclick="downloadCamping(${campingNo}, '${campingFileName}')">다운로드</button>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
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
						<th class="bg-light text-center" colspan="2">게시글 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>번호</th>
						<td class="text-danger">${campingNo}</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>${campingCategoryName}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${userId}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${campingTitle}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${fn:replace(campingContent,LF,BR)}</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${campingFormattedCount}</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${campingFormattedDate}</td>
					</tr>
				</tbody>
			</table>
		</div>		
	</div>	
	<div class="text-center my-5">
		<button type="button" class="btn btn-secondary" onclick="listCamping()">목록</button>							
		<button type="button" class="btn btn-warning" onclick="modifyCamping(${campingNo})">수정</button>
		<button type="button" class="btn btn-danger" onclick="deleteCamping(${campingNo})">삭제</button>
		<button type="button" class="btn btn-primary" onclick="replyCamping(${campingNo})">답글쓰기</button>
	</div>			
</article>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
	<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo}" />
</form>

<script>
function listCamping(){
	var form = document.pagingForm;
	form.action = "${contextPath}/campingAdminServlet/listCamping.do";	
	form.submit();
}
function modifyCamping(campingNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/campingAdminServlet/modifyCamping.do?campingNo=" + campingNo;
	form.submit();
}
function deleteCamping(campingNo){
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/campingAdminServlet/deleteCamping.do?campingNo=" + campingNo;
		form.submit();
	}
}
function replyCamping(campingNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/campingAdminServlet/replyCamping.do?campingNo=" + campingNo;
	form.submit();
}
function downloadCamping(campingNo, campingFileName){
	var form = document.pagingForm;
	form.action = "${contextPath}/campingAdminServlet/download.do?campingNo=" + campingNo + "&fileName=" + campingFileName;
	form.submit();
}
</script>

<%@ include file="../inc/adminBottom.jsp" %>