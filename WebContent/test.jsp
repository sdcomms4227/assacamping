<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	try{
		Context init = new InitialContext();
		
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/assa");
		conn = ds.getConnection();
		
		if(conn!=null)
			out.println("연결성공......");
	}catch(Exception e){
		e.printStackTrace();
	}

%>
</body>
</html>