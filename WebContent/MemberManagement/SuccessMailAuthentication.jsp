<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="util.dbhelper.DBconn"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import ="java.io.*" %>
<%@ page import="java.util.Enumeration" %>
<%@page import="java.sql.DriverManager"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="./css/SuccessMailAuthentication.css">
<title>Insert title here</title>
</head>
<body>
	<main>
		<%
		request.setCharacterEncoding("euc-kr");
		
	    final String ACTIVATION = "true";
	   	final String ID 		= request.getParameter("id");
	    
	   	final String driverName = "com.mysql.jdbc.Driver";
		final String URL 		= "jdbc:mysql://localhost:3306/WebProgrammingTermProject";
		final String DBID   	= "WebDBID";
		final String DBPW   	= "qwer1234";
	   
	    Class.forName(driverName);
	    Connection conn = DriverManager.getConnection(URL, DBID, DBPW);
	   
	    //String.format()을 이용하여 Member테이블에 Update하는 쿼리를 작성 
	    final String SQL = String.format("UPDATE Member SET activation='%s' WHERE id='%s'", ACTIVATION, ID);
	     
	    final Statement stmt = conn.createStatement();
	    final int isUpdate   = stmt.executeUpdate(SQL);
	   
	    stmt.close();
	    conn.close(); // Database 해제

		%>
		
		<button onclick="location.href='Login.jsp'">로그인 페이지 이동</button>
	</main>
</body>
</html>