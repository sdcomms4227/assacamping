<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.cls1{
		font-size: 40px;
		text-align: center;
	}
	.cls2{
		font-size: 20px;
		text-align: center;
	}
</style>
<div>
	<jsp:include page="/user/top.jsp"/>  
	
</div>

	<c:choose>
		<%--회원 삭제에 성공 했다면 --%>
		<c:when test='${msg=="deleted"}'>
			<script type="text/javascript">
				window.onload = function(){
					alert("회원정보를 삭제 했습니다.");
				}	
			</script>
		</c:when>
	
		<%--회원 추가에 성공 했다면 --%>
		<c:when test='${requestScope.msg == "addUser"  }'>
			<script type="text/javascript">
				window.onload = function(){
					window.alert("회원을 등록했습니다.");	
				}		
			</script>
		</c:when>
		<%--수정에 성공 했다면 --%>
		<c:when test='${requestScope.msg == "modified" }'>
			<script type="text/javascript">
				window.onload = function(){
					window.alert("회원정보를 수정했습니다.");	
				}		
		</script>
		</c:when>	
		
		<c:when test='${requestScope.msg == "logout" }'>
			<script type="text/javascript">
				window.onload = function(){
					window.alert("로그아웃 되었습니다.");	
				}		
		</script>
		</c:when>	
	</c:choose>


</head>
<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


	<p class="cls1">회원정보</p>
	<table border="1" align="center" >
		<tr align="center" bgcolor="lightgreen">
			<td width="7%"><b>아이디</b></td>
			<td width="7%"><b>비밀번호</b></td>
			<td width="7%"><b>이름</b></td>
			<td width="7%"><b>전화번호</b></td>
			<td width="7%"><b>이메일</b></td>
			<td width="7%"><b>우편번호</b></td>		
			<td width="7%"><b>주소</b></td>
			<td width="7%"><b>상세주소</b></td>
			<td width="7%"><b>가입날짜</b></td>
			<td width="7%"><b>회원유형</b></td>
			<td width="7%"><b>수정</b></td>
			<td width="7%"><b>삭제</b></td>
		</tr>
<c:choose>
	<%--request객체영역에 검색한 회원정보(ArrayList)가 존재 하지 않으면? --%>
	<c:when test="${requestScope.usersList == null}">
		<tr>
			<td colspan="5"><b>등록된 회원이 없습니다.</b></td>
		</tr>
	</c:when>
	<%--검색한 회원정보 가 존재 하면? --%>
	<c:when test="${usersList != null}">
		<c:forEach  var="userVO"  items="${usersList}">
		<tr align="center">
			<td>${userVO.userId}</td>
			<td>${userVO.userPw }</td>
			<td>${userVO.userName }</td>
			<td>${userVO.userPhone }</td>
			<td>${userVO.userEmail }</td>
			<td>${userVO.userZipcode }</td>
			<td>${userVO.userAddress1 }</td>
			<td>${userVO.userAddress2 }</td>
			<td>${userVO.userDate }</td>
			<td>${userVO.userUse }</td>
			
			<%-- 수정, 삭제를 위해 회원의 ID를 전달해 수정과 삭제 요청을 합니다. --%>
			<td><a href="${contextPath}/usr/modUserForm.do?userId=${userVO.userId}">수정</a></td>
			<td><a href="${contextPath}/usr/delUser.do?userId=${userVO.userId}">삭제</a></td> 
		</tr>
		</c:forEach>
	</c:when>
</c:choose>	
	</table>
	
	<p class="cls2">
	<a href="${contextPath}/usr/userForm.do"> 회원가입하기  || </a>
	<a href="${contextPath}/usr/login.do"> 로그인</a>
	</p>	
		
	
	
		
		
	</a>
</body>
</html>










