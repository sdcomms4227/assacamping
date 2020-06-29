<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역확인</title>
</head>
<body>
	<h1 align="center">주문내역확인</h1>
	<form action="${contextPath}/order/*" method="post">
		<input type="hidden" value="">
		<table border="1" align="center" width="30%">
			<tr align="center">
				<th>주문자성명</th>
				<td>${orderList.userName}</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>gg</td>
			</tr>
			<tr>
				<th>총가격</th>
				<td>dd</td>
			</tr>
		</table>
	</form>
	<h2 align="center">주문해주셔서 감사합니다.</h2>
	<div align="center">
	<a href="${contextPath}/">홈</a>
	<a href="${contextPath}/ }">마이페이지</a>
	</div>
</body>
</html>