<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="userId" value="${userVO.userId}" />
<c:set var="userPw" value="${userVO.userPw}" />
<c:set var="userName" value="${userVO.userName}" />
<c:set var="userPhone" value="${userVO.userPhone}" />
<c:set var="userEmail" value="${userVO.userEmail}" />
<c:set var="userZipcode" value="${userVO.userZipcode}" />
<c:set var="userAddress1" value="${userVO.userAddress1}" />
<c:set var="userAddress2" value="${userVO.userAddress2}" />
<c:set var="userDate" value="${userVO.userDate}" />
<c:set var="userUse" value="${userVO.userUse}" />
<fmt:formatDate var="userFormattedDate" value="${userDate}" pattern="yyyy-MM-dd HH:mm" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">회원 관리</h2>
	</div>
</div>

<article class="user">
	<div class="row">
		<div class="col-12">
			<table class="table read-table table-layout-fixed">
				<colgroup>
					<col style="width:120px" />
					<col />
				</colgroup>
				<tbody>
					<tr>
						<th>아이디</th>
						<td>${userId}</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>${userPw}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${userName}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${userPhone}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${userEmail}</td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>${userZipcode}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${userAddress1}</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td>${userAddress2}</td>
					</tr>
					<tr>
						<th>회원상태</th>
						<td>
							<c:choose>
								<c:when test="${userUse==1}">
									<span>일반회원</span>
								</c:when>
								<c:otherwise>
									<span class="text-danger">탈퇴회원</span>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td>${userFormattedDate}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="text-center my-5">
		<button type="button" class="btn btn-secondary" onclick="listUser()">목록</button>							
		<button type="button" class="btn btn-warning" onclick="modifyUser('${userId}')">수정</button>
		<button type="button" class="btn btn-danger" onclick="deleteUser('${userId}')">삭제</button>
	</div>			
</article>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
</form>

<script>
function listUser(){
	var form = document.pagingForm;
	form.action = "${contextPath}/userAdminServlet/listUser.do";	
	form.submit();
}
function modifyUser(userId){
	var form = document.pagingForm;
	form.action = "${contextPath}/userAdminServlet/modifyUser.do?userId=" + userId;
	form.submit();
}
function deleteUser(userId){
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/userAdminServlet/deleteUser.do?userId=" + userId;
		form.submit();
	}
}
</script>

<%@ include file="../inc/adminBottom.jsp" %>