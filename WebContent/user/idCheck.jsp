<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8"); 
	String userId = request.getParameter("userId");
%>   
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:choose>
	<c:when test='${msg=="char"}'>
		<script type="text/javascript">
			window.onload = function(){
				window.alert("아이디를 4~12자까지 입력해주세요.");
			}
		</script>
	</c:when>
	<c:when test='${msg=="used"}'>
		<script type="text/javascript">
			window.onload = function(){
				window.alert("사용중인 아이디 입니다.");
			}
		</script>
	</c:when>
	<c:when test='${msg=="allow"}'>
		<script type="text/javascript">
			window.onload = function(){
				window.alert("사용가능한 아이디 입니다.");
			}
		</script>
	</c:when>
</c:choose>
</head>
<body>
<form action="${contextPath}/userCon/idCheck.do" method="post" name="f">
	아이디:<input type="text" name="userId" value="<%=userId %>">
	<input type = "submit" value="중복확인">
</form>
<input type="button" value="사용함" onclick="result()">
<script type="text/javascript">
function result(){
	opener.document.f.userId.value = document.f.userId.value;
	window.close();
}
</script>
</body>
</html>