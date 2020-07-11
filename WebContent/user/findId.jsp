<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
<%
request.setCharacterEncoding("UTF-8");
String userId =(String)request.getAttribute("userId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:choose>
	<c:when test='${msg=="userId"}'>
		<script type="text/javascript">
			window.onload = function(){
				window.alert("회원정보가 존재하지 않습니다.");
			}
		</script>
	</c:when>
</c:choose>
</head>
<body>
<c:choose>
	<c:when test="${userId == null }">
		<form name="f" action="${contextPath}/userServlet/findId.do" method="post" onsubmit="return check();">
			<h2>아이디 찾기</h2>
				<label>이름</label>
					<input type="text" name="userName" required>	
				<label>이메일</label>
					<input type="text" name="userEmail" required>		
			<button type="submit">찾기</button>
		</form>
	</c:when>
	<c:otherwise>
		고객님의 아이디는 <%=userId%>입니다. <br>
		<a href="${contextPath}/user/login.jsp">로그인 페이지로 이동</a>
	</c:otherwise>  
</c:choose>	
</body>
</html>