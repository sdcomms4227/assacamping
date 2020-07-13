<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<div class="menu d-flex flex-column align-items-end justify-content-start text-right menu_mm trans_400">
	<div class="menu_close_container"><div class="menu_close"><div></div><div></div></div></div>
	<div class="logo menu_mm"><a href="${contextPath}">ASSA</a></div>
	<div class="search">
		<form action="#">
			<input type="search" class="search_input menu_mm" required="required">
			<button type="submit" id="search_button_menu" class="search_button menu_mm"><img src="${contextPath}/images/magnifying-glass.svg" alt=""></button>
		</form>
	</div>
	<nav class="menu_nav">
		<hr />
		<ul>
			<li><a href="${contextPath}/productServlet/listProduct.do">캠핑상품</a></li>
			<li><a href="${contextPath}/campingServlet/listCamping.do">캠핑정보</a></li>
			<li><a href="${contextPath}/center/contact.jsp">고객센터</a></li>
			<li><a href="#">추가메뉴</a></li>
		</ul>
		<hr />
		<ul>
			<li><a href="${contextPath}/adminServlet/admin.do">관리자모드</a></li>
		</ul>
		<hr />
	</nav>
</div>