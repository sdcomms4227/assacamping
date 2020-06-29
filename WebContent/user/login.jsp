<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 

	<c:choose>
	<c:when test='${msg=="id"}'>
			<script type="text/javascript">
				window.onload = function(){
					alert("존재하지 않는 ID입니다.");
				}	
			</script>
		</c:when>
	</c:choose> 
	     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${contextPath}/userCon/loginAction.do" method="post">
	<h2>Log In</h2>
	<label>User ID</label>
		<input type="text" name="userId" placeholder="아이디를 입력하세요.">
	<label>Password</label>
		<input type="password" name="userPw" placeholder="비밀번호를 입력하세요.">		
	<button type="submit">Log In</button>
</form>
</body>
</html>