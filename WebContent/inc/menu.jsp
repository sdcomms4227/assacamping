<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="menu d-flex flex-column align-items-end justify-content-start text-right menu_mm trans_400">
	<div class="menu_close_container"><div class="menu_close"><div></div><div></div></div></div>
	<div class="logo menu_mm"><a href="${contextPath}">ASSA</a></div>
	<div class="search">
		<form action="#">
			<input type="search" class="search_input menu_mm" required="required">
			<button type="submit" id="search_button_menu" class="search_button menu_mm"><img class="menu_mm" src="${contextPath}/images/magnifying-glass.svg" alt=""></button>
		</form>
	</div>
	<nav class="menu_nav">
		<ul class="menu_mm">
			<li class="menu_mm"><a href="${contextPath}/admin/admin.jsp">관리자모드</a></li>
		</ul>
	</nav>
</div>