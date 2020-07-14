<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:choose>
	<c:when test='${msg=="userPw"}'>
		<script type="text/javascript">
			window.onload = function(){
				window.alert("비밀번호를 이메일로 전송하였습니다.");
			}
		</script>
	</c:when>
</c:choose>
</head>
<body>
		<form name="f" action="${contextPath}/userCon/findPw.do" method="post" >
			<h2>아이디 찾기</h2>
				<label>아이디</label>
					<input type="text" name="userId" required>	
				<label>이메일</label>
					<input type="text" name="userEmail" required>		
			<button type="submit">비밀번호 찾기</button>
		</form>
		<a href="${contextPath}/user/login.jsp">로그인 페이지로 이동</a>
</body>
</html>