<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:choose>
	<c:when test='${msg=="fail"}'>
		<script type="text/javascript">
			window.onload = function(){
				window.alert("비밀번호가 일치하지 않습니다.");
			}
		</script>
	</c:when>
</c:choose>
<script>
function check(){
	if (document.f.userPw.value == "") {
        alert("비밀번호를 입력하지 않았습니다.")
        document.f.userPw.focus();
        return false;
    }
    if (f.userPw.value == f.userId.value) {
        alert("아이디와 비밀번호가 같습니다.")
        document.f.userPw.focus();
        return false;
    }
    if (document.f.userPw1.value != document.f.userPw2.value) {
        alert("새 비밀번호가 일치하지 않습니다")
        document.f.userPw2.value = ""
        document.f.userPw2.focus();
        return false;
    }
}
</script>
</head>
<body>
<form name="f" action="${contextPath}/userServlet/changePwAction.do" method="post" onsubmit="return check();">
	<h2>비밀번호 변경</h2>
	비밀번호를 입력해 주세요.<br>
	<input type="text" name="userId" value="${userInfo.userId}" hidden>
	<label>기존비밀번호</label>
		<input type="password" name="userPw" required>	
		<label>새 비밀번호</label>
		<input type="password" name="userPw1" required>		
		<label>새 비밀번호 재확인</label>
		<input type="password" name="userPw2" required>			
	<button type="submit">변경</button>
</form>
</body>
</html>