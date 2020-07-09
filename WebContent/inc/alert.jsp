<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<c:set var="alertMsg" value="${alertMsg}" />
<c:if test="${alertMsg!=null}">
	<script>
		alert("${alertMsg}");
	</script>
</c:if>