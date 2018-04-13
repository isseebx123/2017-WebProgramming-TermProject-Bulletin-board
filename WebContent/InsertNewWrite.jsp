<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.util.*, java.text.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	final String driverName = "com.mysql.jdbc.Driver";
	final String URL 		= "jdbc:mysql://localhost:3306/WebProgrammingTermProject";
	final String DBID   	= "WebDBID";
	final String DBPW   	= "qwer1234";
 
    request.setCharacterEncoding("EUC-KR");
    final String BOARDNAME  = request.getParameter("boardname");
    final String TITLE		= request.getParameter("title");
    final String CONTENT	= request.getParameter("content");
    final String FILE	    = request.getParameter("file");
    
    /* 아래 시간과 아이디는 서버에서 작성 */
    String ID 		= (String)session.getAttribute("sessionId");
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yy.MM.dd. HH:mm:ss");
    final String TIME = formatter.format(new java.util.Date());
   
    Class.forName(driverName);
    Connection conn = DriverManager.getConnection(URL, DBID, DBPW);
   	
    //String.format()을 이용하여 Member테이블에 삽입하는 insert쿼리를 작성 
    final String sql = String.format("insert into board values('%s','%s','%s','%s','%s','%s')", BOARDNAME, TIME, ID, TITLE, CONTENT, FILE);
    final Statement stmt = conn.createStatement();
    final int isUpdate   = stmt.executeUpdate(sql);
   	
    stmt.close();
    conn.close();
    
    /* 게시글작성 완료이후 URL2로 이동 */
    String URL2 = "./TP2_";
    if(BOARDNAME.equals("FreeBoard")) URL2 = URL2 + "03_FreeBoard.jsp";
    else if(BOARDNAME.equals("AnonymousBoard")) URL2 = URL2 + "02_AnonymousBoard.jsp";
    else if(BOARDNAME.equals("Gallery")) URL2 = URL2 + "04_Gallery.jsp";
    response.sendRedirect(URL2);
%>
</body>
</html>