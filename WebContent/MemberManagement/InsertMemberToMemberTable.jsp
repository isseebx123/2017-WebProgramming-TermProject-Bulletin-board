<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>InsertMemberToDB</title>
</head>
<body>
	<%
	final String driverName = "com.mysql.jdbc.Driver";
	final String URL 		= "jdbc:mysql://localhost:3306/WebProgrammingTermProject";
	final String DBID   	= "WebDBID";
	final String DBPW   	= "qwer1234";
 
    request.setCharacterEncoding("utf-8");
    final String ACTIVATION = "false";
    final String ID 	    = request.getParameter("id");
    final String PW 		= request.getParameter("pw");
    final String NAME		= request.getParameter("name");
    final String TEL		= request.getParameter("tel");
    final String EMAIL	    = request.getParameter("email");
    final String BIRTH 	    = request.getParameter("birth");
   
    Class.forName(driverName);
    Connection conn = DriverManager.getConnection(URL, DBID, DBPW);
   	
    //String.format()을 이용하여 Member테이블에 삽입하는 insert쿼리를 작성 
    final String sql = String.format("insert into Member values('%s','%s','%s','%s','%s','%s','%s')", ACTIVATION, ID, PW, NAME, TEL, EMAIL, BIRTH);
    final Statement stmt = conn.createStatement();
    final int isUpdate   = stmt.executeUpdate(sql);
   	
    stmt.close();
    conn.close();
%>
</body>
</html>