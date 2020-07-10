<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
<header>
	<%
		request.setCharacterEncoding("UTF-8");
		String userId = (String) session.getAttribute("userId");
		if (userId != null) {
	%>
	<div id="login">
		<a href="/modUserForm.jsp?userId=${userId }">${userId }</a>님 로그인중...
		|| <a href="${contextPath}/usr/logout.do">logout</a>
	</div>
	<%
		}
	%>

</header>