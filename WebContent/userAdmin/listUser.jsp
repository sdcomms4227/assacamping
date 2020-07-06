<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<c:set var="userList" value="${userListMap.userList}" />
<c:set var="totalCount" value="${userListMap.totalCount}" />
<c:set var="beginNo" value="${(pageNo-1) - (pageNo-1)%10 + 1}" />
<c:set var="endNo" value="${beginNo + 9}" />

<jsp:include page="../inc/alert.jsp" />

<div class="row mb-3 align-items-center">
	<div class="col-12 col-lg-3 mb-2 mb-lg-0">
		<h2 class="mb-0">회원 관리</h2>
	</div>
	<div class="col-12 col-lg-6 mb-2 mb-lg-0 text-center">
		<form action="${contextPath}/usradm/listUser.do" class="form-inline justify-content-center">
			<div class="input-group">
				<input type="search" name="searchKeyword" value="${searchKeyword}" size="24" maxlength="24" class="form-control form-control-sm">
				<div class="input-group-append">
					<button type="submit" class="btn btn-secondary btn-sm">검색</button>
				</div>
			</div>
		</form>
	</div>
	<div class="col-12 col-lg-3 text-right">
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${contextPath}/usradm/addUser.do'">회원 등록</button>
	</div>
</div>
	
<article class="user">
	<table class="table table-hover text-center">
		<colgroup class="d-none d-lg-table-column-group">
			<col style="width: 160px" />
			<col style="width: 160px" />
			<col style="width: 160px" />
			<col style="width: 160px" />
			<col />
			<col style="width: 160px" />
			<col style="width: 100px" />
			<col style="width: 140px" />
		</colgroup>
		<thead class="thead-light d-none d-lg-table-header-group">
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>회원상태</th>
				<th>가입일</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>			
			<c:choose>
				<c:when test="${totalCount==0}">			
					<tr>
						<td colspan="8">등록된 회원이 없습니다.</td>
					</tr>
				</c:when>	
				<c:otherwise>
					<c:forEach var="userVO" items="${userList}">
						<fmt:formatDate var="userFmtDate" value="${userVO.userDate}" pattern="yyyy-MM-dd HH:mm"/>
						<tr onclick="readUser('${userVO.userId}')" style="cursor:pointer">
							<td class="align-middle">${userVO.userId}</td>
							<td class="align-middle">${userVO.userPw}</td>
							<td class="align-middle">${userVO.userName}</td>
							<td class="align-middle">${userVO.userPhone}</td>
							<td class="align-middle">${userVO.userEmail}</td>
							<td class="align-middle">							
								<c:choose>
									<c:when test="${userVO.userUse==1}">
										<span>일반회원</span>
									</c:when>
									<c:otherwise>
										<span class="text-danger">탈퇴회원</span>
									</c:otherwise>
								</c:choose>
							</td>
							<td class="align-middle">${userFmtDate}</td>
							<td class="align-middle">
								<button type="button" class="btn btn-warning btn-sm" onclick="modifyUser(${userVO.userId}, event)">수정</button>
								<button type="button" class="btn btn-danger btn-sm" onclick="deleteUser(${userVO.userId}, event)">삭제</button>
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
						<button type="button" class="page-link" onclick="listUser(${beginNo-10})">이전</button>
					</li>
				</c:if>
				<c:forEach var="page" begin="${beginNo}" end="${endNo}" step="1">
					<c:if test="${page <= Math.ceil(totalCount/10)}">
						<c:choose>	
							<c:when test="${page==pageNo}">
								<li class="page-item active">
									<button type="button" class="page-link" onclick="listUser(${page})">${page}</button>						
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<button type="button" class="page-link" onclick="listUser(${page})">${page}</button>							
								</li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>								
				<c:if test="${totalCount > endNo*10}">						
				   	<li class="page-item">
						<button type="button" class="page-link" onclick="listUser(${beginNo+10})">다음</button>
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
function listUser(pageNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/usradm/listUser.do";	
	form.pageNo.value = pageNo;
	form.submit();
}
function readUser(userId){
	var form = document.pagingForm;
	form.action = "${contextPath}/usradm/readUser.do?userId=" + userId;
	form.submit();
}
function modifyUser(userId, event){
	event.stopPropagation();
	var form = document.pagingForm;
	form.action = "${contextPath}/usradm/modifyUser.do?userId=" + userId;
	form.submit();
}
function deleteUser(userId, event){
	event.stopPropagation();
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/usradm/deleteUser.do?userId=" + userId;
		form.submit();
	}
}
</script>

<%@ include file="../inc/adminBottom.jsp"%>