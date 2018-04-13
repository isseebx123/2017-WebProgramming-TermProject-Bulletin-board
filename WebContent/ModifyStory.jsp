<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	final String driverName = "com.mysql.jdbc.Driver";
	final String URL 		= "jdbc:mysql://localhost:3306/WebProgrammingTermProject";
	final String DBID   	= "WebDBID";
	final String DBPW   	= "qwer1234";
 
    request.setCharacterEncoding("EUC-KR");
    final String TITLE		= request.getParameter("title");
    final String CONTENT	= request.getParameter("content");
    final String FILE	    = request.getParameter("file");
    final String TIME	    = request.getParameter("time");
 	final String BOARDNAME  = request.getParameter("boardname");
    Class.forName(driverName);
    Connection conn = DriverManager.getConnection(URL, DBID, DBPW);
   	
    //String.format()을 이용하여 Member테이블에 삽입하는 insert쿼리를 작성 
    final String SQL = String.format("UPDATE board SET title='%s', content='%s', file='%s' WHERE time='%s'", TITLE, CONTENT, FILE, TIME);
    final Statement stmt = conn.createStatement();
    final int isUpdate   = stmt.executeUpdate(SQL);
   	
    stmt.close();
    conn.close();
    
    /* 게시글수정 완료이후 URL3로 이동 */
    final String ID = request.getParameter("id");
    String URL3 = "./TP2_08_LookStory.jsp?time="+TIME+"&boardname="+BOARDNAME+"&id="+ID;
    response.sendRedirect(URL3);
    
%>
</body>
</html>