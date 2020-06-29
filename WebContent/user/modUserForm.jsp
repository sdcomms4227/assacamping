<%@page import="user.UserVO"%>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--JSTL의 core, formatting 라이브러리 태그들을 사용하기 위한 선언 --%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>    
    
<%-- http://localhost:8090/pro13/test03/modMemberForm.jsp  요청주소중에...
	 
	/pro13 컨텍스트 주소를 얻어 저장 
--%>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>  
 
<%
	//UserController서블릿으로부터 전달받은 request내장객체 메모리 영역의 데이터(MemberVO)
	//한글처리
	request.setCharacterEncoding("UTF-8");
%> 
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style type="text/css">
		.cls1{
			font-size: 40px;
			text-align: center;	
		}
	</style>
</head>
<body>
		<h1 class="cls1">회원정보 수정창</h1>
		
	<%--
		회원정보 수정창에서 수정할 회원 정보를 입력하고 수정하기 버튼을 클릭하면
		<form>태그의 action속성에 설정한 요청주소 /userCon/modUser.do와 수정할 회원 ID를 
		MemberController서블릿으로 전달해 수정을 요청 하도록 구현함.
	 --%>	
	<form action="${contextPath}/userCon/modUser.do?userId=${userInfo.userId}" method="post">
	
		<table align="center" >
			<tr>
				<td width="200"><p align="right">아이디</p></td>
				<td width="400">
					<input type="text" name="userId" value="${userInfo.userId}" disabled>
				</td>			
			</tr>
			<tr>
				<td width="200"><p align="right">비밀번호</p></td>
				<td width="400">
					<input type="password" name="userPw" value="${userInfo.userPw}">
				</td>	
			<tr>
				<td width="200"><p align="right">비밀번호확인</p></td>
				<td width="400">
					<input type="password" name="userPw2" value="${userInfo.userPw}">
				</td>				
			</tr>
			<tr>
				<td width="200"><p align="right">이름</p></td>
				<td width="400">
					<input type="text" name="userName" value="${userInfo.userName}">
				</td>			
			</tr>					
			<tr>
				<td width="200"><p align="right">전화번호</p></td>
				<td width="400">
					<input type="text" name="userPhone" value="${userInfo.userPhone}">
				</td>			
			</tr>		
			<tr>
				<td width="200"><p align="right">이메일</p></td>
				<td width="400">
					<input type="email" name="userEmail" value="${userInfo.userEmail}">
				</td>			
			</tr>	
			<tr>
				<td width="200"><p align="right">우편번호</p></td>
				<td width="400">
					<input type="text" name="userZipcode" value="${userInfo.userZipcode}">
				</td>			
			</tr>	
			<tr>
				<td width="200"><p align="right">주소</p></td>
				<td width="400">
					<input type="text" name="userAddress1" value="${userInfo.userAddress1}">
				</td>			
			</tr>	
			<tr>
				<td width="200"><p align="right">상세주소</p></td>
				<td width="400">
					<input type="text" name="userAddress2" value="${userInfo.userAddress2}">
				</td>			
			</tr>	
			<tr>
				<td width="200"><p align="right">가입일</p></td>
				<td width="400">
					<input type="text" name="userDate" value="${userInfo.userDate}" disabled >
				</td>
			<tr>
				<td width="200"><p align="right">회원유형</p></td>
				<td width="400">
					<input type="text" name="userUse" value="${userInfo.userUse}" disabled >
				</td>				
			</tr>			
			<tr align="center">
				<td colspan="2" width="400">
					<input type="submit" value="수정하기">
					<input type="reset" value="다시입력">
				</td>
			</tr>
		</table>
	</form>	
</body>
</html>









