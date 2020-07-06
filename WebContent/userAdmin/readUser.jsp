<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="userNo" value="${userMap.userVO.userNo}" />
<c:set var="userTitle" value="${userMap.userVO.userTitle}" />
<c:set var="userContent" value="${userMap.userVO.userContent}" />
<c:set var="userFileName" value="${userMap.userVO.userFileName}" />
<c:set var="userId" value="${userMap.userVO.userId}" />
<c:set var="userDate" value="${userMap.userVO.userDate}" />
<c:set var="userCount" value="${userMap.userVO.userCount}" />
<c:set var="userCategoryName" value="${userMap.userCategoryName}" />
<c:set var="userFileType" value="${userMap.userFileType}" />
<c:set var="userName" value="홍길동" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">회원 정보</h2>
	</div>
</div>

<article class="user">
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
						<td class="text-danger">${userNo}</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>${userCategoryName}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${userId}</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><fmt:formatNumber value="${userCount}" pattern="#,###"/></td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${userTitle}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${fn:replace(userContent,LF,BR)}</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td><fmt:formatDate value="${userDate}" pattern="yyyy-MM-dd HH:mm" /></td>
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
								<c:when test="${userFileName == null}">
									<div>등록된 첨부파일이 없습니다.</div>
								</c:when> 
								<c:otherwise>
									<div class="d-flex align-items-center">
										<c:if test="${userFileType.equals('image')}">
											<div class="preview" style="background-image:url(${contextPath}/files/user/${userNo}/${userFileName})"></div>
										</c:if>
										<p class="ml-2 mb-0">${userFileName}</p>
										<button type="button" class="btn btn-sm btn-info ml-2" onclick="downloadUser(${userNo}, '${userFileName}')">다운로드</button>
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
		<button type="button" class="btn btn-secondary" onclick="listUser()">목록</button>							
		<button type="button" class="btn btn-warning" onclick="modifyUser(${userNo})">수정</button>
		<button type="button" class="btn btn-danger" onclick="deleteUser(${userNo})">삭제</button>
		<button type="button" class="btn btn-primary" onclick="replyUser(${userNo})">답글쓰기</button>
	</div>			
</article>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
	<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo}" />
</form>

<script>
function listUser(){
	var form = document.pagingForm;
	form.action = "${contextPath}/campadm/listUser.do";	
	form.submit();
}
function modifyUser(userNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/campadm/modifyUser.do?userNo=" + userNo;
	form.submit();
}
function deleteUser(userNo){
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/campadm/deleteUser.do?userNo=" + userNo;
		form.submit();
	}
}
function replyUser(userNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/campadm/replyUser.do?userNo=" + userNo;
	form.submit();
}
function downloadUser(userNo, userFileName){
	var form = document.pagingForm;
	form.action = "${contextPath}/campadm/download.do?userNo=" + userNo + "&fileName=" + userFileName;
	form.submit();
}
</script>

<%@ include file="../inc/adminBottom.jsp" %>