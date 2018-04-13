<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="util.dbhelper.DBBoardLoad"%>
<%@ page import ="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	PrintWriter printWriter = response.getWriter();
	final String TIME = request.getParameter("time");
	final String ID   = (String)session.getAttribute("sessionId"); 
	
	DBBoardLoad dbBoardLoad = DBBoardLoad.getDBBoardLoad();
	boolean result = dbBoardLoad.isHost(TIME, ID);
	
	printWriter.print(result);
	printWriter.flush();
	printWriter.close();
	%>
</body>
</html>